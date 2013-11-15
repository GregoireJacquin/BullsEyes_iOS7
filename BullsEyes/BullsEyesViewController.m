//
//  ViewController.m
//  BullsEyes
//
//  Created by Mac Dev on 13/11/2013.
//  Copyright (c) 2013 RetroTouch. All rights reserved.
//

#import "BullsEyesViewController.h"

@interface BullsEyesViewController ()

@end

@implementation BullsEyesViewController
{
    int _currentValue;
    int _targetValue;
    int _score;
    int _round;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    UIImage *trackLeftImage =
    [[UIImage imageNamed:@"SliderTrackLeft"]
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)]; [self.slider setMinimumTrackImage:trackLeftImage
                                                                                           forState:UIControlStateNormal];
    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
    
    [self startNewGame];
    [self updateLabels];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (IBAction)startOver {
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self startNewGame];
    [self updateLabels];
    [self.view.layer addAnimation:transition forKey:nil];
}

- (IBAction)sliderMoved:(UISlider *)slider {
    
    _currentValue = lroundf(slider.value);
}

- (IBAction)showAlert {
    int difference = abs(_targetValue - _currentValue);
    int point = 100 - difference;
    
    NSString *title;
    NSString *message = [NSString stringWithFormat:@"You scored %d points ", point];
    if (difference == 0) {
        title = @"Perfect!";
        point += 100;
    } else if (difference < 5) {
       title = @"You almost had it!";
        point += 50;
    }
    else if (difference < 10){
        title = @"Pretty good !";
    }
    else {
        title = @"Not even close...";
    }
    
    UIAlertView *alert = [[UIAlertView alloc]
                            initWithTitle:title
                            message:message
                            delegate:self
                            cancelButtonTitle:@"Ok"
                            otherButtonTitles:nil, nil];
    _score += point;
    [alert show];
    
    
}
- (void)startNewGame {
    _score = 0;
    _round = 0;
    [self startNewRound];
}
- (void)startNewRound {
    _round += 1;
    _currentValue = 50;
    _targetValue = arc4random_uniform(100) + 1;
    self.slider.value = _currentValue;
}
- (void)updateLabels {
    self.targetLabel.text = [NSString stringWithFormat:@"%d",_targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",_score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d",_round];
}
#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    [self startNewRound];
    [self updateLabels];
}
@end
