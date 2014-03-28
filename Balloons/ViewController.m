//
//  ViewController.m
//  Balloons
//
//  Created by Stephanie Ta on 26.12.13.
//  Copyright (c) 2013 Stephanie Ta. All rights reserved.
//

#import "ViewController.h"

#import "CloudView.h"
#import "IdeaView.h"


@interface ViewController ()

@property (nonatomic, strong) AirPumpView *airPumpOne;
@property (nonatomic, strong) AirPumpView *airPumpTwo;
@property (nonatomic, strong) AirPumpView *airPumpThree;

@property (nonatomic, strong) IdeaView *ideaViewOne;
@property (nonatomic, strong) IdeaView *ideaViewTwo;
@property (nonatomic, strong) IdeaView *ideaViewThree;

@property (nonatomic, strong) CloudView *cloudView;

@property (nonatomic, strong) NSLayoutConstraint *ideaViewOnePositionYConstraint;
@property (nonatomic, strong) NSLayoutConstraint *ideaViewTwoPositionYConstraint;
@property (nonatomic, strong) NSLayoutConstraint *ideaViewThreePositionYConstraint;

@property (nonatomic, assign) CGFloat currentHeightBalloonOne;
@property (nonatomic, assign) CGFloat currentHeightBalloonTwo;
@property (nonatomic, assign) CGFloat currentHeightBalloonThree;

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSCalendar *calendar;
@property (nonatomic) NSInteger counter;

@property (nonatomic, strong) NSDate *start;
@property (nonatomic, strong) NSDate *stop;

- (void)logDataFromAirPump:(AirPumpView *)airpump;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setNeedsUpdateConstraints];
    
    self.currentHeightBalloonOne = 10.0f;
    self.currentHeightBalloonTwo = 10.0f;
    self.currentHeightBalloonThree = 10.0f;
    
    // Log start of user study
    
    self.counter = 1;
    self.start = [NSDate date];
    
    /* Comment this out when you start the app on your device
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDirectory = [paths objectAtIndex:0];
    NSString *path = [docsDirectory stringByAppendingPathComponent:@"dataLoggingFromDevice_competition.txt"];
    */
    
//    /* Comment this out when you start the app on the simulator, CHANGE "van" in path to your username!!!
    NSString *path = @"/Users/van/Desktop/dataLoggingFromSimulator_competition.txt";
//    */
    
