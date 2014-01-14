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
    
    self.firstChildBalloonView = [[BalloonView alloc] init];
    self.firstChildBalloonView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.firstChildBalloonView];
    
    self.secondChildBalloonView = [[BalloonView alloc] init];
    self.secondChildBalloonView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.secondChildBalloonView];
    
    self.thirdChildBalloonView = [[BalloonView alloc] init];
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
    
    self.firstChildBalloonWidthConstraint = [NSLayoutConstraint constraintWithItem:self.firstChildBalloonView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:10.0f];
    self.firstChildBalloonHeightConstraint = [NSLayoutConstraint constraintWithItem:self.firstChildBalloonView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:10.0f];
    self.secondChildBalloonWidthConstraint = [NSLayoutConstraint constraintWithItem:self.secondChildBalloonView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:10.0f];
    self.secondChildBalloonHeightConstraint = [NSLayoutConstraint constraintWithItem:self.firstChildBalloonView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:10.0f];
    self.thirdChildBalloonWidthConstraint = [NSLayoutConstraint constraintWithItem:self.thirdChildBalloonView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:10.0f];
    self.thirdChildBalloonHeightConstraint = [NSLayoutConstraint constraintWithItem:self.firstChildBalloonView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:10.0f];
    
    [self addConstraints:@[_firstChildBalloonWidthConstraint, _firstChildBalloonHeightConstraint, _secondChildBalloonWidthConstraint, _secondChildBalloonHeightConstraint, _thirdChildBalloonWidthConstraint, _thirdChildBalloonHeightConstraint]];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initMasterBalloonView];
    }
    return self;
}

@end
