//
//  NSObject+Utils.h
//  JDUtils
//
//  Created by Jack Dewhurst on 10/10/2015.
//  Copyright (c) 2013 Jack Dewhurst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSObject (Utils)

- (id)nullWithNew:(id)replacement;
- (id)nullStringWithhNew:(id)replacement;

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

- (void)showAlertViewWithTitle:(NSString*)title text:(NSString*)body cancelTitle:(NSString*)cancelButton otherButtons:(NSArray*)otherButtons returnBlock:(void (^)(NSString *selectedTitle, BOOL didCancel))block;
@end
