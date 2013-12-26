//
//  AirPumpView.m
//  Balloons
//
//  Created by Stephanie Ta on 26.12.13.
//  Copyright (c) 2013 Stephanie Ta. All rights reserved.
//

#import "AirPumpView.h"

@interface AirPumpView ()

- (void)onAirPumpTouchUpInside:(id)sender;

@end

@implementation AirPumpView

- (void)initAirPump {
    self.stick = [[UIView alloc] initWithFrame:CGRectMake(12.5f, 0, 25.0f, 50.0f)];
    self.stick.backgroundColor = [UIColor blackColor];
    [self addSubview:self.stick];
    
    self.airPump = [[UIButton alloc] initWithFrame:CGRectMake(12.5f, 50.0f, 25.0f, 50.0f)];
    self.airPump.backgroundColor = [UIColor yellowColor];
    self.airPump.userInteractionEnabled = YES;
    [self.airPump addTarget:self action:@selector(onAirPumpTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.airPump];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        [self initAirPump];
    }
    return self;
}

#pragma mark - Private methods

- (void)onAirPumpTouchUpInside:(id)sender {
    [UIView animateWithDuration:0.5f
                     animations:^{
                         self.stick.frame = CGRectMake(12.5f, 50.0f, 25.0f, 50.0f);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.5f
                                          animations:^{
                                              self.stick.frame = CGRectMake(12.5f, 0, 25.0f, 50.0f);
                                          }
                          ];
                     }
     ];
    [self.delegate didTapOnAirPump:self];
}

@end
