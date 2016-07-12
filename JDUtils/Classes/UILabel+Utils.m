//
//  UILabel+Utils.m
//  Pods
//
//  Created by Jack Dewhurst on 12/07/2016.
//
//

#import "UILabel+Utils.h"


@implementation UILabel (Utils)

- (void) setText:(NSString *)text withKerning:(CGFloat)kerning
{
    if ([self respondsToSelector:@selector(setAttributedText:)]) {
     
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        [attributedString addAttribute:NSKernAttributeName
                                 value:[NSNumber numberWithFloat:kerning]
                                 range:NSMakeRange(0, [text length])];
        [self setAttributedText:attributedString];
    
    } else {
        
        [self setText:text];
    }
}





- (void)setKerning:(CGFloat)kerning
{
    if (self.text != nil)
        [self setText:self.text withKerning:kerning];
}




- (void)fitWidthToText
{
    CGRect frame = self.frame;
    frame.size.width = [self sizeThatFits:CGSizeMake(HUGE_VAL, frame.size.height)].width;
    self.frame = frame;
}




- (void)fitHeightToText
{
    CGRect frame = self.frame;
    frame.size.height = [self sizeThatFits:CGSizeMake(frame.size.width, HUGE_VAL)].height;
    self.frame = frame;
}




- (void)fitWidthToTextWithExtra:(float)extra
{
    [self fitWidthToText];
    
    CGRect frame = self.frame;
    frame.size.width += extra;
    self.frame = frame;
}




- (void)fitHeightToTextWithExtra:(float)extra
{
    [self fitHeightToText];
    
    CGRect frame = self.frame;
    frame.size.height += extra;
    self.frame = frame;
}




@end
