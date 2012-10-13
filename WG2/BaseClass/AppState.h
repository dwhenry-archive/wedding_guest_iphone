//
//  AppState.h
//  WG
//
//  Created by David Henry on 28/08/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface AppState : UIView {
    AppDelegate* m_pManager;
    int top;
}

-(id) initWithFrame:(CGRect)frame andManager:(AppStateManager*)pManager;
-(void) Render;
-(void) Update;
-(void) setBackground;
-(UITextField*)addField:(NSString*)fieldName;
-(void) addHeader: (NSString*)header;
-(void) addHeader: (NSString*)header withSize:(NSInteger)size;
-(void) addFieldToCallChain:(UITextField*)passwordField;
-(void)addButton:(NSString*)buttonName calling:(SEL)methodName;
-(void)addClickableRow:(NSString*)text calling:(SEL)methodName;
@end
