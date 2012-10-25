//
//  UIActionButton.h
//  WG2
//
//  Created by DAVID HENRY on 25/10/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewWithBorder.h"

@interface UIActionButton : UIViewWithBorder
-(id)initWithText:(NSString*)labelText andImage:(NSString*)imagePath at:(CGPoint) location;

@end
