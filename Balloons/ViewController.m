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


@interface ViewController ()

@property (nonatomic) CGFloat size;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithFloatRed:250.0f green:247.0f blue:100.0f alpha:1.0f];
    
    // Set up air tubes
    
    self.airTubeViewOne = [[AirTubeView alloc] init];
    [self.airTubeViewOne drawAirTubeAtPosition:@"Left"];
    [self.view addSubview:self.airTubeViewOne];
    
    self.airTubeViewTwo = [[AirTubeView alloc] init];
    [self.airTubeViewTwo drawAirTubeAtPosition:@"Center"];
    [self.view addSubview:self.airTubeViewTwo];
    
    self.airTubeViewThree = [[AirTubeView alloc] init];
    [self.airTubeViewThree drawAirTubeAtPosition:@"Right"];
    [self.view addSubview:self.airTubeViewThree];
    
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
    
    // Set up balloon
    
    self.balloonView = [[BalloonView alloc] init];
    self.balloonView.translatesAutoresizingMaskIntoConstraints = NO;
    self.balloonView.backgroundColor = [UIColor redColor];
    self.size = 1.5f;
//    [self.view addSubview:self.balloonView];
    
    // Layout
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_airPumpOne, _airPumpTwo, _airPumpThree, _airTubeViewOne, _airTubeViewTwo, _airTubeViewThree);
    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:-200.0f]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:80.0f]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-25.0-[_airTubeViewOne(210.0)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-140.0-[_airTubeViewOne(160.0)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-185.0-[_airTubeViewTwo(125.0)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-140.0-[_airTubeViewTwo(165.0)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-245.0-[_airTubeViewThree(220.0)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-140.0-[_airTubeViewThree(160.0)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50.0-[_airPumpOne(40.0)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_airPumpOne(100.0)]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-210.0-[_airPumpTwo(==_airPumpOne)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_airPumpTwo(_airPumpOne)]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-400.0-[_airPumpThree(==_airPumpOne)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_airPumpThree(_airPumpOne)]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
}

#pragma mark - airPump delegate methods

- (void)didTapOnAirPump:(UIView *)airPumpView {
    [UIView animateWithDuration:5.0f animations:^{
        if ([airPumpView isEqual:self.airPumpOne]) {
            [self.airTubeViewOne animateIdeaAlongAirTubeAtPosition:@"Left"];
        }
        else if ([airPumpView isEqual:self.airPumpTwo]) {
            [self.airTubeViewTwo animateIdeaAlongAirTubeAtPosition:@"Center"];
        }
        else if ([airPumpView isEqual:self.airPumpThree]) {
            [self.airTubeViewThree animateIdeaAlongAirTubeAtPosition:@"Right"];
        }
    } completion:^(BOOL finished) {
        self.balloonView.transform = CGAffineTransformMakeScale(self.size, self.size);
    }];
    self.size = self.size * 1.5f;
}

@end
