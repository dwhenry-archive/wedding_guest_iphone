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
UIImageView *scannerImage;

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
    
    [self addScanner];
    
    [self addButton: @"Scan" calling:@selector(scan)];
    [self addButton: @"Back" calling:@selector(previousView)];
}
-(void)addScanner
{
    scannerImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, top, IPHONE_WIDTH - 20, 120)];
    top += 140;

}
-(void)scan
{
    // ADD: present a barcode reader that scans from the camera feed
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    // TODO: (optional) additional reader configuration here
    
    // EXAMPLE: disable rarely used I2/5 to improve performance
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    
    // present and release the controller
    [m_pManager.viewController presentModalViewController: reader
                                                 animated: YES];
}
- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    // ADD: get the decode results
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // EXAMPLE: just grab the first barcode
        break;
    
    // EXAMPLE: do something useful with the barcode data
//    resultText.text = symbol.data;
    
    // EXAMPLE: do something useful with the barcode image
    scannerImage.image =
    [info objectForKey: UIImagePickerControllerOriginalImage];
    
    // ADD: dismiss the controller (NB dismiss from the *reader*!)
    [reader dismissModalViewControllerAnimated: YES];
}
@end