//    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]){
        [[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
    }
    
    NSString *message = @"\n***** Start of new user study: Model Competition *****\n\n";
    NSFileHandle *logFile = [NSFileHandle fileHandleForUpdatingAtPath:path];
    [logFile seekToEndOfFile];
    [logFile writeData:[message dataUsingEncoding:NSUTF8StringEncoding]];
    
    // Set up cloud view
    
    self.cloudView = [[CloudView alloc] init];
    self.cloudView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.cloudView];
    [self.cloudView animateCloudView];
    
    // Set up ground view
    
    UIImageView *grasslandView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"grassland.png"]];
    grasslandView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:grasslandView];
    
    // Set up idea view

    self.ideaViewOne = [[IdeaView alloc] init];
    self.ideaViewOne.translatesAutoresizingMaskIntoConstraints = NO;
    [self.ideaViewOne.balloonView setUpBalloonWithImage:[UIImage imageNamed:@"balloonPurple.png"]];
    [self.cloudView addSubview:self.ideaViewOne];
    
    self.ideaViewTwo = [[IdeaView alloc] init];
    self.ideaViewTwo.translatesAutoresizingMaskIntoConstraints = NO;
    [self.ideaViewTwo.balloonView setUpBalloonWithImage:[UIImage imageNamed:@"balloonGreen.png"]];
    [self.cloudView addSubview:self.ideaViewTwo];
    
    self.ideaViewThree = [[IdeaView alloc] init];
    self.ideaViewThree.translatesAutoresizingMaskIntoConstraints = NO;
    [self.ideaViewThree.balloonView setUpBalloonWithImage:[UIImage imageNamed:@"balloonDarkBlue.png"]];
    [self.cloudView addSubview:self.ideaViewThree];
    
    // Set up air pumps
    
    self.airPumpOne = [[AirPumpView alloc] init];
    self.airPumpOne.translatesAutoresizingMaskIntoConstraints = NO;
    [self.airPumpOne setUpAirPumpWithID:@"Links" andImage:[UIImage imageNamed:@"airPumpBottomPurple.png"]];
    self.airPumpOne.delegate = self;
    [self.view addSubview:self.airPumpOne];
    
    self.airPumpTwo = [[AirPumpView alloc] init];
    self.airPumpTwo.translatesAutoresizingMaskIntoConstraints = NO;
    [self.airPumpTwo setUpAirPumpWithID:@"Mitte" andImage:[UIImage imageNamed:@"airPumpBottomGreen.png"]];
    self.airPumpTwo.delegate = self;
    [self.view addSubview:self.airPumpTwo];
    
    self.airPumpThree = [[AirPumpView alloc] init];
    self.airPumpThree.translatesAutoresizingMaskIntoConstraints = NO;
    [self.airPumpThree setUpAirPumpWithID:@"Rechts" andImage:[UIImage imageNamed:@"airPumpBottomBlue.png"]];
    self.airPumpThree.delegate = self;
    [self.view addSubview:self.airPumpThree];
    
    // Layout views

    NSDictionary *views = NSDictionaryOfVariableBindings(_cloudView, grasslandView, _ideaViewOne, _ideaViewTwo, _ideaViewThree, _airPumpOne, _airPumpTwo, _airPumpThree);
    
    // Background views
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_cloudView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_cloudView(200.0)]" options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[grasslandView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[grasslandView]|" options:0 metrics:nil views:views]];
    
    // Idea views
    [self.cloudView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-35.0-[_ideaViewOne(100.0)]-90.0-[_ideaViewTwo(100.0)]-90.0-[_ideaViewThree(100.0)]" options:0 metrics:0 views:views]];
    
    [self.cloudView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.ideaViewOne
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:1.0f
                                   constant:100.0f]];
    
    [self.cloudView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.ideaViewTwo
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:1.0f
                                   constant:100.0f]];
    
    [self.cloudView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.ideaViewThree
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:1.0f
                                   constant:100.0f]];
    
    self.ideaViewOnePositionYConstraint = [NSLayoutConstraint constraintWithItem:self.ideaViewOne
                                                                       attribute:NSLayoutAttributeBottom
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.cloudView attribute:NSLayoutAttributeBottom
                                                                      multiplier:1.0f
                                                                        constant:20.0f];
    
    self.ideaViewTwoPositionYConstraint = [NSLayoutConstraint constraintWithItem:self.ideaViewTwo
                                                                       attribute:NSLayoutAttributeBottom
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.cloudView attribute:NSLayoutAttributeBottom
                                                                      multiplier:1.0f
                                                                        constant:20.0f];
    
    self.ideaViewThreePositionYConstraint = [NSLayoutConstraint constraintWithItem:self.ideaViewThree
                                                                       attribute:NSLayoutAttributeBottom
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.cloudView attribute:NSLayoutAttributeBottom
                                                                      multiplier:1.0f
                                                                        constant:20.0f];
    [self.cloudView addConstraints:@[self.ideaViewOnePositionYConstraint, self.ideaViewTwoPositionYConstraint, self.ideaViewThreePositionYConstraint]];
    
    // AirPumps with airtube
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_airPumpOne(==_airPumpTwo)][_airPumpTwo(==_airPumpOne)][_airPumpThree(==_airPumpTwo)]|" options:(NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllTop) metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_airPumpOne(120.0)]-20.0-|" options:0 metrics:nil views:views]];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - airPump delegate methods

