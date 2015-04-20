//
//  GameViewController.m
//  Flappy Bird Clone
//
//  Created by Mukul Surajiwale on 1/5/15.
//  Copyright (c) 2015 Mukul Surajiwale. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Hide the start button
    self.startOverButton.hidden = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonPressed:(UIButton *)sender {
    // Hide start button
    self.startButton.hidden = true;
    // Call birdMoving every 0.05 seconds. Decrease the time interval to increase the speed of the birds movements.
    self.birdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(birdMoving) userInfo:nil repeats:true];
    // Call tunnelMoving every 0.01. Decrease the time time interval to increase the speed at which the tunnels move across the screen.
    [self placeTunnels];
    self.tunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(tunnelMoving) userInfo:nil repeats:true];
    
}

- (IBAction)screenTapped:(UITapGestureRecognizer *)sender {
    self.birdFlight = 30;
}

- (void)birdMoving{
    self.birdImageView.center = CGPointMake(self.birdImageView.center.x, self.birdImageView.center.y - self.birdFlight);
    self.birdFlight = self.birdFlight - 5;
    
    if (self.birdFlight < -15) {
        self.birdFlight = -15;
    }

}

- (void)placeTunnels{
    self.randomTopTunnelPosition = arc4random() % 350;
    self.randomTopTunnelPosition = self.randomTopTunnelPosition - 228;
    self.randomBottomTunnelPosition = self.randomTopTunnelPosition + 655;
    
    self.tunnelTop.center = CGPointMake(385, self.randomTopTunnelPosition);
    self.tunnelBottom.center = CGPointMake(385, self.randomBottomTunnelPosition);
}

- (void)tunnelMoving{
    
    self.tunnelTop.center = CGPointMake(self.tunnelTop.center.x - 2, self.tunnelTop.center.y);
    self.tunnelBottom.center = CGPointMake(self.tunnelBottom.center.x - 2, self.tunnelBottom.center.y);
    
    if (self.tunnelTop.center.x < -40) {
        [self placeTunnels];
    }
    
    if (CGRectIntersectsRect(self.birdImageView.frame, self.tunnelTop.frame)) {
        [self gameOver];
    }
    
    if (CGRectIntersectsRect(self.birdImageView.frame, self.tunnelBottom.frame)) {
        [self gameOver];
    }
    
    if (CGRectIntersectsRect(self.birdImageView.frame, self.top.frame)) {
        [self gameOver];
    }
    
    if (CGRectIntersectsRect(self.birdImageView.frame, self.bottom.frame)) {
        [self gameOver];
    }
    

}

- (void)gameOver{
    [self.birdMovement invalidate];
    [self.tunnelMovement invalidate];
    self.startOverButton.hidden = false;
}

@end























