//
//  WeddingList.m
//  WG2
//
//  Created by David Henry on 02/10/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "WeddingList.h"
#import "Login.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"
#import "ViewController.h"
bool rendered;

@implementation WeddingList

- (id)initWithFrame:(CGRect)frame andManager:(AppStateManager *)pManager
{
    self = [super initWithFrame:frame andManager:pManager];
    if (self) {
        // Initialization code
        NSLog(@"On wedding screen");
    }
    rendered = false;
    return self;
}
-(void) Render 
{
    if(rendered)
        return;
    
    rendered = true;
    top = 40;
    [self setBackground];
    [self addHeader: @"Wedding Guests"];
    [self addHeader: @"Weddings" withSize: 2];
    
    id weddings = [self weddings];
    
    NSEnumerator *arrenum = [weddings objectEnumerator];
    id wedding;
    while ( wedding = [arrenum nextObject] ) {
        [self addWeddingDetails: wedding];
    }
    [self addButton: @"Refresh" calling:@selector(refresh)];
}
-(void)refresh
{
    [m_pManager doStateChange:[WeddingList class]];
}
-(id)weddings
{
    NSString *urlString=[NSString stringWithFormat:@"%@/weddings.json?auth_token=%@", m_pManager.host, m_pManager.authToken];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    NSArray *weddings;
    [request startSynchronous];
    if ([request responseStatusCode] == 200) {
        weddings = [[request responseString] objectFromJSONString];
        return weddings;
    } else {
        [m_pManager doStateChange:[Login class]];
        
        
        ViewController* viewControler = m_pManager.viewController;
        id loginView = viewControler.view;
        [loginView setMessage: @"Connection failure\nUnable to retrieve Wedding List" ];
        return weddings;
    }
    
}
-(void)addWeddingDetails:(NSDictionary*)wedding
{
    NSString* text = [wedding objectForKey:@"wedding"];
    NSString* weddingUrl = [wedding objectForKey:@"image_path"];
    
    NSString *urlString=[NSString stringWithFormat:@"%@/%@", m_pManager.host, weddingUrl];

    [self addClickableRow:text imageUrl:urlString calling:@selector(viewWedding)];
}
@end
