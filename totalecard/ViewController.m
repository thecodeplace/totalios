//
//  ViewController.m
//  totalecard
//
//  Created by Vanipriya on 21/06/15.
//  Copyright (c) 2015 Vanipriya. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"anomaly"]) {
        
        //NSString *intro = @"Anomaly Reporting Card";
        ViewController2 *vc = [segue destinationViewController];
        vc.introString = @"anomaly";
    } else if ([segue.identifier isEqualToString:@"initiative"]) {
        
        //NSString *intro = @"Initiative Reporting Card";
        ViewController2 *vc = [segue destinationViewController];
        vc.introString = @"initiative";
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
