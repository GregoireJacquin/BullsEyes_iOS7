//
//  AboutViewController.h
//  BullsEyes
//
//  Created by Mac Dev on 13/11/2013.
//  Copyright (c) 2013 RetroTouch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIWebView *webView;
- (IBAction)close;
@end
