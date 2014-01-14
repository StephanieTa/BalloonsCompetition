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

- (void)drawAirTube {
    UIGraphicsBeginImageContext(CGSizeMake(125.0f, 115.0));
    
    UIBezierPath *tubePath = [UIBezierPath airTubeGlyphCenter];
    [tubePath applyTransform:CGAffineTransformMakeScale(1.0f, 0.7f)];
    tubePath.lineWidth = 3.0f;
    [[UIColor blackColor] setStroke];
    [tubePath stroke];
    
    UIImage *tubeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *tubeImageView = [[UIImageView alloc] initWithImage:tubeImage];
    [self addSubview:tubeImageView];
}

- (void)animateIdeaAlongAirTubeAtPosition:(NSString *)position completion:(void (^)(BOOL))completionBlock {
    
	// Prepare the animation
    
	CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	pathAnimation.calculationMode = kCAAnimationPaced;
	pathAnimation.fillMode = kCAFillModeForwards;
	pathAnimation.duration = 5.0;
    
    UIBezierPath *tubePath = [UIBezierPath airTubeGlyphCenter];
    [tubePath applyTransform:CGAffineTransformMakeScale(1.0f, 0.7f)];
    [tubePath applyTransform:CGAffineTransformMakeTranslation(0, -25.0f)];
    pathAnimation.path = tubePath.CGPath;
    CGRect circleRect = CGRectMake(57.0f, 79.5f, 6.0f, 6.0f);
    CGRect circleViewFrame = CGRectMake(0, 0, 125.0f, 115.0);
    
	// Set up moving circle
    
	UIGraphicsBeginImageContext(CGSizeMake(125.0f, 115.0));
	CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, circleRect);
	CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
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
        completionBlock(YES);
    }];
	[circleView.layer addAnimation:pathAnimation forKey:@"moveAlongPath"];
    [CATransaction commit];
}

@end
