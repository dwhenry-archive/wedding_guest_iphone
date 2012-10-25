//
//  NewGift.m
//  WG2
//
//  Created by DAVID HENRY on 25/10/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "NewGift.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"
#import "Login.h"
#import "ViewController.h"

@implementation NewGift
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
        NSLog(@"On new gift screen");
    }
    backgroundRendered = false;
    rendered = false;
    return self;
}

-(void)setWeddingUrl:(NSString*)_weddingUrl andDetails:(NSDictionary*)_details
{
    details = _details;
    weddingUrl = _weddingUrl;
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
    [self addHeader:@"New Gift" withSize:2 andBorder:true];
    
    top += 100;
    
    [self addButton: @"Back" calling:@selector(previousView)];
}

@end
