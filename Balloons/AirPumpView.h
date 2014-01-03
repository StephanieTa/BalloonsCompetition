//
//  AirPumpView.h
//  Balloons
//
//  Created by Stephanie Ta on 26.12.13.
//  Copyright (c) 2013 Stephanie Ta. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AirPumpViewDelegate;

@interface AirPumpView : UIView

@property (nonatomic, strong) UIButton *airPump;
@property (nonatomic, strong) UIView *stick;
@property (nonatomic) NSNumber *identification;
@property (nonatomic, weak) id <AirPumpViewDelegate> delegate;

- (void)initAirPump;

@end

@protocol AirPumpViewDelegate <NSObject>

- (void)didTapOnAirPump:(UIView *)airPumpView atPosition:(NSString *)position;

@end
