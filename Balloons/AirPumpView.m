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
    
    self.top = [[UIView alloc] initWithFrame:CGRectMake(0, 20.0f, 40.0f, 20.0f)];
    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"airPumpTop.png"]];
    topView.frame = CGRectMake(0, 0, 40.0f, 20.0f);
    [self.top addSubview:topView];
    [self addSubview:self.top];
    
    // Set up air pump bottom
    
    self.bottom = [[UIButton alloc] initWithFrame:CGRectMake(0, 35.0f, 40.0f, 50.0f)];
    UIImage *airPumpBottomImg = [UIImage imageNamed:@"luftpumpe.png"];
    [self.bottom setBackgroundImage:airPumpBottomImg forState:UIControlStateNormal];
    self.bottom.userInteractionEnabled = YES;
    [self addSubview:self.bottom];

    // Actions
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onAirPumpTouchUpInside:)];
    [self.top addGestureRecognizer:tapGesture];
    
    [self.bottom addTarget:self action:@selector(onAirPumpTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
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
                         self.top.frame = CGRectMake(0, 30.0f, 40.0f, 20.0f);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.5f
                                          animations:^{
                                              self.top.frame = CGRectMake(0, 17.0f, 40.0f, 20.0f);
                                          }
                          ];
                             [self.delegate didTapOnAirPump:self];
                     }
     ];
}

@end
