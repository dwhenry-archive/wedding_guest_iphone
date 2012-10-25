//
//  UIViewWithBorder.m
//  WeddingGuest
//
//  Created by David Henry on 17/07/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "UIRowWithImage.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIRowWithImage
@synthesize view;
@synthesize button;
@synthesize weddingUrl = _weddingUrl;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        
//        self.layer.cornerRadius = 8;
//        //    view.clipsToBounds = YES;
//        self.layer.masksToBounds = YES;
        
        self.view = [self subview:frame.size];
        [super addSubview: self.view];
        self.button = [self button:frame.size];
        [super addSubview: self.button];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame andText:(NSString*)labelText andImageUrl:(NSString *)imageUrl andWeddingUrl:(NSString*)weddingUrl
{
    self = [self initWithFrame:frame];
    if (self) {
        self.weddingUrl = weddingUrl;
        [self.view addSubview:[self createImage:imageUrl]];
        [self.view addSubview:[self createLabel:labelText]];
    }
    return self;
}
-(UIView*)createImage:(NSString*)imageUrl
{
    CGSize size = self.view.frame.size;
    
    NSURL * imageURL = [NSURL URLWithString:imageUrl];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * image = [UIImage imageWithData:imageData];
    UIImageView *container = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1, size.height - 2, size.height - 2)];
    container.contentMode = UIViewContentModeScaleAspectFit;
    container.image = image;
    
    return container;
}
-(UIView*)createLabel:(NSString*)labelText
{
    CGSize size = self.view.frame.size;
    int width = size.width - size.height;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(size.height + 2, 0, width - 2, size.height)];
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];;
    label.text = labelText;
    label.textAlignment = UITextAlignmentLeft;
    label.backgroundColor = [UIColor clearColor];
    return label;
}
-(UIView*)subview:(CGSize)size
{
    CGRect viewRect = CGRectMake(0, 1, size.width, size.height - 2);
    UIView *subView = [[UIView alloc] initWithFrame:viewRect];
    
//    subView.backgroundColor = [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0];
    subView.backgroundColor = [UIColor whiteColor];
    
    //    subView.backgroundColor = [UIColor grayColor];
    
//    subView.layer.cornerRadius = 6;
//    subView.layer.masksToBounds = YES;
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
