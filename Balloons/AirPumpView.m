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
    
    self.topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"airPumpTop.png"]];
    self.topView.frame = CGRectMake(5.0f, 17.0f, 30.0f, 20.0f);
    [self addSubview:self.topView];
    
    // Set up air pump bottom
    
    self.bottomView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"airPumpBottomRed.png"]];
    self.bottomView.frame = CGRectMake(0, 35.0f, 40.0f, 50.0f);
    [self addSubview:self.bottomView];

    // Actions
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onAirPumpTouchUpInside:)];
    [self addGestureRecognizer:tapGesture];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = nil;
        self.opaque = NO;
        self.translatesAutoresizingMaskIntoConstraints = NO;
        [self initAirPump];
    }
    return self;
}

#pragma mark - Private methods

- (void)onAirPumpTouchUpInside:(id)sender {
    [UIView animateWithDuration:0.5f
                     animations:^{
                         self.topView.frame = CGRectMake(5.0f, 30.0f, 30.0f, 20.0f);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.5f
                                          animations:^{
                                              self.topView.frame = CGRectMake(5.0f, 17.0f, 30.0f, 20.0f);
                                          }
                          ];
                             [self.delegate didTapOnAirPump:self];
                     }
     ];
}

@end
