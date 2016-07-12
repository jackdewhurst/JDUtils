//
//  UILabel+Utils.h
//  Pods
//
//  Created by Jack Dewhurst on 12/07/2016.
//
//

#import <UIKit/UIKit.h>


@interface UILabel (Utils)

- (void)setKerning:(CGFloat)kerning;

- (void)fitHeightToText;
- (void)fitWidthToText;

- (void)fitHeightToTextWithExtra:(float)extra;
- (void)fitWidthToTextWithExtra:(float)extra;

@end
