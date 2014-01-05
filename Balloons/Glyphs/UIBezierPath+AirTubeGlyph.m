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
    [airTubePath moveToPoint:CGPointMake(30.35f, 163.0f)];
    [airTubePath addCurveToPoint:CGPointMake(64.79f, 123.7f) controlPoint1:CGPointMake(30.35f, 163.0f) controlPoint2:CGPointMake(14.28f, 135.65f)];
    [airTubePath addCurveToPoint:CGPointMake(99.24f, 87.21f) controlPoint1:CGPointMake(115.3f, 111.75f) controlPoint2:CGPointMake(147.47f, 86.88f)];
    [airTubePath addCurveToPoint:CGPointMake(50.03f, 67.56f) controlPoint1:CGPointMake(51.0f, 87.54f) controlPoint2:CGPointMake(-59.93f, 75.04f)];
    [airTubePath addCurveToPoint:CGPointMake(59.87f, 56.33f) controlPoint1:CGPointMake(159.99f, 60.09f) controlPoint2:CGPointMake(59.87f, 56.33f)];
    [airTubePath addCurveToPoint:CGPointMake(59.87f, 45.11) controlPoint1:CGPointMake(59.87f, 56.33f) controlPoint2:CGPointMake(-22.62f, 52.14f)];
    [airTubePath addCurveToPoint:CGPointMake(54.95f, 36.68f) controlPoint1:CGPointMake(142.36f, 38.07f) controlPoint2:CGPointMake(54.95f, 36.68f)];
    [airTubePath addCurveToPoint:CGPointMake(54.95f, 25.46f) controlPoint1:CGPointMake(54.95f, 36.68f) controlPoint2:CGPointMake(16.42f, 30.09f)];
    [airTubePath addCurveToPoint:CGPointMake(54.95f, 14.23f) controlPoint1:CGPointMake(93.48f, 20.82f) controlPoint2:CGPointMake(54.95f, 14.23f)];
    [airTubePath addCurveToPoint:CGPointMake(54.95f, 3.0f) controlPoint1:CGPointMake(54.95f, 14.23f) controlPoint2:CGPointMake(47.4f, 9.37f)];
    return airTubePath;
}

+ (instancetype)airTubeGlyphRight {
    UIBezierPath *airTubePath = [UIBezierPath bezierPath];
    return airTubePath;
}

@end
