//
//  NewGift.h
//  WG2
//
//  Created by DAVID HENRY on 25/10/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "AppState.h"
#import "ZBarSDK.h"

@interface NewGift : AppState < ZBarReaderDelegate >
-(void)setWeddingUrl:(NSString*)weddingUrl andDetails:(id)_details;

@end
