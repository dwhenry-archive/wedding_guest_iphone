//
//  Gifts.m
//  WG2
//
//  Created by DAVID HENRY on 25/10/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "Gifts.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"
#import "Login.h"
#import "ViewController.h"
#import "NewGift.h"

@implementation Gifts
NSArray *gifts;
NSString* weddingUrl;
NSDictionary* details;
bool backgroundRendered;
bool rendered;

- (id)initWithFrame:(CGRect)frame andManager:(AppStateManager *)pManager
{
    self = [super initWithFrame:frame andManager:pManager];
    if (self) {
        // Initialization code
        NSLog(@"On gifts screen");
    }
    backgroundRendered = false;
    rendered = false;
    return self;
}

-(void)setWeddingUrl:(NSString*)_weddingUrl andDetails:(NSDictionary*)_details
{
    details = _details;
    
    NSString *urlString=[NSString stringWithFormat:@"%@%@/gifts.json?auth_token=%@", m_pManager.host, _weddingUrl, m_pManager.authToken];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    [request startSynchronous];
    if ([request responseStatusCode] == 200) {
        gifts = [[request responseString] objectFromJSONString];
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

    [self addHeader:[details objectForKey:@"wedding"] withSize:2];
    [self addHeader:@"Gifts" withSize:2 andBorder:true];
    
    bool editable = [details objectForKey:@"editable"];
    if(editable) {
        [self addButton: @"Add Gift" calling:@selector(newGift)];
    }
    [self addButton: @"Back" calling:@selector(previousView)];
}
-(void)newGift
{
    [m_pManager doStateChange:[NewGift class]];
    NewGift* newGift = (NewGift*)[m_pManager viewController].view;
    [newGift setWeddingUrl: weddingUrl andDetails:details];
}
@end
