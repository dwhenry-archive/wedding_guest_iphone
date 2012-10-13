//
//  Login.m
//  WG
//
//  Created by David Henry on 28/08/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "Login.h"
#import "WeddingList.h"
#import "UIViewWithBorder.h"
//#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

@implementation Login
UITextField* loginField;
UITextField* passwordField; 
bool rendered;
UILabel *label;
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
    if(rendered)
        return;

    rendered = true;
    [self setBackground];
    [self addHeader: @"Wedding Guests"];
    
    loginField = [self addField: @"Login"];
    loginField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    loginField.autocorrectionType = UITextAutocorrectionTypeNo;
    loginField.keyboardType = UIKeyboardTypeEmailAddress;
    
    passwordField = [self addField: @"Password"];
    passwordField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
    passwordField.secureTextEntry = YES;
    
    [self addButton: @"Submit" calling:@selector(login)];
}
-(void)addButton:(NSString*)buttonName calling:(SEL)methodName
{
    UIViewWithBorder *button = [[UIViewWithBorder alloc] 
                                initWithFrame:CGRectMake(60, top + 10, IPHONE_WIDTH - 120, 40)
                                andText:buttonName];

    [button addTouchUpEvent:self action:methodName];

    [self addSubview:button];
    top = top + 50;
}
-(void)login
{
    NSString *host = @"http://localhost:3000";
    NSString *urlString=[NSString stringWithFormat:@"%@/users/sign_in.json", host];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setPostValue:loginField.text forKey:@"user[login]"];
    [request setPostValue:passwordField.text forKey:@"user[password]"];
    
    [request startSynchronous];
    if ([request responseStatusCode] == 200) {
        NSString *authToken = [request responseString];
        m_pManager.authToken = authToken;
        [m_pManager doStateChange:[WeddingList class]];
    } else {
        [self setMessage: @"Invalid username/password"];
        // put up some sort fo failure message..
    }
}
-(void)setMessage:(NSString*)message
{
    if (label == NULL) { 
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, top, IPHONE_WIDTH, 35)];
        label.font = [UIFont fontWithName:@"Helvetica-Bold" size:14]; //[UIFont systemFontOfSize: 30];
        label.textAlignment = UITextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
    }
    label.text = message;
    [self addSubview:label];
        
    top = top + 65;
   
}
@end
