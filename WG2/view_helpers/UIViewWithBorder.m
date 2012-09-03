//
//  UIViewWithBorder.m
//  WeddingGuest
//
//  Created by David Henry on 17/07/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "UIViewWithBorder.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIViewWithBorder
@synthesize view;
@synthesize button;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        
        self.layer.cornerRadius = 8;
        //    view.clipsToBounds = YES;
        self.layer.masksToBounds = YES;

        self.view = [self subview:frame.size];
        [super addSubview: self.view];
        self.button = [self button:frame.size];
        [super addSubview: self.button];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame andText:(NSString*)labelText
{
    self = [self initWithFrame:frame];
    if (self) {
        CGSize size = self.view.frame.size;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        label.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];;
        label.text = labelText;
        label.textAlignment = UITextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        [self.view addSubview:label];
    }
    return self;
}
-(UIView*)subview:(CGSize)size
{
    CGRect viewRect = CGRectMake(2, 2, size.width - 4, size.height - 4);
    UIView *subView = [[UIView alloc] initWithFrame:viewRect];

    subView.backgroundColor = [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0];

//    subView.backgroundColor = [UIColor grayColor];
    
    subView.layer.cornerRadius = 6;
    subView.layer.masksToBounds = YES;
    return subView;
}
-(UIButton*)button:(CGSize)size
{
    CGRect viewRect = CGRectMake(0, 0, size.width, size.height);
    UIButton *overlayButton = [[UIButton alloc] initWithFrame:viewRect];
    
    return overlayButton;
}
-(void)addTouchUpEvent:(id)target action:(SEL)action
{
    [self.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
-(void)addSubview:(UIView*)newView
{
    [view addSubview:newView];
}
@end
