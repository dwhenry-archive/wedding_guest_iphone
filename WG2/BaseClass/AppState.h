//
//  AppState.h
//  WG
//
//  Created by David Henry on 28/08/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppStateManager.h"
@interface AppState : UIView {
    AppStateManager* m_pManager;
    int top;
}

-(id) initWithFrame:(CGRect)frame andManager:(AppStateManager*)pManager;
-(void) Render;
-(void) Update;
-(void) setBackground;
-(UITextField*)addField:(NSString*)fieldName;
-(void) addHeader: (NSString*)header;
-(void) addFieldToCallChain:(UITextField*)passwordField;
@end
