//
//  UIColor+ColorTools.m
//  Balloons
//
//  Created by Stephanie Ta on 29.12.13.
//  Copyright (c) 2013 Stephanie Ta. All rights reserved.
//

#import "UIColor+ColorTools.h"

static inline CGFloat normalizeColorComponent(const CGFloat component) {
    return MIN(255.0f, MAX(0, component)) / 255.0f;
}


@implementation UIColor (ColorTools)

+ (UIColor *)colorWithFloatRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [self colorWithRed:normalizeColorComponent(red) green:normalizeColorComponent(green) blue:normalizeColorComponent(blue) alpha:alpha];
}

@end
