//
//  RuleViewController.h
//  totalecard
//
//  Created by Vanipriya on 26/06/15.
//  Copyright (c) 2015 Vanipriya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RuleViewController : UIViewController
{
    NSInteger rule;
}
@property (weak, nonatomic) IBOutlet UILabel *rulesLabel;
@property (weak, nonatomic) IBOutlet UIWebView *ruleWebView;
@property (nonatomic, assign) NSInteger rule;
@end
