//
//  ParticleSystemView.m
//  Balloons
//
//  Created by Stephanie Ta on 06.01.14.
//  Copyright (c) 2014 Stephanie Ta. All rights reserved.
//

#import "ParticleSystemView.h"

@interface ParticleSystemView ()

@property (nonatomic, strong) CAEmitterLayer *ideaEmitter;

- (void)initIdeaEmitter;

@end

@implementation ParticleSystemView

- (void)initIdeaEmitter {
    self.ideaEmitter = (CAEmitterLayer *)self.layer;
    self.ideaEmitter.emitterPosition = CGPointMake(50, 50);
    self.ideaEmitter.emitterSize = CGSizeMake(10, 10);
    self.ideaEmitter.emitterShape = kCAEmitterLayerSphere;
    
    CAEmitterCell* idea = [CAEmitterCell emitterCell];
    idea.birthRate = 0;
    idea.lifetime = INFINITY;
    idea.lifetimeRange = INFINITY;
    idea.color = [[UIColor blackColor] CGColor];
    idea.contents = (id)[UIImage imageNamed:@"waterDrop.png"].CGImage;
    [idea setName:@"idea"];
    
    idea.velocity = 10;
    idea.velocityRange = 20;
    idea.emissionRange = M_PI_2;
    
    idea.scaleSpeed = 0.3;
    idea.spin = 0.5;
    
    self.ideaEmitter.renderMode = kCAEmitterLayerAdditive;
    self.ideaEmitter.emitterCells = [NSArray arrayWithObject:idea];
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initIdeaEmitter];
    }
    return self;
}

+ (Class)layerClass {
    return [CAEmitterLayer class];
}

@end
