//
//  AirTubeView.m
//  Balloons
//
//  Created by Stephanie Ta on 03.01.14.
//  Copyright (c) 2014 Stephanie Ta. All rights reserved.
//

#import "AirTubeView.h"

#import "UIBezierPath+AirTubeGlyphLeft.h"

@implementation AirTubeView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self drawAirTubeCurveLeft];
    }
    return self;
}

- (void)drawAirTubeCurveLeft {
    UIGraphicsBeginImageContext(CGSizeMake(100.0f, 100.0f));
    
    UIBezierPath *tube = [UIBezierPath airTubeGlyphLeft];
    [[UIColor blackColor] setStroke];
    tube.lineWidth = 1.0f;
    [tube stroke];
    
    UIImage *tubeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *tubeImageView = [[UIImageView alloc] initWithImage:tubeImage];
    [self addSubview:tubeImageView];
}

- (void)animateIdeaAlongAirTube {
    
	//Prepare the animation
	CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	pathAnimation.calculationMode = kCAAnimationPaced;
	pathAnimation.fillMode = kCAFillModeForwards;
	pathAnimation.removedOnCompletion = NO;
	pathAnimation.duration = 5.0;
	pathAnimation.repeatCount = 1;
	
	//Setup the path for the animation
    
    CGPathRef tubePath = CGPathCreateMutable();
    tubePath = [UIBezierPath airTubeGlyphLeft].CGPath;
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
    
	//Add the animation to the circleView - once you add the animation to the layer, the animation starts
	[self.circleView.layer addAnimation:pathAnimation forKey:@"moveTheSquare"];
}

@end
