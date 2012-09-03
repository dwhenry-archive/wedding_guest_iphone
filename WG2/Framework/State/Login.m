//
//  Login.m
//  WG
//
//  Created by David Henry on 28/08/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "Login.h"
#import "UIViewWithBorder.h"

@implementation Login
UITextField* loginField;
UITextField* passwordField; 
bool rendered;
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
//-(void)autologin
//{
////    [UIDevice currentDevice].uniqueIdentifier;
//    NSString *url = [NSString stringWithFormat:@"http://localhost:3000/know_user?uuid=%@",[UIDevice currentDevice].uniqueIdentifier];
//    [self postJsonToUrl:url];
//}
-(void)login
{
    const char *bytes = [[NSString stringWithFormat:@"user_login=%@&user_password=%@", loginField.text, passwordField.text] UTF8String];

    NSString *host = @"http://localhost:3000";
    NSString *urlString=[NSString stringWithFormat:@"%@/users/sign_in.json", host];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[NSData dataWithBytes:bytes length:strlen(bytes)]];
    
    NSURLResponse *response;
    NSError *err;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSLog(@"responseData: %@", responseData);
    NSLog(@"Error: %@", err);
}
-(void)postJsonToUrl:(NSString*)url 
{
//    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/weddings.json"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    
    id result;
    if(jsonData != nil)
    {
        NSError *error = nil;
        result = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        if (error == nil) {
            NSLog(@"%@", result);
//            return result;
        } else {
            NSLog(@"%@", error);
        }
    }
}
@end
