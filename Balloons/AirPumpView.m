//
//  AirPumpView.m
//  Balloons
//
//  Created by Stephanie Ta on 26.12.13.
//  Copyright (c) 2013 Stephanie Ta. All rights reserved.
//

#import "AirPumpView.h"

@interface AirPumpView ()

@property (nonatomic, strong) UIImageView *bottomView;
@property (nonatomic, strong) UIImageView *topView;

- (void)initAirPump;
- (void)onAirPumpTouchUpInside:(id)sender;

@end


@implementation AirPumpView

- (void)initAirPump {
    
    // Set up air tube
    
    self.airTubeView = [[AirTubeView alloc] init];
    self.airTubeView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.airTubeView drawAirTube];
    [self addSubview:self.airTubeView];
    
    // Set up air pump top
    
    self.topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"airPumpTop.png"]];
    self.topView.frame = CGRectMake(60.0f, 55.0f, 30.0f, 20.0f);
    [self addSubview:self.topView];
    
    // Set up air pump bottom
    
    self.bottomView = [[UIImageView alloc] init];
    self.bottomView.userInteractionEnabled = YES;
    self.bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.bottomView];
    
    // Layout
    NSDictionary *views = NSDictionaryOfVariableBindings(_topView, _bottomView, _airTubeView);
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-55.0-[_bottomView(40.0)]" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_bottomView(50.0)]|" options:0 metrics:nil views:views]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.airTubeView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.airTubeView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:125.0f]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_airTubeView(115.0)]-2.0-|" options:0 metrics:nil views:views]];
    
    // Actions
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onAirPumpTouchUpInside:)];
    [self.bottomView addGestureRecognizer:tapGesture];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = nil;
        self.opaque = NO;
        [self initAirPump];
    }
    return self;
}

#pragma mark - Public methods

- (void)setUpAirPumpWithImage:(UIImage *)airPumpImage {
    [self.bottomView setImage:airPumpImage];
}

#pragma mark - Private methods

- (void)onAirPumpTouchUpInside:(id)sender {
    [UIView animateWithDuration:0.5f
                     animations:^{
                         self.topView.frame = CGRectMake(60.0f, 65.0f, 30.0f, 20.0f);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.5f
                                          animations:^{
                                              self.topView.frame = CGRectMake(60.0f, 55.0f, 30.0f, 20.0f);
                                          }
                          ];
                         [self.delegate didTapOnAirPump:self];
                     }
     ];
}

@end
