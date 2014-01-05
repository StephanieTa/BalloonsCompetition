//
//  UIBezierPath+AirTubeGlyph.m
//  Balloons
//
//  Created by Stephanie Ta on 04.01.14.
//  Copyright (c) 2014 Stephanie Ta. All rights reserved.
//

#import "UIBezierPath+AirTubeGlyph.h"

@implementation UIBezierPath (AirTubeGlyph)

+ (instancetype)airTubeGlyphLeft {
    UIBezierPath *airTubePath = [UIBezierPath bezierPath];
    [airTubePath moveToPoint:CGPointMake(0, 80.0f)];
    [airTubePath addCurveToPoint:CGPointMake(42.86f, 61.55f) controlPoint1:CGPointMake(0, 80.0f) controlPoint2:CGPointMake(97.77f, 68.78f)];
    [airTubePath addCurveToPoint:CGPointMake(53.06f, 49.62f) controlPoint1:CGPointMake(-12.05, 54.77f) controlPoint2:CGPointMake(53.06f, 49.62f)];
    [airTubePath addCurveToPoint:CGPointMake(59.18f, 29.37f) controlPoint1:CGPointMake(53.06f, 49.62f) controlPoint2:CGPointMake(119.07f, 39.44f)];
    [airTubePath addCurveToPoint:CGPointMake(83.67f, 20.25f) controlPoint1:CGPointMake(-0.7, 19.3f) controlPoint2:CGPointMake(83.67f, 20.25f)];
    [airTubePath addCurveToPoint:CGPointMake(83.67f, 10.13f) controlPoint1:CGPointMake(83.67f, 20.25f) controlPoint2:CGPointMake(113.32f, 16.76f)];
    [airTubePath addCurveToPoint:CGPointMake(100.0f, 0) controlPoint1:CGPointMake(54.02f, 3.49f) controlPoint2:CGPointMake(100.0f, 0)];
    return airTubePath;
}

+ (instancetype)airTubeGlyphCenter {
    UIBezierPath *airTubePath = [UIBezierPath bezierPath];
    [airTubePath moveToPoint:CGPointMake(64.43f, 100)];
    [airTubePath addCurveToPoint:CGPointMake(64.43f, 83.65f) controlPoint1:CGPointMake(64.43f, 100.0f) controlPoint2:CGPointMake(-80.54f, 97.37f)];
    [airTubePath addCurveToPoint:CGPointMake(23.18f, 65.31f) controlPoint1:CGPointMake(209.41f, 67.93f) controlPoint2:CGPointMake(25.1f, 71.51f)];
    [airTubePath addCurveToPoint:CGPointMake(60.5f, 56.12f) controlPoint1:CGPointMake(21.25f, 59.11f) controlPoint2:CGPointMake(19.67f, 61.43f)];
    [airTubePath addCurveToPoint:CGPointMake(64.43f, 46.94f) controlPoint1:CGPointMake(101.34f, 50.81f) controlPoint2:CGPointMake(123.67f, 51.32f)];
    [airTubePath addCurveToPoint:CGPointMake(40.86f, 39.8f) controlPoint1:CGPointMake(4.91f, 42.56f) controlPoint2:CGPointMake(40.86f, 39.8f)];
    [airTubePath addCurveToPoint:CGPointMake(72.29f, 29.59f) controlPoint1:CGPointMake(40.86f, 39.8f) controlPoint2:CGPointMake(129.91f, 29.75f)];
    [airTubePath addCurveToPoint:CGPointMake(39.88f, 22.45f) controlPoint1:CGPointMake(14.67f, 29.43f) controlPoint2:CGPointMake(39.88f, 22.45f)];
    [airTubePath addCurveToPoint:CGPointMake(63.45f, 13.27f) controlPoint1:CGPointMake(39.88f, 22.45f) controlPoint2:CGPointMake(120.82f, 19.02f)];
    [airTubePath addCurveToPoint:CGPointMake(76.22f, 7.14f) controlPoint1:CGPointMake(6.09f, 7.51f) controlPoint2:CGPointMake(74.41f, 9.13f)];
    [airTubePath addCurveToPoint:CGPointMake(56.58f, 3.06f) controlPoint1:CGPointMake(78.04f, 5.16f) controlPoint2:CGPointMake(56.58f, 3.06f)];
    [airTubePath addCurveToPoint:CGPointMake(63.45f, 0) controlPoint1:CGPointMake(56.58f, 3.06f) controlPoint2:CGPointMake(44.06f, 0.14f)];
    return airTubePath;
}

+ (instancetype)airTubeGlyphRight {
    UIBezierPath *airTubePath = [UIBezierPath bezierPath];
    return airTubePath;
}

@end
