//
//  FBDropView.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/23/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBDropView.h"

NSString *kPrivateDragUTI = @"com.daniel-lisovoy.File-Browser.DragNDrop";

@interface FBDropView()

@property (nonatomic, assign) BOOL highlight;

@end

@implementation FBDropView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self registerForDraggedTypes:NSImage.imageTypes];
}

- (void)setImage:(NSImage *)image {}

- (void)drawRect:(NSRect)dirtyRect {

    [super drawRect:dirtyRect];

    if (self.highlight) {
        [[NSColor grayColor] set];
        [NSBezierPath setDefaultLineWidth:5];
        [NSBezierPath strokeRect:dirtyRect];
    }
}

#pragma mark - <NSDraggingDestination>

- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender {

    if ([NSImage canInitWithPasteboard:
         [sender draggingPasteboard]] && [sender draggingSourceOperationMask] & NSDragOperationCopy) {
        self.highlight = YES;
        [self setNeedsDisplay:YES];
        return NSDragOperationCopy;
    }
    return NSDragOperationNone;
}

- (void)draggingExited:(id<NSDraggingInfo>)sender {
    self.highlight = NO;
    [self setNeedsDisplay:YES];
}

- (BOOL)prepareForDragOperation:(id<NSDraggingInfo>)sender {
    self.highlight = NO;
    [self setNeedsDisplay:YES];
    return [NSImage canInitWithPasteboard:sender.draggingPasteboard];
}

- (BOOL)performDragOperation:(id<NSDraggingInfo>)sender {
    if (sender.draggingSource != self && self.uploadAtURL) {
        self.uploadAtURL([NSURL URLFromPasteboard:sender.draggingPasteboard]);
    }
    return YES;
}

- (BOOL)acceptsFirstMouse:(NSEvent *)theEvent {
    return YES;
}

@end

