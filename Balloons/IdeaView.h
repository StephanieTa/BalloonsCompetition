//
//  IdeaView.h
//  Balloons
//
//  Created by Stephanie Ta on 14.01.14.
//  Copyright (c) 2014 Stephanie Ta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BalloonView.h"

@interface IdeaView : UIView

@property (nonatomic, strong) BalloonView *balloonView;

- (void)addIdeaWithImage:(UIImage *)image;
- (void)drawDotAtPoint:(CGPoint)point withImage:(UIImage *)image;

@end
