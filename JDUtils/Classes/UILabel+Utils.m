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
    [self setText:self.text withKerning:kerning];
}




@end
