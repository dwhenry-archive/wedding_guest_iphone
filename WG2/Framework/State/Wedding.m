//
//  Wedding.m
//  WG2
//
//  Created by DAVID HENRY on 14/10/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "Wedding.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"
#import "Login.h"
#import "ViewController.h"
#import "Gifts.h"

@implementation Wedding
bool rendered;
bool backgroundRendered;
NSString* weddingUrl;
NSDictionary* details;

- (id)initWithFrame:(CGRect)frame andManager:(AppStateManager *)pManager
{
    self = [super initWithFrame:frame andManager:pManager];
    if (self) {
        // Initialization code
        NSLog(@"On wedding screen");
    }
    rendered = false;
    backgroundRendered = false;
    weddingUrl = NULL;
    return self;
}

-(void)setWeddingUrl:(NSString*)_weddingUrl
{
    NSString *urlString=[NSString stringWithFormat:@"%@%@.json?auth_token=%@", m_pManager.host, _weddingUrl, m_pManager.authToken];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    [request startSynchronous];
    if ([request responseStatusCode] == 200) {
        details = [[request responseString] objectFromJSONString];
        weddingUrl = _weddingUrl;
    } else {
        [m_pManager doStateChange:[Login class]];
        [(id)m_pManager.viewController.view setMessage: @"Connection failure\nUnable to retrieve Wedding Details" ];
    }
}
-(void) Render
{
    if(!backgroundRendered) {
        backgroundRendered = true;
        top = 40;
        [self setBackground];
    }
    
    if(rendered || weddingUrl == NULL) {
        return;
    }
    
    rendered = true;
    
    [self addHeader:[details objectForKey:@"wedding"]];
    
    [self addActionButton:@"Details"    withImage:@"" calling:@selector(action)];
    [self addActionButton:@"Table"      withImage:@"" calling:@selector(action)];
    [self addActionButton:@"Address"    withImage:@"" calling:@selector(address)];
    [self addActionButton:@"Gift List"  withImage:@"gift.jpg" calling:@selector(gifts)];
    [self addActionButton:@"Hotels"     withImage:@"hotel.jpg" calling:@selector(action)];
    [self addActionButton:@"Taxi"       withImage:@"" calling:@selector(action)];

    [self addButton: @"Refresh" calling:@selector(refresh)];
    [self addButton: @"Back" calling:@selector(previousView)];
    
}
-(void)gifts
{
    [m_pManager doStateChange:[Gifts class]];
    Gifts* gifts = (Gifts*)[m_pManager viewController].view;
    [gifts setWeddingUrl: weddingUrl andDetails:details];
}
-(void)action
{
}
-(void)refresh {
    [m_pManager doStateChange:[Wedding class]];
    Wedding* wedding = (Wedding*)[m_pManager viewController].view;
    [wedding setWeddingUrl: weddingUrl];

}
@end

