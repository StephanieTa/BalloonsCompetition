//
//  UIBezierPath+AirTubeGlyphLeft.m
//  Balloons
//
//  Created by Stephanie Ta on 03.01.14.
//  Copyright (c) 2014 Stephanie Ta. All rights reserved.
//

#import "UIBezierPath+AirTubeGlyphLeft.h"

@implementation UIBezierPath (AirTubeGlyphLeft)

+ (instancetype)airTubeGlyphLeft {
    UIBezierPath *airTubeLeftPath = [UIBezierPath bezierPath];
    [airTubeLeftPath moveToPoint:CGPointMake(0, 80.0f)];
    [airTubeLeftPath addCurveToPoint:CGPointMake(42.86f, 61.55f) controlPoint1:CGPointMake(0, 80.0f) controlPoint2:CGPointMake(97.77f, 68.78f)];
    [airTubeLeftPath addCurveToPoint:CGPointMake(53.06f, 49.62f) controlPoint1:CGPointMake(-12.05, 54.77f) controlPoint2:CGPointMake(53.06f, 49.62f)];
    [airTubeLeftPath addCurveToPoint:CGPointMake(59.18f, 29.37f) controlPoint1:CGPointMake(53.06f, 49.62f) controlPoint2:CGPointMake(119.07f, 39.44f)];
    [airTubeLeftPath addCurveToPoint:CGPointMake(83.67f, 20.25f) controlPoint1:CGPointMake(-0.7, 19.3f) controlPoint2:CGPointMake(83.67f, 20.25f)];
    [airTubeLeftPath addCurveToPoint:CGPointMake(83.67f, 10.13f) controlPoint1:CGPointMake(83.67f, 20.25f) controlPoint2:CGPointMake(113.32f, 16.76f)];
    [airTubeLeftPath addCurveToPoint:CGPointMake(100.0f, 0) controlPoint1:CGPointMake(54.02f, 3.49f) controlPoint2:CGPointMake(100.0f, 0)];
    return airTubeLeftPath;
}

@end
