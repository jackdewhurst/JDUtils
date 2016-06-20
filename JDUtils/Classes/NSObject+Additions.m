//
//  NSObject+Additions.m
//  Wembley
//
//  Created by Jack Dewhurst on 10/12/2013.
//  Copyright (c) 2013 Future Platforms. All rights reserved.
//

#import "NSObject+Additions.h"
#import "JDSafeAlertView.h"

typedef void (^AlertDismissedHandler) (NSInteger selectedIndex, BOOL didCancel);


@implementation NSObject (Additions)

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




- (void)showAlertViewWithTitle:(NSString*)title text:(NSString*)body cancelTitle:(NSString*)cancelButton otherButtons:(NSArray*)otherButtons returnBlock:(void (^)(NSString *selectedTitle, BOOL didCancel))block
{
    NSString *string = [@"\n" stringByAppendingString:body];
    JDSafeAlertView *alert = [[JDSafeAlertView alloc] initWithTitle:title body:string cancelTitle:cancelButton otherTitles:otherButtons];
    [alert showWithResult:^(NSString *buttonTitle, BOOL didCancel) {
        if (block) {
            block(buttonTitle, didCancel);
        }
    }];
}




@end
