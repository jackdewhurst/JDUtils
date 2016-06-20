//
//  UIFont+Additions.h
//
//  Created by Jack Dewhurst on 10/10/2015.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIFont (Additions)


// Print a list of available fonts in the log including their accessible names
+ (void)nsLogInstalledFonts;


/* Returns a new font for a given preprocessor macro.
   "macro" should be a string defined in your target build settings.
   See README for instructions. */
+ (UIFont*)fontWithMacro:(NSString*)macro size:(float)size;



/* -- Shortcut methods for pre-defined macros -- */

// Logo Font - Macro should be "JD_LOGO_FONT"
+ (UIFont*)logoFontWithSize:(float)size;


// App Bold Font - Macro should be "JD_APP_BOLD_FONT"
+ (UIFont*)appBoldWithSize:(float)size;


// App Regular Font - Macro should be "JD_APP_FONT"
+ (UIFont*)appRegularWithSize:(float)size;


// App Light Font -Macro should be "JD_APP_LIGHT_FONT"
+ (UIFont*)appLightWithSize:(float)size;


@end
