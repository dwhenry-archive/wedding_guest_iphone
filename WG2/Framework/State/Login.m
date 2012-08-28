//
//  Login.m
//  WG
//
//  Created by David Henry on 28/08/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "Login.h"

@implementation Login

- (id)initWithFrame:(CGRect)frame andManager:(AppStateManager *)pManager
{
    self = [super initWithFrame:frame andManager:pManager];
    if (self) {
        // Initialization code
        NSLog(@"TODO: add remember user functionality");
    }
    return self;
}
-(void) Render 
{
    CGContextRef g = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(g, [UIColor grayColor].CGColor);
    CGContextFillRect(g, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));

    CGContextSetFillColorWithColor(g, [UIColor blackColor].CGColor);
    [@"Login" drawAtPoint:CGPointMake(10.0, 20.0) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    
}
@end
