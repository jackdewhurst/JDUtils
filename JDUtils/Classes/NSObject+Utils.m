//
//  NSObject+Utils.m
//  JDUtils
//
//  Created by Jack Dewhurst on 10/12/2013.
//  Copyright (c) 2013 Future Platforms. All rights reserved.
//

#import "NSObject+Utils.h"
#import "JDSafeAlertView.h"

typedef void (^AlertDismissedHandler) (NSInteger selectedIndex, BOOL didCancel);


@implementation NSObject (Utils)

- (id)nullWithNew:(id)replacement
{
    if (self == (id)[NSNull null]) {
        NSLog(@"IS NULL");
        return replacement;
    }
    
    return self;
}




- (id)nullStringWithhNew:(id)replacement
{
    if (self == (id)[NSNull null] || [(NSString*)self length] <=0 || [(NSString*)self isEqualToString:@""]) {
        NSLog(@"IS NULL");
        return replacement;
    }
    
    return self;
}




- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay 
{
    block = [block copy];
    [self performSelector:@selector(fireBlockAfterDelay:) 
               withObject:block 
               afterDelay:delay];
}




- (void)fireBlockAfterDelay:(void (^)(void))block {
    block();
}




- (void)showAlertViewWithTitle:(NSString*)title text:(NSString*)body cancelTitle:(NSString*)cancelButton otherButtons:(NSArray*)otherButtons returnBlock:(void (^)(NSInteger selectedIndex, BOOL didCancel))block
{
    NSString *string = body;
    if (string != nil)
        string = [@"\n" stringByAppendingString:string];
    else {
        string = @"No body found";
    }
    JDSafeAlertView *alert = [[JDSafeAlertView alloc] initWithTitle:title message:string cancelButtonTitle:cancelButton otherButtonTitles:otherButtons];
    [alert showWithDismissHandler:^(UIAlertView *alertView, NSInteger selectedIndex, BOOL didCancel) {
        if (block) {
            block(selectedIndex, didCancel);
        }
    }];
}




- (void)showTFAlertViewWithTitle:(NSString*)title placeholder:(NSString*)placeholder textFieldText:(NSString*)textFieldText text:(NSString*)body cancelTitle:(NSString*)cancelButton otherButtons:(NSArray*)otherButtons returnBlock:(void (^)(UIAlertView *alertView, NSInteger selectedIndex, BOOL didCancel))block
{
    
    
    JDSafeAlertView *alert = [[JDSafeAlertView alloc] initWithTitle:title placeholder:placeholder tfText:textFieldText message:body cancelButtonTitle:cancelButton otherButtonTitles:otherButtons];
    [alert showWithDismissHandler:block];
}






@end
