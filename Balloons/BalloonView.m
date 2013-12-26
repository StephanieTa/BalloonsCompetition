//
//  BalloonView.m
//  Balloons
//
//  Created by Stephanie Ta on 26.12.13.
//  Copyright (c) 2013 Stephanie Ta. All rights reserved.
//

#import "BalloonView.h"

#import <QuartzCore/QuartzCore.h>

@interface BalloonView ()

- (void)initBallon;

@end


@implementation BalloonView

- (void)initBallon {
    self.ballon = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30.0f, 30.0f)];
    UIImageView *ballonImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Balloon.png"]];
    [self.ballon addSubview:ballonImgView];
    ballonImgView.frame = self.ballon.frame;
    [self addSubview:self.ballon];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initBallon];
    }
    return self;
}

@end
