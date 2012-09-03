//
//  AppState.m
//  WG
//
//  Created by David Henry on 28/08/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "AppState.h"


@implementation AppState
UITextField *lastInputElement;

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
        top = 40;
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
-(void) setBackground
{
    CGContextRef g =  UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(g, [UIColor colorWithRed:238.0/255.0 green:216.0/255.0 blue:206.0/255.0 alpha:1.0].CGColor);
    CGContextFillRect(g, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));    
    
    CGContextSetFillColorWithColor(g, [UIColor blackColor].CGColor);
    
}
-(void) addHeader:(NSString*)header
{
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, top, IPHONE_WIDTH, 35)];
    headerLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:30]; //[UIFont systemFontOfSize: 30];
    headerLabel.text = header;
    headerLabel.textAlignment = UITextAlignmentCenter;
    headerLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:headerLabel];

    UILabel *borderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, top + 49, IPHONE_WIDTH-20, 2)];
    borderLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:borderLabel];
    
    top = top + 65;
}
-(UITextField*)addField:(NSString*)fieldName
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, top, IPHONE_WIDTH-40, 24)];
    label.font = [UIFont fontWithName:@"Helvetica" size:18];
    label.text = fieldName;
    label.backgroundColor = [UIColor clearColor];
    [self addSubview:label];
    top = top + 30;
    
    UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(18, top, IPHONE_WIDTH-36, 26)];
    field.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    field.backgroundColor = [UIColor whiteColor];
    field.borderStyle = UITextBorderStyleRoundedRect;//To change borders to rounded
    field.layer.cornerRadius = 5;
    field.layer.borderWidth = 1.0f; //To hide the square corners 
    field.layer.borderColor = [[UIColor grayColor] CGColor]; //assigning the default border color
    [field setDelegate: (id)self];
    [self addSubview:field];
    [self addFieldToCallChain: field];
    top = top + 54;
    
    return field;
}
-(void) addFieldToCallChain:(UITextField*)field
{
    if(lastInputElement) {
        lastInputElement.nextTextField = field;
        [lastInputElement setReturnKeyType:UIReturnKeyNext];
    }
    lastInputElement = field;
    [lastInputElement setReturnKeyType:UIReturnKeyDone];
}
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    UITextField *next = theTextField.nextTextField;
    if (next) {
        [next becomeFirstResponder];
    } else {
        [theTextField resignFirstResponder];
    }
    return NO; 
}

@end
