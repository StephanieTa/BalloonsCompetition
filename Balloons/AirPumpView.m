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
    
    // Set up air pump top
    
    self.stick = [[UIView alloc] initWithFrame:CGRectMake(60.0f, 0, 40.0f, 20.0f)];
    UIImageView *stickView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"luftpumpeTop.png"]];
    stickView.frame = CGRectMake(0, 0, 40.0f, 20.0f);
    [self.stick addSubview:stickView];
    [self addSubview:self.stick];
    
    // Set up air pump bottom
    
    self.airPump = [[UIButton alloc] initWithFrame:CGRectMake(60.0f, 35.0f, 40.0f, 50.0f)];
    UIImage *airPumpImg = [UIImage imageNamed:@"luftpumpe.png"];
    [self.airPump setBackgroundImage:airPumpImg forState:UIControlStateNormal];
    self.airPump.userInteractionEnabled = YES;
    [self addSubview:self.airPump];

    // Actions
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onAirPumpTouchUpInside:)];
    [self.stick addGestureRecognizer:tapGesture];
    
    [self.airPump addTarget:self action:@selector(onAirPumpTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
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
                         self.stick.frame = CGRectMake(60.0f, 20.0f, 40.0f, 20.0f);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.5f
                                          animations:^{
                                              self.stick.frame = CGRectMake(60.0f, 0, 40.0f, 20.0f);
                                          }
                          ];
                         [self.delegate didTapOnAirPump:self];
                     }
     ];
}

@end
