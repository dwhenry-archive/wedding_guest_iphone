//
//  WeddingList.m
//  WG2
//
//  Created by David Henry on 02/10/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "WeddingList.h"
#import "ASIHTTPRequest.h"
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
-(NSArray*)weddings
{
    NSString *host = @"http://localhost:3000";
    NSString *urlString=[NSString stringWithFormat:@"%@/weddings.json", host];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    NSArray *aa;
    [request startSynchronous];
    if ([request responseStatusCode] == 200) {
        aa = [NSArray init];
        return aa;
    } else {
        NSLog(@"pooo");
        return aa;
//        [self setMessage: @"Invalid username/password"];
        // put up some sort fo failure message..
    }
    
}
@end
