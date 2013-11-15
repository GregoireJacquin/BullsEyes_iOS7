//
//  ViewController.h
//  BullsEyes
//
//  Created by Mac Dev on 13/11/2013.
//  Copyright (c) 2013 RetroTouch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BullsEyesViewController : UIViewController <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *targetLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *roundLabel;
- (IBAction)startOver;
- (IBAction)sliderMoved:(id)slider;
- (IBAction)showAlert;
@end
