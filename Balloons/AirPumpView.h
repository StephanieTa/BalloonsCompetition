//
//  AirPumpView.h
//  Balloons
//
//  Created by Stephanie Ta on 26.12.13.
//  Copyright (c) 2013 Stephanie Ta. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AirTubeView.h"

@protocol AirPumpViewDelegate;

@interface AirPumpView : UIView

@property (nonatomic, strong) UIImageView *bottomView;
@property (nonatomic, strong) UIImageView *topView;
@property (nonatomic, strong) AirTubeView *airTubeView;
@property (nonatomic, weak) id <AirPumpViewDelegate> delegate;

- (void)initAirPump;

@end

@protocol AirPumpViewDelegate <NSObject>

- (void)didTapOnAirPump:(UIView *)airPumpView;

@end
