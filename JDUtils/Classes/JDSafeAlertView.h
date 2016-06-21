//
//  JDSafeAlertView.h
//  JDUtils
//
//  Created by Jack Dewhurst on 10/10/15.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void (^DismissBlock) (NSString *buttonTitle, BOOL didCancel);

@interface JDSafeAlertView : NSObject

- (id)initWithTitle:(NSString *)title body:(NSString *)body cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles;

- (void)showWithResult:(DismissBlock)block;

@end
