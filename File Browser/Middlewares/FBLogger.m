//
//  FBLogger.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBLogger.h"

RxMiddleware FBActionLogger = ImplementMiddleware({
    printf("\nACTION %s\n", [action description].UTF8String);
    next(action);
    return action;
})


RxMiddleware FBStateLogger = ImplementMiddleware({
    next(action);
    printf("\nSTATE %s\n", [getState() description].UTF8String);
    return action;
})
