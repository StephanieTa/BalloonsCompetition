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
    [[UIColor whiteColor] setFill];
    [balloonPath fill];
    
    UIImage *balloonImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *balloonImageView = [[UIImageView alloc] initWithImage:balloonImage];
    [self addSubview:balloonImageView];
    
//    [UIView animateWithDuration:3.0f delay:3.0f options:0 animations:^{
//        CGAffineTransform transform = CGAffineTransformMakeRotation(0.5f);
//        balloonImageView.transform = transform;
//    } completion:^(BOOL finished) {
//        CGAffineTransform transform = CGAffineTransformMakeRotation(-10.0f);
//        balloonImageView.transform = transform;
//    }];
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
