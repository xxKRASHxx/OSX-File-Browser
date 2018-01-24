//
//  RxStore.m
//  Redux
//
//  Created by lzhu on 8/4/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RxStore.h"
#import "NSArray+Redux.h"
#import <stdatomic.h>

@interface RxSubscription : NSObject

@property (weak, nonatomic) id<RxSubscriber> subscriber;
@property (copy, nonatomic) RxStateSelector stateSelector;

@end

@implementation RxSubscription @end

@interface RxStore() {
    atomic_flag _lock;
}

@property (copy, nonatomic) RxDispatchFunction dispatchFunction;
@property (copy, nonatomic) RxReducer reducer;
@property (strong, nonatomic) NSMutableArray *subscriptions;
@property (strong, nonatomic, readwrite) id<RxState> state;

@end


@implementation RxStore

#pragma mark - Lifecycle

- (instancetype)initWithState:(id<RxState>)rootState reducer:(RxReducer)rootReducer {
    return [self initWithState:rootState reducer:rootReducer middlewares:@[]];
}

- (instancetype)initWithState:(id<RxState>)rootState
                      reducer:(RxReducer)rootReducer
                  middlewares:(NSArray<RxMiddleware>*)middlewares {
    self = [super init];
    if (self) {
        self.reducer = rootReducer;
        self.state = rootState;
        self.subscriptions = [NSMutableArray array];
        [self initialSetup:middlewares];
    }

    return self;
}

- (void)initialSetup:(NSArray<RxMiddleware> *)middlewares {

    atomic_flag_clear(&_lock);
    weakify(self);

    RxDispatchFunction defaultDispatch = ^id(id<RxAction> action) {
        strongify(self);
        wait(atomic_flag_test_and_set(&_lock));
        self.state = self.reducer(action, self.state);
        atomic_flag_clear(&_lock);
        return action;
    };

    RxGetState getState = ^id<RxState>() {
        strongify(self);
        return self.state;
    };

    RxDispatchFunction retryDispatch = ^id(id<RxAction> action) {
        strongify(self);
        return [self dispatch:action];
    };

    self.dispatchFunction =
    middlewares.reverse.reduce(defaultDispatch, ^id(RxDispatchFunction df, RxMiddleware mw) {
        return mw([retryDispatch copy], [getState copy])(df);
    });

    if (self.state == nil) { NSAssert(NO, @"should have initial state."); }
}

#pragma mark - Override

- (void)setState:(id<RxState>)state {
    [self willChangeValueForKey:@"state"];
    _state = state;
    [self onStateChanged];
    [self didChangeValueForKey:@"state"];
}

#pragma mark - <RxStore>

- (void)subscribe:(id<RxSubscriber>)subscriber {
    [self subscribe:subscriber withStateSelector:nil];
}

- (void)subscribe:(id<RxSubscriber>)subscriber withStateSelector:(RxStateSelector)stateSelector {
    if ([self isNewSubscriber:subscriber]) {
        RxSubscription *sub = [[RxSubscription alloc] init];
        sub.subscriber = subscriber;
        sub.stateSelector = stateSelector;
        [self.subscriptions addObject:sub];
    }
    if (self.state) {
        [subscriber onStateChanged:stateSelector?stateSelector(self.state) : self.state];
    }
}

- (void)unsubscribe:(id<RxSubscriber>)subscriber {
    [self.subscriptions removeObject:[self subscriptionWithSubscriber:subscriber]];
}

- (id)dispatch:(id<RxAction>)action {
    return self.dispatchFunction(action);
}

#pragma mark - Private

- (BOOL)isNewSubscriber:(id<RxSubscriber>)subscriber {
    return [self subscriptionWithSubscriber:subscriber] == nil;
}

- (RxSubscription *)subscriptionWithSubscriber:(id<RxSubscriber>)subscriber {
    return [self.subscriptions find:^BOOL(RxSubscription *subscription) {
        return subscription.subscriber == subscriber;
    }];
}

- (void)onStateChanged {
    [self.subscriptions each:^(RxSubscription *sub) {
        id<RxState> state = sub.stateSelector? sub.stateSelector(self.state) : self.state;
        [sub.subscriber onStateChanged:state];
    }];
}

@end
