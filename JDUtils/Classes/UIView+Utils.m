//
//  UIView+Utils.m
//  JDUtils
//
//  Created by Jack Dewhurst on 10/10/2015.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//


#import "UIView+Utils.h"
#import <objc/runtime.h>


@implementation UIView (Utils)


- (CGFloat)left
{
  return self.frame.origin.x;
}




- (void)setLeft:(CGFloat)x
{
  CGRect frame = self.frame;
  frame.origin.x = x;
  self.frame = frame;
}




- (CGFloat)top
{
  return self.frame.origin.y;
}




- (void)setTop:(CGFloat)y
{
  CGRect frame = self.frame;
  frame.origin.y = y;
  self.frame = frame;
}




- (CGFloat)right
{
  return self.frame.origin.x + self.frame.size.width;
}




- (void)setRight:(CGFloat)right
{
  CGRect frame = self.frame;
  frame.origin.x = right - frame.size.width;
  self.frame = frame;
}




- (CGFloat)bottom
{
  return self.frame.origin.y + self.frame.size.height;
}




- (void)setBottom:(CGFloat)bottom
{
  CGRect frame = self.frame;
  frame.origin.y = bottom - frame.size.height;
  self.frame = frame;
}




- (CGFloat)centerX
{
  return self.center.x;
}




- (void)setCenterX:(CGFloat)centerX
{
  self.center = CGPointMake(centerX, self.center.y);
}




- (CGFloat)centerY
{
  return self.center.y;
}




- (void)setCenterY:(CGFloat)centerY
{
  self.center = CGPointMake(self.center.x, centerY);
}




- (CGFloat)width
{
  return self.frame.size.width;
}




- (void)setWidth:(CGFloat)width
{
  CGRect frame = self.frame;
  frame.size.width = width;
  self.frame = frame;
}




- (CGFloat)height
{
  return self.frame.size.height;
}




- (void)setHeight:(CGFloat)height
{
  CGRect frame = self.frame;
  frame.size.height = height;
  self.frame = frame;
}




- (CGPoint)origin
{
  return self.frame.origin;
}




- (void)setOrigin:(CGPoint)origin
{
  CGRect frame = self.frame;
  frame.origin = origin;
  self.frame = frame;
}



- (CGSize)size
{
  return self.frame.size;
}




- (void)setSize:(CGSize)size
{
  CGRect frame = self.frame;
  frame.size = size;
  self.frame = frame;
}




- (CGPoint)boundsCenter
{
  return CGPointMake(self.width * 0.5f, self.height * 0.5f);
}




- (void)setBoundsCenter:(CGPoint)center
{

}




- (UIView *)findFirstResponder
{
    if (self.isFirstResponder) {        
        return self;     
    }

    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView findFirstResponder];

        if (firstResponder != nil) {
            return firstResponder;
        }
    }

    return nil;
}




- (void)showLoadingSpinnerInCenter
{
    UIView *view = [self viewWithTag:1234];
    if (view) return;

    
    view = [[UIView alloc] initWithFrame:self.bounds];
    view.tag = 1234;
    view.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.4f];
    view.alpha = 0.0f;
    view.layer.cornerRadius = self.layer.cornerRadius;
    view.clipsToBounds = YES;
    [self addSubview:view];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    spinner.center = view.boundsCenter;
    [view addSubview:spinner];
    [spinner startAnimating];
    
    
    [UIView animateWithDuration:0.2f animations:^{
        view.alpha = 1.0f;
    }];
    
}




- (void)showLoadingSpinnerInCenterWithOffset:(CGSize)offset
{
    UIView *view = [self viewWithTag:1234];
    if (view) return;
    
    
    view = [[UIView alloc] initWithFrame:self.bounds];
    view.tag = 1234;
    view.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.4f];
    view.alpha = 0.0f;
    view.layer.cornerRadius = self.layer.cornerRadius;
    view.clipsToBounds = YES;
    [self addSubview:view];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    spinner.center = CGPointMake(view.boundsCenter.x + offset.width, view.boundsCenter.y + offset.height);
    [view addSubview:spinner];
    [spinner startAnimating];
    
    
    [UIView animateWithDuration:0.2f animations:^{
        view.alpha = 1.0f;
    }];
    
}




- (void)hideLoadingSpinner
{
    UIView *view = [self viewWithTag:1234];
    if (view == nil) return;
    
    
    [UIView animateWithDuration:0.2f animations:^{
        view.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
    }];
}




- (void)setAnchorPoint:(CGPoint)anchorPoint
{
    CGPoint oldOrigin = self.center;
    
    self.layer.anchorPoint = anchorPoint;
    
    self.center = CGPointMake(oldOrigin.x + (self.width * (anchorPoint.x - 0.5f)), oldOrigin.y + (self.height* (anchorPoint.y - 0.5f)));
}



@end


