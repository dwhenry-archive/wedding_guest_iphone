//
//  UIViewWithBorder.h
//  WeddingGuest
//
//  Created by David Henry on 17/07/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewWithBorder : UIView
@property (nonatomic, retain) UIView *view;
@property (nonatomic, retain) UIButton *button;

-(id)initWithFrame:(CGRect)frame andText:(NSString*)labelText;
-(void)addTouchUpEvent:(id)target action:(SEL)action;
@end
