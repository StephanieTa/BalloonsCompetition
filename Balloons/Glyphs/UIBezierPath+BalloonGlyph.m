//
//  UIBezierPath+BalloonGlyph.m
//  Balloons
//
//  Created by Stephanie Ta on 29.12.13.
//  Copyright (c) 2013 Stephanie Ta. All rights reserved.
//

#import "UIBezierPath+BalloonGlyph.h"

@implementation UIBezierPath (BalloonGlyph)

+ (instancetype)balloonGlyph {
    UIBezierPath *balloonPath = [UIBezierPath bezierPath];
    [balloonPath moveToPoint:CGPointMake(21.5f, 45.5f)];
    [balloonPath addCurveToPoint:CGPointMake(25.5f, 58.5f) controlPoint1:CGPointMake(21.5f, 49.5f) controlPoint2:CGPointMake(23.3f, 58.96f)];
    [balloonPath addCurveToPoint:CGPointMake(31.5f, 54.5f) controlPoint1:CGPointMake(27.7f, 58.04f) controlPoint2:CGPointMake(31.5f, 54.5f)];
    [balloonPath addCurveToPoint:CGPointMake(24.5f, 49.5f) controlPoint1:CGPointMake(31.5f, 54.5f) controlPoint2:CGPointMake(22.53f, 51.66f)];
    [balloonPath addCurveToPoint:CGPointMake(34.5f, 41.5f) controlPoint1:CGPointMake(26.47f, 47.34f) controlPoint2:CGPointMake(30.9f, 47.12f)];
    [balloonPath addCurveToPoint:CGPointMake(38.5f, 16.5f) controlPoint1:CGPointMake(38.1f, 35.88f) controlPoint2:CGPointMake(43.08f, 31.3f)];
    [balloonPath addCurveToPoint:CGPointMake(22.5f, 3.5f) controlPoint1:CGPointMake(33.92f, 1.7f) controlPoint2:CGPointMake(22.5f, 3.5f)];
    [balloonPath addCurveToPoint:CGPointMake(4.5f, 16.5f) controlPoint1:CGPointMake(22.5f, 3.5f) controlPoint2:CGPointMake(8.47f, 1.06f)];
    [balloonPath addCurveToPoint:CGPointMake(10.5f, 42.5f) controlPoint1:CGPointMake(0.53f, 31.94f) controlPoint2:CGPointMake(6.95f, 37.01f)];
    [balloonPath addCurveToPoint:CGPointMake(21.5f, 49.5f) controlPoint1:CGPointMake(14.05f, 47.99f) controlPoint2:CGPointMake(21.5f, 49.5f)];
    [[UIColor blackColor] setStroke];
    balloonPath.lineWidth = 1.0f;
    [balloonPath stroke];
    return balloonPath;
}

@end
