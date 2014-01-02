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
    
    self.stick = [[UIView alloc] init];
    self.stick.translatesAutoresizingMaskIntoConstraints = NO;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onAirPumpTouchUpInside:)];
    [self.stick addGestureRecognizer:tapGesture];
    UIImageView *stickView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"luftpumpeTop.png"]];
    stickView.frame = self.stick.frame;
    [self.stick addSubview:stickView];
    [self addSubview:self.stick];
    
    // Set up air pump bottom
    
    self.airPump = [[UIButton alloc] init];
    self.airPump.translatesAutoresizingMaskIntoConstraints = NO;
    UIImage *airPumpImg = [UIImage imageNamed:@"luftpumpe.png"];
    [self.airPump setBackgroundImage:airPumpImg forState:UIControlStateNormal];
    self.airPump.userInteractionEnabled = YES;
    [self.airPump addTarget:self action:@selector(onAirPumpTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.airPump];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_stick, _airPump);
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10.0-[_stick(10.0)]-10.0-[_airPump]-10.0-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10.0-[_airPump]-10.0-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10.0-[_stick]-10.0-|" options:0 metrics:nil views:views]];
    
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
