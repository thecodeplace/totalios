//
//  RuleViewController.m
//  totalecard
//
//  Created by Vanipriya on 26/06/15.
//  Copyright (c) 2015 Vanipriya. All rights reserved.
//

#import "RuleViewController.h"

@interface RuleViewController ()

@end

@implementation RuleViewController
@synthesize rule,rulesLabel,ruleWebView;

- (void)viewDidLoad {
    rule=rule+1;
    NSLog(@"%ld",(long)rule);
    NSString *inStr = [NSString stringWithFormat: @"%ld", (long)rule];
    rulesLabel.text = inStr;
    self.navigationItem.title = [NSString stringWithFormat:@"%@%@", @"Golden Rule ",inStr];
    NSString *ruleFile = [NSString stringWithFormat:@"%@%@", @"rule",inStr];
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:ruleFile ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [self.ruleWebView loadHTMLString:htmlString baseURL:nil];
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
