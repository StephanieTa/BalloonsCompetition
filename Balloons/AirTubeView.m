//
//  AirTubeView.m
//  Balloons
//
//  Created by Stephanie Ta on 03.01.14.
//  Copyright (c) 2014 Stephanie Ta. All rights reserved.
//

#import "AirTubeView.h"

#import "UIBezierPath+AirTubeGlyph.h"


@interface AirTubeView ()

@end


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
    if ([position isEqualToString:@"Left"]) {
        tubePath = [UIBezierPath airTubeGlyphLeft];
    }
    else if ([position isEqualToString:@"Center"]) {
        tubePath = [UIBezierPath airTubeGlyphCenter];
    }
    else if ([position isEqualToString:@"Right"]) {
        tubePath = [UIBezierPath airTubeGlyphLeft];
    }
    
    // Draw path
    
    UIGraphicsBeginImageContext(CGSizeMake(120.0f, 100.0f));
    
    tubePath.lineWidth = 1.0f;
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
    if ([position isEqualToString:@"Left"]) {
        tubePath = [UIBezierPath airTubeGlyphLeft];
    }
    else if ([position isEqualToString:@"Center"]) {
        tubePath = [UIBezierPath airTubeGlyphCenter];
    }
    else if ([position isEqualToString:@"Right"]) {
        tubePath = [UIBezierPath airTubeGlyphLeft];
    }
	pathAnimation.path = tubePath.CGPath;
	
	// Set up moving circle
    
	UIGraphicsBeginImageContext(CGSizeMake(120.0f, 100.0f));
	CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, CGRectMake(60.0f, 47.5f, 5.0f, 5.0f));
	CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
	CGContextDrawPath(context, kCGPathFillStroke);
	UIImage *circle = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	self.circleView = [[UIImageView alloc] initWithImage:circle];
	self.circleView.frame = CGRectMake(0, 0, 120.0f, 100.0f);
	[self addSubview:self.circleView];
    
    // Animation
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        [self.circleView removeFromSuperview];
    }];
	[self.circleView.layer addAnimation:pathAnimation forKey:@"moveTheSquare"];
    [CATransaction commit];
}

@end
