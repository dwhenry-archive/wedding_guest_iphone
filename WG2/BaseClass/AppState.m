//
//  AppState.m
//  WG
//
//  Created by David Henry on 28/08/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "AppState.h"


@implementation AppState
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id) initWithFrame:(CGRect)frame andManager:(AppStateManager*)pManager
{
    if (self = [super initWithFrame:frame]) {
        m_pManager = pManager;
        self.userInteractionEnabled = true;
    }
    return self;
}

-(void) Render
{
    
}
-(void) Update
{
    
}
- (void)drawRect:(CGRect)rect
{
    [self Render];
}

@end
