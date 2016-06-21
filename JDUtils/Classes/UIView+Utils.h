//
//  UIView+Utils.h
//  JDUtils
//
//  Created by Jack Dewhurst on 10/10/2015.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface UIView (Utils)


// - Shortcut for frame.origin.x.
// - Sets frame.origin.x = left
@property (nonatomic) CGFloat left;


// - Shortcut for frame.origin.y
// - Sets frame.origin.y = top
@property (nonatomic) CGFloat top;


// - Shortcut for frame.origin.x + frame.size.width
// - Sets frame.origin.x = right - frame.size.width
@property (nonatomic) CGFloat right;


// - Shortcut for frame.origin.y + frame.size.height
// - Sets frame.origin.y = bottom - frame.size.height
@property (nonatomic) CGFloat bottom;


// - Shortcut for frame.size.width
// - Sets frame.size.width = width
@property (nonatomic) CGFloat width;


// - Shortcut for frame.size.height
// - Sets frame.size.height = height
@property (nonatomic) CGFloat height;


// - Shortcut for center.x
// - Sets center.x = centerX
@property (nonatomic) CGFloat centerX;


// - Shortcut for center.y
// - Sets center.y = centerY
@property (nonatomic) CGFloat centerY;


// - Shortcut for frame.origin
@property (nonatomic) CGPoint origin;


// - Shortcut for frame.size
@property (nonatomic) CGSize size;

// - Returns view bounding CGRect center
@property (nonatomic) CGPoint boundsCenter;



// - Set the view anchorpoint without any visible shifting
- (void)setAnchorPoint:(CGPoint)anchorPoint;


// - Returns first responder (if any) in subviews of view
- (UIView *)findFirstResponder;


// - Shows a white UIActivityIndicatorView spinner in view with translucent black background
- (void)showLoadingSpinnerInCenter;
- (void)showLoadingSpinnerInCenterWithOffset:(CGSize)offset;
- (void)hideLoadingSpinner;


@end
