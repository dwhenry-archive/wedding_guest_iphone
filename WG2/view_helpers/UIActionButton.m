//
//  UIActionButton.m
//  WG2
//
//  Created by DAVID HENRY on 25/10/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "UIActionButton.h"

@implementation UIActionButton

-(id)initWithText:(NSString*)labelText andImage:(NSString*)imagePath at:(CGPoint) location
{
    CGRect frame = CGRectMake(location.x, location.y, 80, 80);
    self = [self initWithFrame:frame];
    if (self) {
        if(imagePath != @"") {
            [self setBackground:imagePath];
        }
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, 80, 10)];
        label.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];
        label.text = labelText;
        label.textAlignment = UITextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        [self.view addSubview:label];
    }
    return self;
}
-(void) setBackground:(NSString*)imagePath
{
    UIImage * image = [[UIImage imageNamed:imagePath] resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile];
    
    UIImageView *container = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    
    container.image = image;
    
    [self addSubview:container];
}
@end
