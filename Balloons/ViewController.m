//
//  ViewController.m
//  Balloons
//
//  Created by Stephanie Ta on 26.12.13.
//  Copyright (c) 2013 Stephanie Ta. All rights reserved.
//

#import "ViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@property (nonatomic) CGFloat size;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *viewA = [[UIView alloc] init];
    viewA.translatesAutoresizingMaskIntoConstraints = NO;
    viewA.backgroundColor = [UIColor blueColor];
    [self.view addSubview:viewA];
    
    // Set up air pump
    
    self.airPumpView = [[AirPumpView alloc] init];
    self.airPumpView.translatesAutoresizingMaskIntoConstraints = NO;
    self.airPumpView.backgroundColor = [UIColor whiteColor];
    self.airPumpView.delegate = self;
    [viewA addSubview:self.airPumpView];
    
    // Set up balloon
    
    self.balloonView = [[BalloonView alloc] init];
    self.balloonView.translatesAutoresizingMaskIntoConstraints = NO;
    self.balloonView.backgroundColor = [UIColor whiteColor];
    self.size = 1.5f;
    [viewA addSubview:self.balloonView];
    
    // Constraints
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[viewA(160.0)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(viewA)]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[viewA]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(viewA)]];
    
    [viewA addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:viewA attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0]];
    
    [viewA addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:viewA attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:-200.0f]];
    
    [viewA addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:80.0f]];
    
    [viewA addConstraint:[NSLayoutConstraint constraintWithItem:self.airPumpView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:viewA attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0]];
    
    [viewA addConstraint:[NSLayoutConstraint constraintWithItem:self.airPumpView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:80.0f]];
    
    [viewA addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_airPumpView(200.0)]-50.0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_airPumpView)]];
}

#pragma mark - AirPumpView delegate methods

- (void)didTapOnAirPump:(UIView *)airPumpView {
    [UIView animateWithDuration:2.0f animations:^{
        self.balloonView.transform = CGAffineTransformMakeScale(self.size, self.size);
    }];
    self.size = self.size * 1.5f;
}

@end
