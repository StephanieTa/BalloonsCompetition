//
//  MasterBalloonView.h
//  Balloons
//
//  Created by Stephanie Ta on 07.01.14.
//  Copyright (c) 2014 Stephanie Ta. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BalloonView.h"

@interface MasterBalloonView : UIView

@property (nonatomic, strong) BalloonView *firstChildBalloonView;
@property (nonatomic, strong) BalloonView *secondChildBalloonView;
@property (nonatomic, strong) BalloonView *thirdChildBalloonView;

@property (nonatomic, weak) NSLayoutConstraint *firstChildBalloonWidthConstraint;
@property (nonatomic, weak) NSLayoutConstraint *firstChildBalloonHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *secondChildBalloonWidthConstraint;
@property (nonatomic, weak) NSLayoutConstraint *secondChildBalloonHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *thirdChildBalloonWidthConstraint;
@property (nonatomic, weak) NSLayoutConstraint *thirdChildBalloonHeightConstraint;

@end
