//
//  WeddingList.m
//  WG2
//
//  Created by David Henry on 02/10/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "WeddingList.h"
bool rendered;

@implementation WeddingList

- (id)initWithFrame:(CGRect)frame andManager:(AppStateManager *)pManager
{
    self = [super initWithFrame:frame andManager:pManager];
    if (self) {
        // Initialization code
        NSLog(@"TODO: add remember user functionality");
    }
    rendered = false;
    return self;
}
-(void) Render 
{
    if(rendered)
        return;
    
    rendered = true;
    [self setBackground];
    [self addHeader: @"Wedding Guests"];
    [self addHeader: @"Weddings" withSize: 2];
    
//    loginField = [self addField: @"Login"];
//    loginField.autocapitalizationType = UITextAutocapitalizationTypeNone;
//    loginField.autocorrectionType = UITextAutocorrectionTypeNo;
//    loginField.keyboardType = UIKeyboardTypeEmailAddress;
//    
//    passwordField = [self addField: @"Password"];
//    passwordField.autocapitalizationType = UITextAutocapitalizationTypeNone;
//    passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
//    passwordField.secureTextEntry = YES;
//    
//    [self addButton: @"Submit" calling:@selector(login)];
}

@end
