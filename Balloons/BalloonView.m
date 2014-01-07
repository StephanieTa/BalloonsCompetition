//
//  BalloonView.m
//  Balloons
//
//  Created by Stephanie Ta on 26.12.13.
//  Copyright (c) 2013 Stephanie Ta. All rights reserved.
//

#import "BalloonView.h"

#import <QuartzCore/QuartzCore.h>

#import "UIBezierPath+BalloonGlyph.h"
#import "UIColor+ColorTools.h"


@interface BalloonView ()

- (void)initBallon;

@end


@implementation BalloonView

- (void)initBallon {
    UIGraphicsBeginImageContext(CGSizeMake(100.0f, 100.0f));
    
    UIBezierPath *balloonPath = [UIBezierPath balloonGlyph];
    [balloonPath applyTransform:CGAffineTransformMakeScale(1.7f, 1.7f)];
    [balloonPath applyTransform:CGAffineTransformMakeTranslation(15.0f, 0)];
    [[UIColor blackColor] setStroke];
    [balloonPath stroke];
    [[UIColor colorWithFloatRed:255.0f green:181.0f blue:59.0f alpha:1.0f] setFill];
    [balloonPath fill];
    
    UIImage *balloonImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *balloonImageView = [[UIImageView alloc] initWithImage:balloonImage];
    [self addSubview:balloonImageView];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initBallon];
        self.backgroundColor = nil;
        self.opaque = NO;
    }
    return self;
}

@end
