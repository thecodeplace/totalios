//
//  SecondViewController.h
//  totalecard
//
//  Created by Vanipriya on 23/06/15.
//  Copyright (c) 2015 Vanipriya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "DownPicker.h"


@interface SecondViewController : UIViewController <UIImagePickerControllerDelegate, MFMailComposeViewControllerDelegate>
{
    NSString *reporter;
}
@property (weak, nonatomic) IBOutlet UITextField *dummyTextField;
@property (strong, nonatomic) DownPicker *downPicker;

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *goldenRuleLabel;
@property (weak, nonatomic) IBOutlet UITextField *goldenRuleTextField;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *actorTextField;
@property (weak, nonatomic) IBOutlet UILabel *actorLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITextView *immediateActionTextView;
@property (weak, nonatomic) IBOutlet UILabel *immediateActionLabel;
@property (weak, nonatomic) IBOutlet UIButton *takePhotoButton;

@property (nonatomic, copy) NSString *introString;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *site;
@property (nonatomic, copy) NSString *package;
@property (nonatomic, copy) NSString *reporter;
@property (nonatomic,retain) NSMutableArray *imageArray;

- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;
- (IBAction)sendReport: (UIButton *)sender;


@end
