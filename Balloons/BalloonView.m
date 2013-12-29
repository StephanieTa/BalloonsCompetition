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
//    self.ballon = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30.0f, 30.0f)];
//    UIImageView *ballonImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Balloon.png"]];
//    [self.ballon addSubview:ballonImgView];
//    ballonImgView.frame = self.ballon.frame;
//    
//    [self addSubview:self.ballon];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initBallon];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *balloon = [UIBezierPath balloonGlyph];
    [[UIColor colorWithFloatRed:255.0f green:181.0f blue:59.0f alpha:1.0f] setFill];
    [balloon fill];
}

@end
