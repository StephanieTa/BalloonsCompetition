//
//  BalloonView.h
//  Balloons
//
//  Created by Stephanie Ta on 26.12.13.
//  Copyright (c) 2013 Stephanie Ta. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ParticleSystemView.h"

@interface BalloonView : UIView

@property (nonatomic, strong) UIView *ballon;
@property (nonatomic, strong) ParticleSystemView *ideaCloud;

@end
