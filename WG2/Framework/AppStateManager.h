//
//  AppStateManager.h
//  WG
//
//  Created by David Henry on 28/08/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//
#define IPHONE_WIDTH 320
#define IPHONE_HEIGHT 480

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "UITextFieldExtended.h"

@interface AppStateManager : NSObject

-(void) doStateChange: (Class) state;
@end
