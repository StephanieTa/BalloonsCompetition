//
//  AirTubeView.m
//  Balloons
//
//  Created by Stephanie Ta on 03.01.14.
//  Copyright (c) 2014 Stephanie Ta. All rights reserved.
//

#import "AirTubeView.h"

#import "UIBezierPath+AirTubeGlyph.h"


@implementation AirTubeView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = nil;
        self.opaque = NO;
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

- (void)drawAirTubeAtPosition:(NSString *)position {
    
    // Check which path to draw
    
    UIBezierPath *tubePath;
    CGSize imageContext;
    
    if ([position isEqualToString:@"Left"]) {
        tubePath = [UIBezierPath airTubeGlyphLeft];
        imageContext = CGSizeMake(210.0f, 160.0f);
    }
    else if ([position isEqualToString:@"Center"]) {
        tubePath = [UIBezierPath airTubeGlyphCenter];
        imageContext = CGSizeMake(125.0f, 165.0f);
    }
    else if ([position isEqualToString:@"Right"]) {
        tubePath = [UIBezierPath airTubeGlyphRight];
        imageContext = CGSizeMake(220.0f, 160.0f);
    }
    
    // Draw path
    
    UIGraphicsBeginImageContext(imageContext);
    
    tubePath.lineWidth = 3.0f;
    [[UIColor blackColor] setStroke];
    [tubePath stroke];
    
    UIImage *tubeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *tubeImageView = [[UIImageView alloc] initWithImage:tubeImage];
    [self addSubview:tubeImageView];
}

- (void)animateIdeaAlongAirTubeAtPosition:(NSString *)position {
    
	// Prepare the animation
    
	CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	pathAnimation.calculationMode = kCAAnimationPaced;
	pathAnimation.fillMode = kCAFillModeForwards;
	pathAnimation.duration = 5.0;
    
    // Check from which airPump tap comes from to set up the path for the animation
    
    UIBezierPath *tubePath;
    CGSize imageContext;
    CGRect circleRect;
    CGRect circleViewFrame;
    
    if ([position isEqualToString:@"Left"]) {
        tubePath = [UIBezierPath airTubeGlyphLeft];
        imageContext = CGSizeMake(210.0f, 160.0f);
        circleRect = CGRectMake(103.0f, 77.0f, 4.0f, 4.0f);
        circleViewFrame = CGRectMake(0, 0, 210.0f, 160.0f);
    }
    else if ([position isEqualToString:@"Center"]) {
        tubePath = [UIBezierPath airTubeGlyphCenter];
        imageContext = CGSizeMake(120.0f, 165.0f);
        circleRect = CGRectMake(57.0f, 79.5f, 4.0f, 4.0f);
        circleViewFrame = CGRectMake(0, 0, 120.0f, 165.0);
    }
    else if ([position isEqualToString:@"Right"]) {
        tubePath = [UIBezierPath airTubeGlyphRight];
        imageContext = CGSizeMake(220.0f, 160.0f);
        circleRect = CGRectMake(107.0f, 77.5f, 4.0f, 4.0f);
        circleViewFrame = CGRectMake(0, 0, 220.0f, 160.0f);
    }
	pathAnimation.path = tubePath.CGPath;
	
	// Set up moving circle
    
	UIGraphicsBeginImageContext(imageContext);
	CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, circleRect);
	CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
	CGContextDrawPath(context, kCGPathFillStroke);
	UIImage *circle = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
    UIImageView *circleView = [[UIImageView alloc] initWithImage:circle];
	circleView.frame = circleViewFrame;
	[self addSubview:circleView];
    
    // Animation
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        [circleView removeFromSuperview];
    }];
	[circleView.layer addAnimation:pathAnimation forKey:@"moveTheSquare"];
    [CATransaction commit];
}

@end
