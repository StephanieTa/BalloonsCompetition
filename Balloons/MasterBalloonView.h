//
//  MasterBalloonView.h
//  Balloons
//
//  Created by Stephanie Ta on 07.01.14.
//  Copyright (c) 2014 Stephanie Ta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterBalloonView : UIView

@property (nonatomic, strong) UIView *firstChildBalloonView;
@property (nonatomic, strong) UIView *secondChildBalloonView;
@property (nonatomic, strong) UIView *thirdChildBalloonView;

@property (nonatomic, weak) NSLayoutConstraint *firstChildBalloonWidthConstraint;
@property (nonatomic, weak) NSLayoutConstraint *secondChildBalloonWidthConstraint;
@property (nonatomic, weak) NSLayoutConstraint *thirdChildBalloonWidthConstraint;

@end
