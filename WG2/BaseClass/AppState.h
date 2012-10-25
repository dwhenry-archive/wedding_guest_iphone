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
    int column;
}

-(id) initWithFrame:(CGRect)frame andManager:(AppStateManager*)pManager;
-(void) Render;
-(void) Update;
-(void) setBackground;
-(UITextField*)addField:(NSString*)fieldName;
-(void) addHeader: (NSString*)header;
-(void) addHeader: (NSString*)header withSize:(NSInteger)size;
-(void) addHeader: (NSString*)header withSize:(NSInteger)size andBorder:(bool)border;
-(void) addFieldToCallChain:(UITextField*)passwordField;
-(void) addButton:(NSString*)buttonName calling:(SEL)methodName;
-(void) addActionButton:(NSString*)buttonName withImage:(NSString*)imagePath calling:(SEL)methodName;
-(void) addClickableRow:(NSString*)text imageUrl:(NSString*)imageUrl weddingUrl:(NSString*)weddingUrl calling:(SEL)methodName;
-(void) previousView;
@end
