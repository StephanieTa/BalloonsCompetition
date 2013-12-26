//
//  AirPumpView.h
//  Balloons
//
//  Created by Stephanie Ta on 26.12.13.
//  Copyright (c) 2013 Stephanie Ta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AirPumpView : UIView

@property (nonatomic, strong) UIButton *airPump;
@property (nonatomic, strong) UIView *stick;

- (void)initAirPump;

@end
