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
        NSLog(@"On Login Screen");
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
-(void)login
{
    NSString *urlString=[NSString stringWithFormat:@"%@/users/sign_in.json", m_pManager.host];
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
-(void)setMessageValue:(NSString*)message
{
    if (label == NULL) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, top, IPHONE_WIDTH, 35)];
        label.numberOfLines = 0;
        label.font = [UIFont fontWithName:@"Helvetica-Bold" size:14]; //[UIFont systemFontOfSize: 30];
        label.textAlignment = UITextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
    }
    label.text = message;
    [self addSubview:label];
        
    top = top + 65;
   
}
-(void)setMessageTimer:(NSTimer*)timer
{
    NSString* message;
    message = (NSString*)[timer userInfo];
    [self setMessage:message];
}
-(void)setMessage:(NSString*)message
{
    if (!rendered) {
        [NSTimer scheduledTimerWithTimeInterval:0.33
                                         target:self
                                       selector:@selector(setMessageTimer:)
                                       userInfo:message repeats:NO];
        return;
    } else {
        [self setMessageValue: message];
    }
    
}
@end
