//
//  ViewController.h
//  Balloons
//
//  Created by Stephanie Ta on 26.12.13.
//  Copyright (c) 2013 Stephanie Ta. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AirPumpView.h"
#import "BalloonView.h"

@interface ViewController : UIViewController <AirPumpViewDelegate>

@property (nonatomic, strong) AirPumpView *airPumpView;
@property (nonatomic, strong) BalloonView *balloonView;

@end
