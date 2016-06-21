//
//  JDSafeAlertView.h
//  JDUtils
//
//  Created by Jack Dewhurst on 10/10/15.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void (^AlertDismissedHandler) (UIAlertView *alertView, NSInteger selectedIndex, BOOL didCancel);

@interface JDSafeAlertView : NSObject

@property (nonatomic, assign) UIAlertViewStyle alertViewStyle NS_AVAILABLE_IOS(5_0);

- (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex NS_AVAILABLE_IOS(5_0);

- (id)initWithTitle:(NSString *)aTitle message:(NSString *)aMessage cancelButtonTitle:(NSString *)aCancelTitle otherButtonTitles:(NSArray *)otherTitles;
- (id)initWithTitle:(NSString *)aTitle placeholder:(NSString*)placeholder tfText:(NSString*)tfText message:(NSString *)aMessage cancelButtonTitle:(NSString *)aCancelTitle otherButtonTitles:(NSArray *)otherTitles;

- (void)showWithDismissHandler:(AlertDismissedHandler)handler;

@end
