//
//  ViewController.m
//  Balloons
//
//  Created by Stephanie Ta on 26.12.13.
//  Copyright (c) 2013 Stephanie Ta. All rights reserved.
//

#import "ViewController.h"

#import <QuartzCore/QuartzCore.h>

#import "UIColor+ColorTools.h"


static CGFloat const balloonSize = 100.0f;
static CGFloat const dotSize = 10.0f;


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set up cloud view
    
    self.cloudView = [[CloudView alloc] init];
    [self.view addSubview:self.cloudView];
    [self.cloudView animateCloudView];
    
    // Set up ground view
    
    UIImageView *groundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"greenBG.png"]];
    groundView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:groundView];
    
    // Set up idea view

    self.ideaViewOne = [[IdeaView alloc] init];
    [self.cloudView addSubview:self.ideaViewOne];
    
    self.ideaViewTwo = [[IdeaView alloc] init];
    [self.cloudView addSubview:self.ideaViewTwo];
    
    self.ideaViewThree = [[IdeaView alloc] init];
    [self.cloudView addSubview:self.ideaViewThree];
    
    // Set up air pumps
    
    self.airPumpOne = [[AirPumpView alloc] init];
    self.airPumpOne.delegate = self;
    [self.view addSubview:self.airPumpOne];
    
    self.airPumpTwo = [[AirPumpView alloc] init];
    self.airPumpTwo.delegate = self;
    [self.view addSubview:self.airPumpTwo];
    
    self.airPumpThree = [[AirPumpView alloc] init];
    self.airPumpThree.delegate = self;
    [self.view addSubview:self.airPumpThree];
    
    // Layout views

    NSDictionary *views = NSDictionaryOfVariableBindings(_cloudView, groundView, _airPumpOne, _airPumpTwo, _airPumpThree);
    
    // Background views
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_cloudView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_cloudView(160.0)]" options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[groundView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[groundView(340.0)]|" options:0 metrics:nil views:views]];
    
    // Idea views
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.ideaViewOne attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:100.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.ideaViewOne attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:100.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.ideaViewOne attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:-170.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.ideaViewOne attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.ideaViewTwo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:100.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.ideaViewTwo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:100.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.ideaViewTwo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:-10.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.ideaViewTwo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.ideaViewThree attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:100.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.ideaViewThree attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:100.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.ideaViewThree attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:150.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.ideaViewThree attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    
    // AirPumps with airtube
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_airPumpOne(160.0)][_airPumpTwo(==_airPumpOne)][_airPumpThree(==_airPumpOne)]" options:(NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllTop) metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_airPumpOne(200.0)]|" options:0 metrics:nil views:views]];
}

#pragma mark - airPump delegate methods

- (void)didTapOnAirPump:(UIView *)airPumpView {
    
    void (^completionBlockA)(BOOL) = ^(BOOL finished) {
        [UIView animateWithDuration:1.0f animations:^{
            [self.ideaViewOne addIdeaWithImage:[UIImage imageNamed:@"blueDot.png"]];
        }];
    };
    
    void (^completionBlockB)(BOOL) = ^(BOOL finished) {
        [UIView animateWithDuration:1.0f animations:^{
            [self.ideaViewTwo addIdeaWithImage:[UIImage imageNamed:@"redDot.png"]];
        }];
    };
    
    void (^completionBlockC)(BOOL) = ^(BOOL finished) {
        [UIView animateWithDuration:1.0f animations:^{
            [self.ideaViewThree addIdeaWithImage:[UIImage imageNamed:@"greenDot.png"]];
        }];
    };
    
    [UIView animateWithDuration:5.0f animations:^{
        if ([airPumpView isEqual:self.airPumpOne]) {
            [self.airPumpOne.airTubeView animateIdeaAlongAirTubeAtPosition:@"Left" completion:completionBlockA];
        }
        else if ([airPumpView isEqual:self.airPumpTwo]) {
            [self.airPumpTwo.airTubeView animateIdeaAlongAirTubeAtPosition:@"Center" completion:completionBlockB];
        }
        else if ([airPumpView isEqual:self.airPumpThree]) {
            [self.airPumpThree.airTubeView animateIdeaAlongAirTubeAtPosition:@"Right" completion:completionBlockC];
        }
    }];
}

@end
