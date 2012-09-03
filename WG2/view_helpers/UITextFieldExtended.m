//
//  UITextFieldExtended.m
//  WG2
//
//  Created by David Henry on 28/08/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//
#import <objc/runtime.h>

static char defaultHashKey;

#import "UITextFieldExtended.h"

@implementation UITextField (Extended)

- (UITextField*) nextTextField { 
    return objc_getAssociatedObject(self, &defaultHashKey); 
}

- (void) setNextTextField:(UITextField *)nextTextField{
    objc_setAssociatedObject(self, &defaultHashKey, nextTextField, OBJC_ASSOCIATION_RETAIN_NONATOMIC); 
}


@end
