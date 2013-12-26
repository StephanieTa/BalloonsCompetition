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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *basicView = [[UIView alloc] init];
    basicView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds)/2.0f, CGRectGetHeight(self.view.bounds));
    basicView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:basicView];
    
    // Set up air pump
    
    self.airPumpView = [[AirPumpView alloc] initWithFrame:CGRectMake(20.0f, 200.0f, 150.0f, 200.0f)];
    self.airPumpView.delegate = self;
    [basicView addSubview:self.airPumpView];
    
    // Set up balloon
    
    self.balloonView = [[BalloonView alloc] initWithFrame:CGRectMake(40.0f, 100.0f, 50.0f, 50.0f)];
    [basicView addSubview:self.balloonView];
}

#pragma mark - AirPumpView delegate methods

- (void)didTapOnAirPump:(UIView *)airPumpView {
    [UIView animateWithDuration:2.0f animations:^{
        self.balloonView.ballon.frame = CGRectMake(0, 0, 40.0f, 40.0f);
        self.balloonView.ballon.layer.cornerRadius = self.balloonView.ballon.frame.size.width/2.0f;
    }];
}

@end
