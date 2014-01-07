//
//  MasterBalloonView.m
//  Balloons
//
//  Created by Stephanie Ta on 07.01.14.
//  Copyright (c) 2014 Stephanie Ta. All rights reserved.
//

#import "MasterBalloonView.h"

@interface MasterBalloonView ()

- (void)initMasterBalloonView;

@end


@implementation MasterBalloonView

- (void)initMasterBalloonView {
    
    // Set up child balloons
    
    self.firstChildBalloonView = [[UIView alloc] init];
    self.firstChildBalloonView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.firstChildBalloonView];
    
    self.secondChildBalloonView = [[UIView alloc] init];
    self.secondChildBalloonView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.secondChildBalloonView];
    
    self.thirdChildBalloonView = [[UIView alloc] init];
    self.thirdChildBalloonView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.thirdChildBalloonView];
    
    // Layout
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_firstChildBalloonView, _secondChildBalloonView, _thirdChildBalloonView);
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_secondChildBalloonView][_thirdChildBalloonView]"
                                                                options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_firstChildBalloonView][_secondChildBalloonView]|"
                                                                 options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_firstChildBalloonView][_thirdChildBalloonView]|"
                                                                 options:0 metrics:nil views:views]];
    
    NSLayoutConstraint *firstChildBalloonSizeConstraint = [NSLayoutConstraint constraintWithItem:self.firstChildBalloonView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:self.firstChildBalloonWidthConstraint.constant];
    NSLayoutConstraint *secondChildBalloonSizeConstraint = [NSLayoutConstraint constraintWithItem:self.secondChildBalloonView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:self.secondChildBalloonWidthConstraint.constant];
    NSLayoutConstraint *thirdChildBalloonSizeConstraint = [NSLayoutConstraint constraintWithItem:self.thirdChildBalloonView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:self.thirdChildBalloonWidthConstraint.constant];
    
    [self addConstraints:@[firstChildBalloonSizeConstraint, secondChildBalloonSizeConstraint, thirdChildBalloonSizeConstraint]];
    
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initMasterBalloonView];
    }
    return self;
}

@end
