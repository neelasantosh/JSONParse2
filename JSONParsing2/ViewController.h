//
//  ViewController.h
//  JSONParsing2
//
//  Created by Rajesh on 17/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *labelCityName;

- (IBAction)getWeather:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

