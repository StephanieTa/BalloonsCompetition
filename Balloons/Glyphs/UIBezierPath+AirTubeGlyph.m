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
    return airTubePath;
}

+ (instancetype)airTubeGlyphRight {
    UIBezierPath *airTubePath = [UIBezierPath bezierPath];
    return airTubePath;
}

@end
