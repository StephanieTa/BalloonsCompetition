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
#import "CloudView.h"


static CGFloat const balloonSize = 100.0f;
static CGFloat const dotSize = 10.0f;


@interface ViewController ()

@property (nonatomic, strong) CloudView *cloudView;
@property (nonatomic, strong) UIView *dotViewOne;
@property (nonatomic, strong) UIView *dotViewTwo;
@property (nonatomic, strong) UIView *dotViewThree;
@property (nonatomic, strong) NSLayoutConstraint *balloonOneWidthConstraint;
@property (nonatomic, strong) NSLayoutConstraint *balloonOneHeightConstraint;
@property (nonatomic, strong) NSLayoutConstraint *balloonTwoWidthConstraint;
@property (nonatomic, strong) NSLayoutConstraint *balloonTwoHeightConstraint;
@property (nonatomic, strong) NSLayoutConstraint *balloonThreeWidthConstraint;
@property (nonatomic, strong) NSLayoutConstraint *balloonThreeHeightConstraint;

@property (nonatomic) NSInteger round;
@property (nonatomic) BOOL yTurn;
@property (nonatomic) NSInteger changeNr;
@property (nonatomic) CGPoint point;

- (void)addIdeaToBalloonWithImage:(UIImage *)image;
- (void)drawDotAtPoint:(CGPoint)point withImage:(UIImage *)image;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set up cloud view
    
    self.cloudView = [[CloudView alloc] init];
    [self.view addSubview:self.cloudView];
    [self.cloudView animateCloudView];
    
    // Set up balloons
    
    self.balloonViewOne = [[BalloonView alloc] init];
    self.balloonViewOne.translatesAutoresizingMaskIntoConstraints = NO;
    [self.balloonViewOne setNeedsLayout];
    [self.balloonViewOne layoutIfNeeded];
    [self.cloudView addSubview:self.balloonViewOne];
    
    self.balloonViewTwo = [[BalloonView alloc] init];
    self.balloonViewTwo.translatesAutoresizingMaskIntoConstraints = NO;
    [self.balloonViewTwo setNeedsLayout];
    [self.balloonViewTwo layoutIfNeeded];
    [self.cloudView addSubview:self.balloonViewTwo];
    
    self.balloonViewThree = [[BalloonView alloc] init];
    self.balloonViewThree.translatesAutoresizingMaskIntoConstraints = NO;
    [self.balloonViewThree setNeedsLayout];
    [self.balloonViewThree layoutIfNeeded];
    [self.cloudView addSubview:self.balloonViewThree];
    
    // Set up dot view
    
    self.dotViewOne = [[UIView alloc] init];
    self.dotViewOne.translatesAutoresizingMaskIntoConstraints = NO;
    self.dotViewOne.backgroundColor = nil;
    self.dotViewOne.opaque = NO;
    [self.cloudView addSubview:self.dotViewOne];
    
    self.dotViewTwo = [[UIView alloc] init];
    self.dotViewTwo.translatesAutoresizingMaskIntoConstraints = NO;
    self.dotViewTwo.backgroundColor = nil;
    self.dotViewTwo.opaque = NO;
    [self.cloudView addSubview:self.dotViewTwo];
    
    self.dotViewThree = [[UIView alloc] init];
    self.dotViewThree.translatesAutoresizingMaskIntoConstraints = NO;
    self.dotViewThree.backgroundColor = nil;
    self.dotViewThree.opaque = NO;
    [self.cloudView addSubview:self.dotViewThree];
    
    // Set up ground view
    
    UIImageView *groundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"greenBG.png"]];
    groundView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:groundView];
    
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
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_cloudView, groundView, _airPumpOne, _airPumpTwo, _airPumpThree, _balloonViewOne, _balloonViewTwo, _balloonViewThree);
    
    // Background
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_cloudView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_cloudView(160.0)]" options:0 metrics:nil views:views]];
    
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[groundView]|" options:0 metrics:nil views:views]];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[groundView(340.0)]|" options:0 metrics:nil views:views]];
    
    // Balloons
    self.balloonTwoWidthConstraint = [NSLayoutConstraint constraintWithItem:self.balloonViewOne attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:10.0f];
    self.balloonTwoHeightConstraint = [NSLayoutConstraint constraintWithItem:self.balloonViewOne attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:10.0f];
    [self.cloudView addConstraints:@[self.balloonTwoWidthConstraint, self.balloonTwoHeightConstraint]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonViewOne attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonViewOne attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    
    self.balloonOneWidthConstraint = [NSLayoutConstraint constraintWithItem:self.balloonViewTwo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:10.0f];
    self.balloonOneHeightConstraint = [NSLayoutConstraint constraintWithItem:self.balloonViewTwo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:10.0f];
    [self.cloudView addConstraints:@[self.balloonOneWidthConstraint, self.balloonOneHeightConstraint]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonViewTwo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:-100.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonViewTwo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    
    self.balloonThreeWidthConstraint = [NSLayoutConstraint constraintWithItem:self.balloonViewThree attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:10.0f];
    self.balloonThreeHeightConstraint = [NSLayoutConstraint constraintWithItem:self.balloonViewThree attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:10.0f];
    [self.cloudView addConstraints:@[self.balloonThreeWidthConstraint, self.balloonThreeHeightConstraint]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonViewThree attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:100.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.balloonViewThree attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    
    // Dot view
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.dotViewOne attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:100.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.dotViewOne attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:100.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.dotViewOne attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:-100.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.dotViewOne attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.dotViewTwo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:100.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.dotViewTwo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:100.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.dotViewTwo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.dotViewTwo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.dotViewThree attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:100.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.dotViewThree attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:100.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.dotViewThree attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:100.0f]];
    [self.cloudView addConstraint:[NSLayoutConstraint constraintWithItem:self.dotViewThree attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.cloudView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    
    // AirPumps with airtube
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_airPumpOne(160.0)][_airPumpTwo(==_airPumpOne)][_airPumpThree(==_airPumpOne)]" options:(NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllTop) metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_airPumpOne(200.0)]|" options:0 metrics:nil views:views]];
    
    // Calculation properties
    
    self.round = 0;
    self.yTurn = YES;
    self.changeNr = 1;
    self.point = CGPointMake(balloonSize/2.0f - dotSize/2.0f, balloonSize/2.0f - dotSize/2.0f);
}

