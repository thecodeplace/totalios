//
//  ViewController2.m
//  totalecard
//
//  Created by Vanipriya on 21/06/15.
//  Copyright (c) 2015 Vanipriya. All rights reserved.
//

#import "ViewController2.h"
#import "SecondViewController.h"
#import "DownPicker.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController2 ()

@end

@implementation ViewController2

@synthesize introString, label, otherPackageTextField, locationTextField, otherLocationTextField,siteTextField,packageTextField,reporterTextField;
@synthesize locationLabel,siteLabel,reporterLabel,otherLocationLabel,packageLabel;



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"proceed"]) {
        
        //NSString *intro = @"Anomaly Reporting Card";
        SecondViewController *vc = [segue destinationViewController];
        vc.introString = introString;
        [[segue destinationViewController] setReporter:reporterTextField.text];
        if (vc.view){
        if([locationTextField.text isEqualToString:@"Other"]){
            
            [[segue destinationViewController] setLocation:otherLocationTextField.text];
        }
        else{
            [[segue destinationViewController] setLocation:locationTextField.text];
        }
        
        [[segue destinationViewController] setReporter:reporterTextField.text];
        [[segue destinationViewController] setSite:siteTextField.text];
        
        if([packageTextField.text isEqualToString:@"Other"]){
            [[segue destinationViewController] setPackage:otherPackageTextField.text];
        }
        else{
            [[segue destinationViewController] setPackage:packageTextField.text];
        }
        }
    }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    BOOL ret=YES;
    
    if ([identifier isEqualToString:@"proceed"]) {
        if ([self.siteTextField.text isEqual:@""]) {
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Mandatory Field required"
                                                                  message:@"Please fill the site data"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles: nil];
            
            [myAlertView show];
            ret=NO;
            
            
        }
        else if ([self.locationTextField.text isEqual:@""]) {
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Mandatory Field required"
                                                                  message:@"Please fill the location data"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles: nil];
            
            [myAlertView show];
            ret=NO;
            
            
        }
        else if ([self.reporterTextField.text isEqual:@""]) {
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Mandatory Field required"
                                                                  message:@"Please fill the reporter data"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles: nil];
            
            [myAlertView show];
            ret=NO;
            
            
        }
        
        
        
    }
    return ret;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)fieldToBeChanged:(UITextField*)textFieldName colorValue:(int)val{
    switch (val) {
        case 1:textFieldName.layer.borderColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1].CGColor;
            
            break;
        case 2:textFieldName.layer.borderColor = [UIColor colorWithRed:0.004 green:0.663 blue:0.573 alpha:1].CGColor;
            
            break;
        default:
            break;
    }
    textFieldName.layer.borderWidth  = 2.0;
    textFieldName.layer.cornerRadius = 5;
    textFieldName.clipsToBounds = YES;
}

- (void)viewDidLoad
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSString *siteSetting = [prefs stringForKey:@"site"];
    if(siteSetting != nil){
        siteTextField.text = siteSetting;
    }
    
    NSString *reporterSetting = [prefs stringForKey:@"reporter"];
    if(reporterSetting != nil){
        reporterTextField.text = reporterSetting;
    }
    
    
    UIColor *redStyle = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    UIColor *aquaStyle = [UIColor colorWithRed:0.004 green:0.663 blue:0.573 alpha:1];
    if([introString isEqual:@"anomaly"]){
        [label setText:@"Anomaly Reporting Card"];
        self.navigationItem.title=@"Anomaly Reporting Card";
        [label setTextColor:redStyle];
        [locationLabel setTextColor:redStyle];
        [siteLabel setTextColor:redStyle];
        [reporterLabel setTextColor:redStyle];
        [packageLabel setTextColor:redStyle];
        [otherLocationLabel setTextColor:redStyle];
        [self fieldToBeChanged:otherPackageTextField colorValue:1];
        [self fieldToBeChanged:locationTextField colorValue:1];
        [self fieldToBeChanged:siteTextField colorValue:1];
        [self fieldToBeChanged:packageTextField colorValue:1];
        [self fieldToBeChanged:otherLocationTextField colorValue:1];
        [self fieldToBeChanged:reporterTextField colorValue:1];
        [otherPackageTextField setTextColor:redStyle];
        [locationTextField setTextColor:redStyle];
        [otherLocationTextField setTextColor:redStyle];
        [siteTextField setTextColor:redStyle];
        [packageTextField setTextColor:redStyle];
        [reporterTextField setTextColor:redStyle];

    }
    else{
        [label setText:@"Initiative Reporting Card"];
        self.navigationItem.title=@"Initiative Reporting Card";
        [label setTextColor:aquaStyle];
        [locationLabel setTextColor:aquaStyle];
        [siteLabel setTextColor:aquaStyle];
        [reporterLabel setTextColor:aquaStyle];
        [packageLabel setTextColor:aquaStyle];
        [otherLocationLabel setTextColor:aquaStyle];
        [self fieldToBeChanged:otherPackageTextField colorValue:2];
        [self fieldToBeChanged:locationTextField colorValue:2];
        [self fieldToBeChanged:siteTextField colorValue:2];
        [self fieldToBeChanged:packageTextField colorValue:2];
        [self fieldToBeChanged:otherLocationTextField colorValue:2];
        [self fieldToBeChanged:reporterTextField colorValue:2];
        [reporterTextField setTextColor:aquaStyle];
        [otherPackageTextField setTextColor:aquaStyle];
        [locationTextField setTextColor:aquaStyle];
        [otherLocationTextField setTextColor:aquaStyle];
        [siteTextField setTextColor:aquaStyle];
        [packageTextField setTextColor:aquaStyle];
    }
    NSMutableArray* bandArray = [[NSMutableArray alloc] init];
    
    // add some sample data
    [bandArray addObject:@"MOKPO"];
    [bandArray addObject:@"ULSAN"];
    [bandArray addObject:@"Other"];
    
    
    // bind yourTextField to DownPicker
    self.downPicker = [[DownPicker alloc] initWithTextField:self.locationTextField dependentTextField:self.otherLocationTextField withData:bandArray];
    
    NSMutableArray* packageArray = [[NSMutableArray alloc] init];
    
    // add some sample data
    [packageArray addObject:@"FPU"];
    [packageArray addObject:@"TLP"];
    [packageArray addObject:@"Other"];
    
    
    // bind yourTextField to DownPicker
    self.packagedownPicker = [[DownPicker alloc] initWithTextField:self.packageTextField dependentTextField:self.otherPackageTextField withData:packageArray];
    
    self.otherPackageTextField.delegate = self;
    self.siteTextField.delegate = self;
    self.otherLocationTextField.delegate = self;
    self.reporterTextField.delegate = self;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear
{
    // create the array of data
    }


@end
