//
//  AirTubeView.h
//  Balloons
//
//  Created by Stephanie Ta on 03.01.14.
//  Copyright (c) 2014 Stephanie Ta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AirTubeView : UIView

- (void)drawAirTubeAtPosition:(NSString *)position;
- (void)animateIdeaAlongAirTubeAtPosition:(NSString *)position completion:(void (^)(BOOL finished))completionBlock;

@end