#pragma mark - airPump delegate methods

- (void)didTapOnAirPump:(UIView *)airPumpView {
    
    void (^completionBlockA)(BOOL) = ^(BOOL finished) {
        [UIView animateWithDuration:1.0f animations:^{
            [self addIdeaToBalloonWithImage:[UIImage imageNamed:@"blueDot.png"]];
        }];
    };
    
    void (^completionBlockB)(BOOL) = ^(BOOL finished) {
        [UIView animateWithDuration:1.0f animations:^{
            [self addIdeaToBalloonWithImage:[UIImage imageNamed:@"redDot.png"]];
        }];
    };
    
    void (^completionBlockC)(BOOL) = ^(BOOL finished) {
        [UIView animateWithDuration:1.0f animations:^{
            [self addIdeaToBalloonWithImage:[UIImage imageNamed:@"greenDot.png"]];
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

#pragma mark - Private methods

- (void)addIdeaToBalloonWithImage:(UIImage *)image {
    CGPoint point = self.point;
    
    // Calculate point at where to add new idea
    
    if (self.round == 0) {
        [self drawDotAtPoint:point withImage:image];
        self.round++;
    }
    else {
        if (self.round % 2 == 1) {
            if (self.yTurn) {
                point.y = point.y - 10.0f;
                if (self.changeNr == self.round) {
                    self.yTurn = NO;
                }
                self.changeNr++;
            }
            else {
                point.x = point.x - 10.0f;
                if (self.changeNr == self.round * 2) {
                    self.yTurn = YES;
                    self.changeNr = 1;
                    self.round++;
                }
                else {
                    self.changeNr++;
                }
            }
        }
        else if (self.round % 2 == 0) {
            if (self.yTurn) {
                point.y = point.y + 10.0f;
                if (self.changeNr == self.round) {
                    self.yTurn = NO;
                }
                self.changeNr++;
            }
            else {
                point.x = point.x + 10.0f;
                if (self.changeNr == self.round * 2) {
                    self.yTurn = YES;
                    self.changeNr = 1;
                    self.round++;
                }
                else {
                    self.changeNr++;
                }
            }
        }
        self.point = point;
        
        // Draw dot at calculated point
        [self drawDotAtPoint:point withImage:image];
    }
}

- (void)drawDotAtPoint:(CGPoint)point withImage:(UIImage *)image {
    UIImageView *dotImageView = [[UIImageView alloc] initWithImage:image];
    dotImageView.alpha = 0;
    dotImageView.frame = CGRectMake(point.x + 5.0f, point.y + 10.0f, 8.0f, 8.0f);
    
    if ([image isEqual:[UIImage imageNamed:@"blueDot.png"]]) {
        [CATransaction begin];
        [CATransaction setCompletionBlock:^{
            [UIView animateWithDuration:0.5f animations:^{
                dotImageView.alpha = 1.0f;
                dotImageView.frame = CGRectMake(point.x, point.y, 8.0f, 8.0f);
                
                // Recalculate balloonView size
                CGFloat widthCount = ceilf(sqrtf(self.dotViewOne.subviews.count));
                self.balloonOneWidthConstraint.constant = CGRectGetWidth(dotImageView.bounds) * widthCount * 2.0f;
                self.balloonOneHeightConstraint.constant = CGRectGetWidth(dotImageView.bounds) * widthCount * 2.0f;
            }];
        }];
        
        [self.dotViewOne addSubview:dotImageView];
        [CATransaction commit];
    }
    else if ([image isEqual:[UIImage imageNamed:@"redDot.png"]]) {
        [CATransaction begin];
        [CATransaction setCompletionBlock:^{
            [UIView animateWithDuration:0.5f animations:^{
                dotImageView.alpha = 1.0f;
                dotImageView.frame = CGRectMake(point.x, point.y, 8.0f, 8.0f);
                
                // Recalculate balloonView size
                CGFloat widthCount = ceilf(sqrtf(self.dotViewTwo.subviews.count));
                self.balloonTwoWidthConstraint.constant = CGRectGetWidth(dotImageView.bounds) * widthCount * 2.0f;
                self.balloonTwoHeightConstraint.constant = CGRectGetWidth(dotImageView.bounds) * widthCount * 2.0f;
            }];
        }];
        
        [self.dotViewTwo addSubview:dotImageView];
        [CATransaction commit];
    }
    else if ([image isEqual:[UIImage imageNamed:@"greenDot.png"]]) {
        [CATransaction begin];
        [CATransaction setCompletionBlock:^{
            [UIView animateWithDuration:0.5f animations:^{
                dotImageView.alpha = 1.0f;
                dotImageView.frame = CGRectMake(point.x, point.y, 8.0f, 8.0f);
                
                // Recalculate balloonView size
                CGFloat widthCount = ceilf(sqrtf(self.dotViewThree.subviews.count));
                self.balloonThreeWidthConstraint.constant = CGRectGetWidth(dotImageView.bounds) * widthCount * 2.0f;
                self.balloonThreeHeightConstraint.constant = CGRectGetWidth(dotImageView.bounds) * widthCount * 2.0f;
            }];
        }];
        
        [self.dotViewThree addSubview:dotImageView];
        [CATransaction commit];
    }
   
}

@end
