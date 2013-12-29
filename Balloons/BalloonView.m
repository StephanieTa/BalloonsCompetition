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
    
    UIBezierPath *balloon = [UIBezierPath balloonGlyph];
    [[UIColor colorWithFloatRed:255.0f green:181.0f blue:59.0f alpha:1.0f] setFill];
    [balloon fill];
    
    UIImage *bezierImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *bezierImageView = [[UIImageView alloc]initWithImage:bezierImage];
    [self addSubview:bezierImageView];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initBallon];
    }
    return self;
}

@end
