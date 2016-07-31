//
//  ViewController.m
//  JSONParsing2
//
//  Created by Rajesh on 17/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize labelCityName,textView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getWeather:(id)sender {
    
    NSString *city = labelCityName.text;
    
    NSString *str = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@,uk&appid=2de143494c0b295cca9337e1e96b00e0",city];
    
    NSURL *url = [NSURL URLWithString:str];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        //parse weather JSON
        NSError *jsonError;
        NSMutableDictionary *rootDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&jsonError];
        
        NSLog(@"Weather Data:%@",rootDictionary);
        //get temperature
        NSDictionary *mainDictionary = [rootDictionary objectForKey:@"main"];
        NSNumber *numtemp = [mainDictionary objectForKey:@"temp"];
        NSMutableArray *weatherArray = [rootDictionary objectForKey:@"weather"];
        NSMutableDictionary *weatherDictionary = [weatherArray objectAtIndex:0];
        NSString *weatherDesc = [weatherDictionary objectForKey:@"description"];
       
        
        textView.text = [NSString stringWithFormat:@"temp:%@,Desc:%@",numtemp,weatherDesc];
        
        
    }];
    
    
    
    
}
@end
