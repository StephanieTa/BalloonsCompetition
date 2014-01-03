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
    self.airPumpThree.backgroundColor = [UIColor greenColor];
    self.airPumpThree.delegate = self;
    [self.view addSubview:self.airPumpThree];
    
    // Set up balloon
    
    self.balloonView = [[BalloonView alloc] init];
    self.balloonView.translatesAutoresizingMaskIntoConstraints = NO;
    self.balloonView.backgroundColor = [UIColor redColor];
    self.size = 1.5f;
//    [self.view addSubview:self.balloonView];
    
    // Set up air tubes
    
    self.airTubeViewOne = [[AirTubeView alloc] init];
    self.airTubeViewOne.translatesAutoresizingMaskIntoConstraints = NO;
    self.airTubeViewOne.backgroundColor = nil;
    self.airTubeViewOne.opaque = NO;
    [self.view addSubview:self.airTubeViewOne];
    
    self.airTubeViewTwo = [[AirTubeView alloc] init];
    self.airTubeViewTwo.translatesAutoresizingMaskIntoConstraints = NO;
    self.airTubeViewTwo.backgroundColor = nil;
    self.airTubeViewTwo.opaque = NO;
    [self.view addSubview:self.airTubeViewTwo];
    
    self.airTubeViewThree = [[AirTubeView alloc] init];
    self.airTubeViewThree.translatesAutoresizingMaskIntoConstraints = NO;
    self.airTubeViewThree.backgroundColor = nil;
    self.airTubeViewThree.opaque = NO;
    [self.view addSubview:self.airTubeViewThree];
    
    // Constraints
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_airPumpOne, _airPumpTwo, _airPumpThree, _airTubeViewOne, _airTubeViewTwo, _airTubeViewThree);
    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:-200.0f]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:80.0f]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-90.0-[_airTubeViewOne(100.0)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-177.0-[_airTubeViewOne(100.0)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-250.0-[_airTubeViewTwo(100.0)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-177.0-[_airTubeViewTwo(100.0)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-350.0-[_airTubeViewThree(100.0)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-177.0-[_airTubeViewThree(100.0)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_airPumpOne][_airPumpTwo(==_airPumpOne)][_airPumpThree(==_airPumpOne)]|"
                                                                      options:NSLayoutFormatAlignAllBottom
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_airPumpOne(100.0)]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_airPumpTwo(100.0)]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_airPumpThree(100.0)]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
}

#pragma mark - airPumpOne delegate methods

- (void)didTapOnAirPump:(UIView *)airPumpView atPosition:(NSString *)position {
    [UIView animateWithDuration:5.0f animations:^{
        self.balloonView.transform = CGAffineTransformMakeScale(self.size, self.size);
    } completion:^(BOOL finished) {
        if ([position isEqualToString:@"Left"]) {
            [self.airTubeViewOne animateIdeaAlongAirTubeAtPosition:@"Left"];
        }
        else if ([position isEqualToString:@"Center"]) {
            [self.airTubeViewTwo animateIdeaAlongAirTubeAtPosition:@"Left"];
        }
        else if ([position isEqualToString:@"Right"]) {
            [self.airTubeViewThree animateIdeaAlongAirTubeAtPosition:@"Left"];
        }
    }];
    self.size = self.size * 1.5f;
    [self.airTubeViewOne.circleView removeFromSuperview];
}

@end