- (void)didTapOnAirPump:(UIView *)airPumpView {
    
    void (^completionBlockA)(BOOL) = ^(BOOL finished) {
        CGPoint position = [self.ideaViewOne calculateNewIdeaPosition];
        [self.ideaViewOne drawDotAtPoint:position withImage:[UIImage imageNamed:@"dotPurple.png"]];
        
        [CATransaction begin];
        [CATransaction setCompletionBlock:^{
            if (self.ideaViewOne.balloonHeightConstraint.constant > self.currentHeightBalloonOne) {
                self.currentHeightBalloonOne = self.ideaViewOne.balloonHeightConstraint.constant;
                self.ideaViewOnePositionYConstraint.constant -= 10.0f;
                
                [UIView animateWithDuration:0.5f animations:^{
                    [self.view layoutIfNeeded];
                }];
            }
        }];
        [CATransaction commit];
    };
    
    void (^completionBlockB)(BOOL) = ^(BOOL finished) {
        CGPoint position = [self.ideaViewTwo calculateNewIdeaPosition];
        [self.ideaViewTwo drawDotAtPoint:position withImage:[UIImage imageNamed:@"dotGreen.png"]];
        
        [CATransaction begin];
        [CATransaction setCompletionBlock:^{
            if (self.ideaViewTwo.balloonHeightConstraint.constant > self.currentHeightBalloonTwo) {
                self.currentHeightBalloonTwo = self.ideaViewTwo.balloonHeightConstraint.constant;
                self.ideaViewTwoPositionYConstraint.constant -= 10.0f;
                
                [UIView animateWithDuration:0.5f animations:^{
                    [self.view layoutIfNeeded];
                }];
            }
        }];
        [CATransaction commit];
    };
    
    void (^completionBlockC)(BOOL) = ^(BOOL finished) {
        CGPoint position = [self.ideaViewThree calculateNewIdeaPosition];
        [self.ideaViewThree drawDotAtPoint:position withImage:[UIImage imageNamed:@"dotBlue.png"]];
        
        [CATransaction begin];
        [CATransaction setCompletionBlock:^{
            if (self.ideaViewThree.balloonHeightConstraint.constant > self.currentHeightBalloonThree) {
                self.currentHeightBalloonThree = self.ideaViewThree.balloonHeightConstraint.constant;
                self.ideaViewThreePositionYConstraint.constant -= 10.0f;
                
                [UIView animateWithDuration:0.5f animations:^{
                    [self.view layoutIfNeeded];
                }];
            }
        }];
        [CATransaction commit];
    };
    
    if ([airPumpView isEqual:self.airPumpOne]) {
        [self.airPumpOne.airTubeView animateIdeaAlongPathWithCompletion:completionBlockA];
        [self logDataFromAirPump:self.airPumpOne];
    }
    else if ([airPumpView isEqual:self.airPumpTwo]) {
        [self.airPumpTwo.airTubeView animateIdeaAlongPathWithCompletion:completionBlockB];
        [self logDataFromAirPump:self.airPumpTwo];
    }
    else if ([airPumpView isEqual:self.airPumpThree]) {
        [self.airPumpThree.airTubeView animateIdeaAlongPathWithCompletion:completionBlockC];
        [self logDataFromAirPump:self.airPumpThree];
    }
}

#pragma mark - Private methods

- (void)logDataFromAirPump:(AirPumpView *)airpump {
    
    // Berechnung der Uhrzeit
    
    self.date = [NSDate date];
    self.calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [self.calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:self.date];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    NSInteger second = [components second];
    
    // Berechnung der Zeitdauer
    
    self.stop = [NSDate date];
    NSTimeInterval timeIntervall = [self.stop timeIntervalSinceDate:self.start];
    int timeIntervallMinutes = (int)floor(timeIntervall/60.0f);
    int timeIntervallSeconds = (int)round(timeIntervall - timeIntervallMinutes * 60.0f);
    NSString *timeIntervallString = [NSString stringWithFormat:@"%d:%d", timeIntervallMinutes, timeIntervallSeconds];
    
    // Logging
    
    /* Comment this out when you start the app on your device
     NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
     NSString *docsDirectory = [paths objectAtIndex:0];
     NSString *path = [docsDirectory stringByAppendingPathComponent:@"dataLoggingFromDevice_competition.txt"];
     */
    
//    /* Comment this out when you start the app on the simulator, CHANGE "van" in path to your username!!!
    NSString *path = @"/Users/van/Desktop/dataLoggingFromSimulator_competition.txt";
//    */
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]){
        [[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
    }
    
    NSString *message = [NSString stringWithFormat:@"%d. Uhrzeit: %d:%d:%d, Zeitdauer: %@, Luftpumpe: %@\n", (int)self.counter, (int)hour, (int)minute, (int)second, timeIntervallString, airpump.identification];
    NSFileHandle *logFile = [NSFileHandle fileHandleForUpdatingAtPath:path];
    [logFile seekToEndOfFile];
    [logFile writeData:[message dataUsingEncoding:NSUTF8StringEncoding]];
    
    self.counter += 1;
}

@end
