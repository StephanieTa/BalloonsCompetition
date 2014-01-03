//
//  ViewController.h
//  Balloons
//
//  Created by Stephanie Ta on 26.12.13.
//  Copyright (c) 2013 Stephanie Ta. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AirPumpView.h"
#import "AirTubeView.h"
#import "BalloonView.h"

@interface ViewController : UIViewController <AirPumpViewDelegate>

@property (nonatomic, strong) AirPumpView *airPumpOne;
@property (nonatomic, strong) AirPumpView *airPumpTwo;
@property (nonatomic, strong) AirPumpView *airPumpThree;
@property (nonatomic, strong) BalloonView *balloonView;
@property (nonatomic, strong) AirTubeView *airTubeView;

@end
