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
    
    UIView *basicPumpView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 160.0f, 200.0f)];
    [self addSubview:basicPumpView];
    
    // Set up air pump top
    
    self.stick = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80.0f, 40.0f)];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onAirPumpTouchUpInside:)];
    [self.stick addGestureRecognizer:tapGesture];
    UIImageView *stickView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"luftpumpeTop.png"]];
    stickView.frame = self.stick.frame;
    [self.stick addSubview:stickView];
    [basicPumpView addSubview:self.stick];
    
    // Set up air pump bottom
    
    self.airPump = [[UIButton alloc] initWithFrame:CGRectMake(0, 50.0f, 80.0f, 150.0f)];
    UIImage *airPumpImg = [UIImage imageNamed:@"luftpumpe.png"];
    [self.airPump setBackgroundImage:airPumpImg forState:UIControlStateNormal];
    self.airPump.userInteractionEnabled = YES;
    [self.airPump addTarget:self action:@selector(onAirPumpTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [basicPumpView addSubview:self.airPump];
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
                         self.stick.frame = CGRectMake(0, 20.0f, 80.0f, 40.0f);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.5f
                                          animations:^{
                                              self.stick.frame = CGRectMake(0, 0, 80.0f, 40.0f);
                                          }
                          ];
                         [self.delegate didTapOnAirPump:self];
                     }
     ];
}

@end
