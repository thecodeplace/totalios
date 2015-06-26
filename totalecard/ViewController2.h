//
//  ViewController2.h
//  totalecard
//
//  Created by Vanipriya on 21/06/15.
//  Copyright (c) 2015 Vanipriya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownPicker.h"

@interface ViewController2 : UIViewController <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) NSString *introString;

@property (weak, nonatomic) IBOutlet UILabel *reporterLabel;
@property (strong, nonatomic) DownPicker *downPicker;
@property (strong, nonatomic) DownPicker *packagedownPicker;
@property (nonatomic, retain) IBOutlet UITextField *reporterTextField;

@property (weak, nonatomic) IBOutlet UILabel *otherLocationLabel;
@property (weak, nonatomic) IBOutlet UITextField *otherLocationTextField;

@property (weak, nonatomic) IBOutlet UITextField *siteTextField;
@property (weak, nonatomic) IBOutlet UILabel *packageLabel;
@property (weak, nonatomic) IBOutlet UITextField *packageTextField;

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *siteLabel;

@property (weak, nonatomic) IBOutlet UITextField *otherPackageTextField;
-(void)fieldToBeChanged:(UITextField*)textFieldName colorValue:(int)val;


@end
