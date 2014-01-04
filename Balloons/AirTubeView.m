//
//  AirTubeView.m
//  Balloons
//
//  Created by Stephanie Ta on 03.01.14.
//  Copyright (c) 2014 Stephanie Ta. All rights reserved.
//

#import "AirTubeView.h"

#import "UIBezierPath+AirTubeGlyphLeft.h"

@interface AirTubeView ()

- (void)drawAirTubeCurveWithPosition:(NSString *)position;

@end

@implementation AirTubeView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self drawAirTubeCurveWithPosition:@"Left"];
        [self drawAirTubeCurveWithPosition:@"Center"];
        [self drawAirTubeCurveWithPosition:@"Right"];
    }
    return self;
}

- (void)drawAirTubeCurveWithPosition:(NSString *)position {
    UIBezierPath *path;
    if ([position isEqualToString:@"Left"]) {
        path = [UIBezierPath airTubeGlyphLeft];
    }
    else if ([position isEqualToString:@"Center"]) {
        path = [UIBezierPath airTubeGlyphLeft];
    }
    else if ([position isEqualToString:@"Right"]) {
        path = [UIBezierPath airTubeGlyphLeft];
    }
    
    UIGraphicsBeginImageContext(CGSizeMake(100.0f, 100.0f));
    
    UIBezierPath *tube = path;
    [[UIColor blackColor] setStroke];
    tube.lineWidth = 1.0f;
    [tube stroke];
    
    UIImage *tubeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *tubeImageView = [[UIImageView alloc] initWithImage:tubeImage];
    [self addSubview:tubeImageView];
}

- (void)animateIdeaAlongAirTubeAtPosition:(NSString *)position {
    UIBezierPath *path;
    if ([position isEqualToString:@"Left"]) {
        path = [UIBezierPath airTubeGlyphLeft];
    }
    else if ([position isEqualToString:@"Center"]) {
        path = [UIBezierPath airTubeGlyphLeft];
    }
    else if ([position isEqualToString:@"Right"]) {
        path = [UIBezierPath airTubeGlyphLeft];
    }
    
	//Prepare the animation
	CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	pathAnimation.calculationMode = kCAAnimationPaced;
	pathAnimation.fillMode = kCAFillModeForwards;
	pathAnimation.removedOnCompletion = NO;
	pathAnimation.duration = 5.0;
	pathAnimation.repeatCount = 1;
	
	//Setup the path for the animation
    
    CGPathRef tubePath = CGPathCreateMutable();
    tubePath = path.CGPath;
	pathAnimation.path = tubePath;
	
	// Set up moving circle
	UIGraphicsBeginImageContext(CGSizeMake(100.0f, 100.0f));
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
	CGContextAddEllipseInRect(context, CGRectMake(47.5f, 47.5f, 5.0f, 5.0f));
	CGContextDrawPath(context, kCGPathFillStroke);
	UIImage *circle = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	self.circleView = [[UIImageView alloc] initWithImage:circle];
	self.circleView.frame = CGRectMake(0, 0, 100.0f, 100.0f);
	[self addSubview:self.circleView];
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        [self.circleView removeFromSuperview];
    }];
	//Add the animation to the circleView - once you add the animation to the layer, the animation starts
	[self.circleView.layer addAnimation:pathAnimation forKey:@"moveTheSquare"];
    [CATransaction commit];
}

@end
