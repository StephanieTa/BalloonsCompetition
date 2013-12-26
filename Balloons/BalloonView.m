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
//    self.backgroundColor = [UIColor blueColor];
    self.ballon = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20.0f, 20.0f)];
    self.ballon.backgroundColor = [UIColor redColor];
    self.ballon.layer.cornerRadius = 10.0f;
    self.ballon.layer.borderColor = [UIColor blackColor].CGColor;
    self.ballon.layer.borderWidth = 1.0f;
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
