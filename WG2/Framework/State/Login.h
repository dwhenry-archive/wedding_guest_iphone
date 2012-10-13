//
//  Login.h
//  WG
//
//  Created by David Henry on 28/08/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "AppState.h"

@interface Login : AppState
-(void)setMessage:(NSString*)message;
-(void)setMessageTimer:(NSTimer*)timer;
@end
