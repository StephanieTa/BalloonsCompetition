//
//  ViewController.m
//  Balloons
//
//  Created by Stephanie Ta on 26.12.13.
//  Copyright (c) 2013 Stephanie Ta. All rights reserved.
//

#import "ViewController.h"

#import "UIColor+ColorTools.h"

#import "BalloonView.h"
#import "CloudView.h"
#import "IdeaView.h"


@interface ViewController ()

@property (nonatomic, strong) AirPumpView *airPumpOne;
@property (nonatomic, strong) AirPumpView *airPumpTwo;
@property (nonatomic, strong) AirPumpView *airPumpThree;

@property (nonatomic, strong) IdeaView *ideaViewOne;
@property (nonatomic, strong) IdeaView *ideaViewTwo;
@property (nonatomic, strong) IdeaView *ideaViewThree;

@property (nonatomic, strong) CloudView *cloudView;

@property (nonatomic, strong) NSLayoutConstraint *ideaViewOnePositionYConstraint;
@property (nonatomic, strong) NSLayoutConstraint *ideaViewTwoPositionYConstraint;
@property (nonatomic, strong) NSLayoutConstraint *ideaViewThreePositionYConstraint;

@property (nonatomic, assign) CGFloat currentHeightBalloonOne;
@property (nonatomic, assign) CGFloat currentHeightBalloonTwo;
@property (nonatomic, assign) CGFloat currentHeightBalloonThree;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentHeightBalloonOne = 10.0f;
    self.currentHeightBalloonTwo = 10.0f;
    self.currentHeightBalloonThree = 10.0f;
    
    // Set up cloud view
    
    self.cloudView = [[CloudView alloc] init];
    self.cloudView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.cloudView];
    [self.cloudView animateCloudView];
    
    // Set up ground view
    
    UIImageView *groundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"greenBG.png"]];
    groundView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:groundView];
    
    // Set up idea view

    self.ideaViewOne = [[IdeaView alloc] init];
    self.ideaViewOne.translatesAutoresizingMaskIntoConstraints = NO;
    [self.cloudView addSubview:self.ideaViewOne];
    
    self.ideaViewTwo = [[IdeaView alloc] init];
    self.ideaViewTwo.translatesAutoresizingMaskIntoConstraints = NO;
    [self.cloudView addSubview:self.ideaViewTwo];
    
    self.ideaViewThree = [[IdeaView alloc] init];
    self.ideaViewThree.translatesAutoresizingMaskIntoConstraints = NO;
    [self.cloudView addSubview:self.ideaViewThree];
    
    // Set up air pumps
    
    self.airPumpOne = [[AirPumpView alloc] init];
    self.airPumpOne.translatesAutoresizingMaskIntoConstraints = NO;
    self.airPumpOne.delegate = self;
    [self.view addSubview:self.airPumpOne];
    
    self.airPumpTwo = [[AirPumpView alloc] init];
    self.airPumpTwo.translatesAutoresizingMaskIntoConstraints = NO;
    self.airPumpTwo.delegate = self;
    [self.view addSubview:self.airPumpTwo];
    
    self.airPumpThree = [[AirPumpView alloc] init];
    self.airPumpThree.translatesAutoresizingMaskIntoConstraints = NO;
    self.airPumpThree.delegate = self;
    [self.view addSubview:self.airPumpThree];
    
    // Layout views

    NSDictionary *views = NSDictionaryOfVariableBindings(_cloudView, groundView, _ideaViewOne, _ideaViewTwo, _ideaViewThree, _airPumpOne, _airPumpTwo, _airPumpThree);
    
    // Background views
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_cloudView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_cloudView(200.0)]" options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[groundView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[groundView]|" options:0 metrics:nil views:views]];
    
    // Idea views
    [self.cloudView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20.0-[_ideaViewOne(100.0)]-60.0-[_ideaViewTwo(100.0)]-60.0-[_ideaViewThree(100.0)]" options:0 metrics:0 views:views]];
    
    [self.cloudView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.ideaViewOne
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:1.0f
                                   constant:100.0f]];
    
    [self.cloudView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.ideaViewTwo
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:1.0f
                                   constant:100.0f]];
    
    [self.cloudView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.ideaViewThree
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:1.0f
                                   constant:100.0f]];
    
    self.ideaViewOnePositionYConstraint = [NSLayoutConstraint constraintWithItem:self.ideaViewOne
                                                                       attribute:NSLayoutAttributeBottom
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.cloudView attribute:NSLayoutAttributeBottom
                                                                      multiplier:1.0f
                                                                        constant:20.0f];
    
    self.ideaViewTwoPositionYConstraint = [NSLayoutConstraint constraintWithItem:self.ideaViewTwo
                                                                       attribute:NSLayoutAttributeBottom
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.cloudView attribute:NSLayoutAttributeBottom
                                                                      multiplier:1.0f
                                                                        constant:20.0f];
    
    self.ideaViewThreePositionYConstraint = [NSLayoutConstraint constraintWithItem:self.ideaViewThree
                                                                       attribute:NSLayoutAttributeBottom
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.cloudView attribute:NSLayoutAttributeBottom
                                                                      multiplier:1.0f
                                                                        constant:20.0f];
    [self.cloudView addConstraints:@[self.ideaViewOnePositionYConstraint, self.ideaViewTwoPositionYConstraint, self.ideaViewThreePositionYConstraint]];
    
    // AirPumps with airtube
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_airPumpOne(160.0)][_airPumpTwo(==_airPumpOne)][_airPumpThree(==_airPumpOne)]" options:(NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllTop) metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_airPumpOne(120.0)]-20.0-|" options:0 metrics:nil views:views]];
}

