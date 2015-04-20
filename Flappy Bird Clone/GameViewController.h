//
//  GameViewController.h
//  Flappy Bird Clone
//
//  Created by Mukul Surajiwale on 1/5/15.
//  Copyright (c) 2015 Mukul Surajiwale. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GameViewController : UIViewController

// IBOutlets
@property (strong, nonatomic) IBOutlet UIImageView *gameBackgroundImageView;
@property (nonatomic) NSTimer *birdMovement;
@property (nonatomic) int birdFlight;
@property (strong, nonatomic) IBOutlet UIImageView *birdImageView;
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UIImageView *tunnelTop;
@property (strong, nonatomic) IBOutlet UIImageView *tunnelBottom;
@property (strong, nonatomic) IBOutlet UIImageView *top;
@property (strong, nonatomic) IBOutlet UIImageView *bottom;
@property (nonatomic) NSTimer *tunnelMovement;
@property (nonatomic) int randomTopTunnelPosition;
@property (nonatomic) int randomBottomTunnelPosition;
@property (strong, nonatomic) IBOutlet UIButton *startOverButton;

// IBActions
- (IBAction)startButtonPressed:(UIButton *)sender;
- (IBAction)screenTapped:(UITapGestureRecognizer *)sender;
- (IBAction)startOverButtonPressed:(id)sender;

// Methods
- (void)birdMoving;
- (void)tunnelMoving;
- (void)placeTunnels;


@end
