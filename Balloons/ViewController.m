//
//  ViewController.m
//  Balloons
//
//  Created by Stephanie Ta on 26.12.13.
//  Copyright (c) 2013 Stephanie Ta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.airPumpView = [[AirPumpView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds), 50.0f, 100.0f)];
    
    [self.view addSubview:self.airPumpView];
}

@end
