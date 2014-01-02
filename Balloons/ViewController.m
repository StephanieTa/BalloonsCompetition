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
    
    // Set up air pumps
    
    self.airPumpOne = [[AirPumpView alloc] init];
    self.airPumpOne.translatesAutoresizingMaskIntoConstraints = NO;
    self.airPumpOne.backgroundColor = [UIColor blueColor];
    self.airPumpOne.delegate = self;
    [self.view addSubview:self.airPumpOne];
    
    self.airPumpTwo = [[AirPumpView alloc] init];
    self.airPumpTwo.translatesAutoresizingMaskIntoConstraints = NO;
    self.airPumpTwo.backgroundColor = [UIColor yellowColor];
    self.airPumpTwo.delegate = self;
    [self.view addSubview:self.airPumpTwo];
    
    self.airPumpThree = [[AirPumpView alloc] init];
    self.airPumpThree.translatesAutoresizingMaskIntoConstraints = NO;
    self.airPumpThree.backgroundColor = [UIColor whiteColor];
    self.airPumpThree.delegate = self;
    [self.view addSubview:self.airPumpThree];
    
    // Set up balloon
    
    self.balloonView = [[BalloonView alloc] init];
    self.balloonView.translatesAutoresizingMaskIntoConstraints = NO;
    self.balloonView.backgroundColor = [UIColor redColor];
    self.size = 1.5f;
//    [self.view addSubview:self.balloonView];
    
    // Constraints
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_airPumpOne, _airPumpTwo, _airPumpThree);
    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:-200.0f]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:80.0f]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_airPumpOne][_airPumpTwo(==_airPumpOne)][_airPumpThree(==_airPumpOne)]|"
                                                                     options:NSLayoutFormatAlignAllBottom
                                                                     metrics:nil
                                                                       views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_airPumpOne(150.0)]-(10.0)-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
}

#pragma mark - airPumpOne delegate methods

- (void)didTapOnAirPump:(UIView *)airPumpOne {
    [UIView animateWithDuration:2.0f animations:^{
        self.balloonView.transform = CGAffineTransformMakeScale(self.size, self.size);
    }];
    self.size = self.size * 1.5f;
}

@end
