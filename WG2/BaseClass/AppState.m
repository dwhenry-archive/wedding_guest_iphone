//
//  AppState.m
//  WG
//
//  Created by David Henry on 28/08/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "AppState.h"
#import "UIViewWithBorder.h"

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

-(id) initWithFrame:(CGRect)frame andManager:(AppDelegate*)pManager
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
    [self addHeader:header withSize:1];
}
-(NSInteger) fontSize: (NSInteger)size
{
    return (7 - size) * 5;
}
-(NSInteger) topOffset: (NSInteger)size
{
    if (size == 1)
        return 65;
    else 
        return [self fontSize:size] + 15;
}
-(void) addHeader: (NSString*)header withSize:(NSInteger)size
{
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, top, IPHONE_WIDTH, 35)];
    headerLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:[self fontSize:size]]; //[UIFont systemFontOfSize: 30];
    headerLabel.text = header;
    headerLabel.textAlignment = UITextAlignmentCenter;
    headerLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:headerLabel];
    
    if (size == 1) {
        UILabel *borderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, top + 49, IPHONE_WIDTH-20, 2)];
        borderLabel.backgroundColor = [UIColor blackColor];
        [self addSubview:borderLabel];
    }
        
    top = top + [self topOffset:size];    
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
-(void)addButton:(NSString*)buttonName calling:(SEL)methodName
{
    UIViewWithBorder *button = [[UIViewWithBorder alloc]
                                initWithFrame:CGRectMake(60, top + 10, IPHONE_WIDTH - 120, 40)
                                andText:buttonName];
    
    [button addTouchUpEvent:self action:methodName];
    
    [self addSubview:button];
    top = top + 50;
}
-(void)addClickableRow:(NSString*)text calling:(SEL)methodName
{
    UIViewWithBorder *button = [[UIViewWithBorder alloc]
                                initWithFrame:CGRectMake(60, top + 10, IPHONE_WIDTH - 120, 40)
                                andText:text];
    
    [button addTouchUpEvent:self action:methodName];
    
    [self addSubview:button];
    top = top + 50;
}

@end