#pragma mark - airPump delegate methods

- (void)didTapOnAirPump:(UIView *)airPumpView {
    
    void (^completionBlockA)(BOOL) = ^(BOOL finished) {
        CGPoint position = [self.ideaViewOne calculateNewIdeaPosition];
        [self.ideaViewOne drawDotAtPoint:position withImage:[UIImage imageNamed:@"blueDot.png"]];
        
        [CATransaction begin];
        [CATransaction setCompletionBlock:^{
            if (self.ideaViewOne.balloonHeightConstraint.constant > self.currentHeightBalloonOne) {
                self.currentHeightBalloonOne = self.ideaViewOne.balloonHeightConstraint.constant;
                self.ideaViewOnePositionYConstraint.constant -= 10.0f;
            }
        }];
    };
    
    void (^completionBlockB)(BOOL) = ^(BOOL finished) {
        CGPoint position = [self.ideaViewTwo calculateNewIdeaPosition];
        [self.ideaViewTwo drawDotAtPoint:position withImage:[UIImage imageNamed:@"redDot.png"]];
        
        [CATransaction begin];
        [CATransaction setCompletionBlock:^{
            if (self.ideaViewTwo.balloonHeightConstraint.constant > self.currentHeightBalloonTwo) {
                self.currentHeightBalloonTwo = self.ideaViewTwo.balloonHeightConstraint.constant;
                self.ideaViewTwoPositionYConstraint.constant -= 10.0f;
            }
        }];
    };
    
    void (^completionBlockC)(BOOL) = ^(BOOL finished) {
        CGPoint position = [self.ideaViewThree calculateNewIdeaPosition];
        [self.ideaViewThree drawDotAtPoint:position withImage:[UIImage imageNamed:@"greenDot.png"]];
        
        [CATransaction begin];
        [CATransaction setCompletionBlock:^{
            if (self.ideaViewThree.balloonHeightConstraint.constant > self.currentHeightBalloonThree) {
                self.currentHeightBalloonThree = self.ideaViewThree.balloonHeightConstraint.constant;
                self.ideaViewThreePositionYConstraint.constant -= 10.0f;
            }
        }];
    };
    
    if ([airPumpView isEqual:self.airPumpOne]) {
        [self.airPumpOne.airTubeView animateIdeaAlongPathWithCompletion:completionBlockA];
    }
    else if ([airPumpView isEqual:self.airPumpTwo]) {
        [self.airPumpTwo.airTubeView animateIdeaAlongPathWithCompletion:completionBlockB];
    }
    else if ([airPumpView isEqual:self.airPumpThree]) {
        [self.airPumpThree.airTubeView animateIdeaAlongPathWithCompletion:completionBlockC];
    }
}

@end
