//
//  JDSafaAlertView.m
//  JDUtils
//
//  Created by Jack Dewhurst on 10/10/2015.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//


#import "JDSafeAlertView.h"

@interface JDSafeAlertView() <UIAlertViewDelegate>

@property (strong, nonatomic) JDSafeAlertView *strongAlertReference;

@property (copy) AlertDismissedHandler activeDismissHandler;

@property (strong, nonatomic) NSString *activeTitle;
@property (strong, nonatomic) NSString *activeMessage;
@property (strong, nonatomic) NSString *activeCancelTitle;
@property (strong, nonatomic) NSString *activeOtherTitles;
@property (strong, nonatomic) UIAlertView *activeAlert;

@end


@implementation JDSafeAlertView

#pragma mark - Public (Initialization)

- (id)initWithTitle:(NSString *)aTitle message:(NSString *)aMessage cancelButtonTitle:(NSString *)aCancelTitle otherButtonTitles:(NSArray *)otherTitles {
    self = [super init];
    if (self) {
        self.alertViewStyle = UIAlertViewStyleDefault;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:aTitle message:aMessage delegate:self cancelButtonTitle:aCancelTitle otherButtonTitles:nil];
        if (otherTitles != nil) {
            for (NSString *string in otherTitles) {
                [alert addButtonWithTitle:string];
            }
        }
        self.activeAlert = alert;
    }
    return self;
}


- (id)initWithTitle:(NSString *)aTitle placeholder:(NSString*)placeholder tfText:(NSString*)tfText message:(NSString *)aMessage cancelButtonTitle:(NSString *)aCancelTitle otherButtonTitles:(NSArray *)otherTitles {
    self = [super init];
    if (self) {
        self.alertViewStyle = UIAlertViewStylePlainTextInput;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:aTitle message:aMessage delegate:self cancelButtonTitle:aCancelTitle otherButtonTitles:nil];
        alert.alertViewStyle = self.alertViewStyle;
        [[alert textFieldAtIndex:0] setPlaceholder:placeholder];
        [[alert textFieldAtIndex:0] setText:tfText];
        [[alert textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeEmailAddress];
        [alert textFieldAtIndex:0].autocapitalizationType = UITextAutocapitalizationTypeSentences;
        
        
        if (otherTitles != nil) {
            for (NSString *string in otherTitles) {
                [alert addButtonWithTitle:string];
            }
        }
        self.activeAlert = alert;
    }
    return self;
}


#pragma mark - Public (Functionality)

- (void)showWithDismissHandler:(AlertDismissedHandler)handler {
    self.activeDismissHandler = handler;
    self.strongAlertReference = self;
    [self.activeAlert show];
    
    if (self.alertViewStyle == UIAlertViewStyleDefault) return;
    
    UITextField *tf = [self.activeAlert textFieldAtIndex:0];
    
    if (tf) {
        [tf becomeFirstResponder];
    }
}

#pragma mark UIAlertView passthroughs

- (void)setAlertViewStyle:(UIAlertViewStyle)alertViewStyle
{
    _alertViewStyle = alertViewStyle;
    self.activeAlert.alertViewStyle = alertViewStyle;
}

- (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex
{
    return [self.activeAlert textFieldAtIndex:textFieldIndex];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.activeDismissHandler) {
        self.activeDismissHandler(alertView, buttonIndex, buttonIndex == alertView.cancelButtonIndex);
    }
    self.strongAlertReference = nil;
}

@end
