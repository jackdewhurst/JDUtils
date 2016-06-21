//
//  JDSafeAlertView.m
//  JDUtils
//
//  Created by Jack Dewhurst on 10/10/15.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//

#import "JDSafeAlertView.h"
#import "JDUtils.h"


@interface JDSafeAlertView() <UIAlertViewDelegate>

@property (nonatomic, assign) BOOL isIOS7;
@property (copy) DismissBlock dismissBlock;
@property (nonatomic, strong) id alertView;

@end


@implementation JDSafeAlertView

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"


- (id)initWithTitle:(NSString *)title body:(NSString *)body cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles
{
    self = [super init];
    if (self) {

        self.isIOS7 = SYSTEM_VERSION_LESS_THAN(@"8.0");
        
        if (self.isIOS7) {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:body delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:nil];
            if (otherTitles != nil) {
                for (NSString *string in otherTitles) {
                    [alertView addButtonWithTitle:string];
                }
            }
            self.alertView = alertView;
            
        } else {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:body preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
                if (self.dismissBlock) {
                    self.dismissBlock(action.title, YES);
                }
                self.alertView = nil;
                
            }];
            
            [alertController addAction:cancelAction];
            
            for (NSString *string in otherTitles) {

                UIAlertAction *action = [UIAlertAction actionWithTitle:string style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    if (self.dismissBlock) {
                        self.dismissBlock(action.title, NO);
                    }
                    self.alertView = nil;
                    
                }];
                
                [alertController addAction:action];
        
            }
            self.alertView = alertController;
        }
        
    }
    return self;
}



- (void)showWithResult:(DismissBlock)block
{
    self.dismissBlock = block;
    
    if (self.isIOS7) {
        [(UIAlertView*)self.alertView show];
    } else {
        UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
        [currentWindow.rootViewController presentViewController:(UIAlertController*)self.alertView animated:YES completion:nil];
        
    }
}



#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
   
    if (self.dismissBlock == nil) return;
    
    self.dismissBlock([alertView buttonTitleAtIndex:buttonIndex], buttonIndex == alertView.cancelButtonIndex);
}


#pragma GCC diagnostic pop


@end
