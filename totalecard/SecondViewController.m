//
//  SecondViewController.m
//  totalecard
//
//  Created by Vanipriya on 23/06/15.
//  Copyright (c) 2015 Vanipriya. All rights reserved.
//

#import "SecondViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize introString,takePhotoButton,reporter,site, location;
@synthesize goldenRuleLabel,descriptionLabel,immediateActionLabel,label,actorLabel, imageArray;
@synthesize descriptionTextView,immediateActionTextView,actorTextField,goldenRuleTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)sendReport:  (UIButton *)sender{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:site forKey:@"site"];
    [defaults setObject:reporter forKey:@"reporter"];
    [defaults synchronize];
    [self showEmail];
}

- (void)showEmail {
    
    NSString *sitelocation = location;
    
   // self.navigationItem.title = [NSString stringWithFormat:@"%@%@", @"Golden Rule ",inStr];
    NSString *emailTitle = [NSString stringWithFormat:@"%@%@",location, @" 2S eCard"];
    NSString *messageBody = @"";
    NSArray *toRecipents = [NSArray arrayWithObject:@"ep.mhn-2scards-mokpo@total.com"];
    NSArray *ccRecipents = [NSArray arrayWithObject:@"ep-mhn-2scards-mokpo@naver.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    [mc setCcRecipients:ccRecipents];
    
    NSMutableString *csv = [NSMutableString stringWithString:@"Reporter,Actor,Location,Golden Rule,Site,Description,Immediate Action"];
    
    //add your content to the csv
    [csv appendFormat:@"\n\"%@\",%@, %@, %@, %@, %@, %@\"",
     self.reporter, self.actorTextField.text, location, goldenRuleTextField.text, site, descriptionTextView.text, immediateActionTextView.text
     ];
    //[csv appendFormat:reporter, actorTextField.text, location, goldenRuleTextField.text, site, descriptionTextView.text, immediateActionTextView.text];
    
    //"\"Reporter\",\"Actor\",\"Location\",\"Golden Rule\",\"Site\",\"Description\",\"Immediate Action\"";
    
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    //NSString *fileNameFormat = @"";
    NSDateFormatter *formatter;
    NSString        *dateString;
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    
    dateString = [formatter stringFromDate:[NSDate date]];
    NSString *fileNameFormat = @"";
    if ([introString isEqual:@"anomaly"]) {
         fileNameFormat = [NSString stringWithFormat:@"%@%@%@%@",@"ANO_", reporter, @"_", dateString];
    }    //String anFileName = "ANO_"+reporter+"_"+formattedCurrentDate;
    else
    {
        fileNameFormat = [NSString stringWithFormat:@"%@%@%@%@",@"INI_", reporter, @"_", dateString];
    }
    
    NSString* fileName = [NSString stringWithFormat:@"%@%@",fileNameFormat,@".csv"];//@"MyCSVFileName.csv";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
   
    
    NSString *ruleValue = @"";
    if([goldenRuleTextField.text isEqualToString:@"High-Risk Situations"])
    {    ruleValue = @"one";}
    else if([goldenRuleTextField.text isEqualToString:@"Traffic"])
    {    ruleValue = @"two";}
    else if([goldenRuleTextField.text isEqualToString:@"Body Mechanics and Tools"])
    { ruleValue = @"three";}
    else if([goldenRuleTextField.text isEqualToString:@"Protective Equipment"])
    {   ruleValue = @"four";}
    else if([goldenRuleTextField.text isEqualToString:@"Work Permits"])
    {    ruleValue = @"five";}
    else if([goldenRuleTextField.text isEqualToString:@"Lifting Operations"])
    {    ruleValue = @"six";}
    else if([goldenRuleTextField.text isEqualToString:@"Powered Systems"])
    {    ruleValue = @"seven";}
    else if([goldenRuleTextField.text isEqualToString:@"Confined Spaces"])
    {    ruleValue = @"eight";}
    else if([goldenRuleTextField.text isEqualToString:@"Excavation Work"])
    {    ruleValue = @"nine";}
    else if([goldenRuleTextField.text isEqualToString:@"Work at Height"])
    {    ruleValue = @"ten";}
    else if([goldenRuleTextField.text isEqualToString:@"Change Management"])
    {    ruleValue = @"eleven";}
    else if([goldenRuleTextField.text isEqualToString:@"Simultaneous Operations or Co-Activities"])
    {   ruleValue = @"twelve";}
    
   
    NSString *anomalyHTML = [NSString stringWithFormat:@"<html><head>\n"
                             "\t\t<style type=\"text/css\">\n"
                             "\t\t\t\n"
                             "\t\t\t#page-wrap {\n"
                             "\t\t\t\t\t\t  width: 800px;\n"
                             "\t\t\t\t\t\t  margin: 0 auto;\n"
                             "\t\t\t\t\t\t  border-radius: 25px;\n"
                             "    \t\t\t\t\tborder: 5px solid #ff0000;\n"
                             "    \t\t\t\t\tpadding: 20px;\n"
                             "\t\t\t\t\t\t}\n"
                             "\t\t\t#checks{\n"
                             "\t\t\t\t\t\twidth: 48px;\n"
                             "\t\t\t\t\t\tpadding:10px;\n"
                             "\t\t\t\t\t\tfloat: left;\n"
                             "\t\t\t}\n"
                             "\t\t\t#rules{\n"
                             "\t\t\t\t\tpadding:15px;\n"
                             "\t\t\t\t\twidth:165px;\n"
                             "\t\t\t}\n"
                             "\t\t\ttable {\n"
                             "    \t\t\t\tborder-collapse: collapse;\n"
                             "    \t\t\t\tmargin-bottom: 20px;\t\n"
                             "\t\t\t}\n"
                             "\t\t\ttable, td, th,tr {\n"
                             "    \t\t\tborder: 2px solid #ff0000;\n"
                             "\t\t\t}\t\t\n"
                             "\t\t</style>\n"
                             "\t\t\t\n"
                             "\t</head>\t\n"
                             "\t<body>\n"
                             "\t\t<div id=\"page-wrap\">\n"
                             "\t\t\t<img src=\"https://cdn.pbrd.co/images/DakEJwO.png\" style=\"float: left; margin-right:10px\">\n"
                             "\t\t\t<table>\n"
                             "\t\t\t\t<tr>\n"
                             "\t\t\t\t\t<td style=\"color:#ff0000\">SITE</td>\n"
                             "\t\t\t\t\t<td width=\"100px\">%@</td>\n \t\t\t\t</tr>\n"
                             "\t\t\t\t<tr>\n"
                             "\t\t\t\t\t<td style=\"color:#ff0000\">DATE</td>\n"
                             "\t\t\t\t\t<td width=\"100px\">%@</td>\n"
                             //  "\t\t\t\t\t<td width=\"100px\">" + DateFormat.getDateTimeInstance().format(new Date()) + "</td>\n"
                             "\t\t\t\t</tr>\n"
                             "\t\t\t</table>\n"
                             "\n"
                             "\t\t\t<h1 style=\"color:#ff0000\">Anomaly Description</h1>\n"
                             "\n"
                             "\t\t\t<table style=\"margin-top:30px\">\n"
                             "\t\t\t\t<tr>\n"
                             //  "\t\t\t\t\t<td height=\"100px\" width=\"790px\">" + message + "</td>\n"
                             "\t\t\t\t\t<td height=\"100px\" width=\"790px\">%@</td>\n"
                             "\t\t\t\t</tr>\n"
                             "\t\t\t</table>\n"
                             "\n"
                             "\t\t\t<h1 style=\"color:#ff0000\">Related Golden Rule</h1>\n"
                             "\t\t\t<table style=\"margin-top:30px\">\n"
                             "\t\t\t\t<tr>\n"
                             "\t\t\t\t\t\n"
                             "\t\t\t\t\t<td><input type=\"checkbox\" id=\"one\"></td>\n"
                             "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/Dcg07j0.png\" id=\"checks\"><div id=\"rules\">High-Risk Situations</div></td>\n"
                             "\t\t\t\t\t<td><input type=\"checkbox\" id=\"two\"></td>\n"
                             "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DcirIoF.png\" id=\"checks\"><div id=\"rules\">Traffic</div></td>\n"
                             "\t\t\t\t\t<td><input type=\"checkbox\" id=\"three\"></td>\n"
                             "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DckxVuk.png\" id=\"checks\"><div id=\"rules\">Body Mechanics and Tools</div></td>\n"
                             "\t\t\t\t</tr>\n"
                             "\t\t\t\t<tr>\n"
                             "\t\t\t\t\t<td><input type=\"checkbox\" id=\"four\"></td>\n"
                             "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DcmrkOu.png\" id=\"checks\"><div id=\"rules\">Protective Equipment</div></td>\n"
                             "\t\t\t\t\t<td><input type=\"checkbox\" id=\"five\"></td>\n"
                             "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DctKJFk.png\" id=\"checks\"><div id=\"rules\">Work Permits</div></td>\n"
                             "\t\t\t\t\t<td><input type=\"checkbox\" id=\"six\"></td>\n"
                             "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/Dcwkn9F.png\" id=\"checks\"><div id=\"rules\">Lifting Operations</div></td>\n"
                             "\t\t\t\t</tr>\n"
                             "\t\t\t\t<tr>\n"
                             "\t\t\t\t\t<td><input type=\"checkbox\" id=\"seven\"></td>\n"
                             "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/Dcyokh0.png\" id=\"checks\"><div id=\"rules\">Powered Systems</div></td>\n"
                             "\t\t\t\t\t<td><input type=\"checkbox\" id=\"eight\"></td>\n"
                             "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DcASmi7.png\" id=\"checks\"><div id=\"rules\">Confined Spaces</div></td>\n"
                             "\t\t\t\t\t<td><input type=\"checkbox\" id=\"nine\"></td>\n"
                             "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DcLyfFc.png\" id=\"checks\"><div id=\"rules\">Excavation Work</div></td>\n"
                             "\t\t\t\t</tr>\n"
                             "\t\t\t\t<tr>\n"
                             "\t\t\t\t\t<td><input type=\"checkbox\" id=\"ten\"></td>\n"
                             "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DcOp5DT.png\" id=\"checks\"><div id=\"rules\">Work at Height</div></td>\n"
                             "\t\t\t\t\t<td><input type=\"checkbox\" id=\"eleven\"></td>\n"
                             "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DcVfMea.png\" id=\"checks\"><div id=\"rules\">Change Management</div></td>\n"
                             "\t\t\t\t\t<td><input type=\"checkbox\" id=\"twelve\"></td>\n"
                             "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DcWVqJo.png\" id=\"checks\"><div id=\"rules\">Simultaneous Operations or Co-Activities</div></td>\n"
                             "\t\t\t\t</tr>\n"
                             "\t\t\t</table>\n"
                             "\n"
                             "\t\t\t<h1 style=\"color:#ff0000\">Immediate Action</h1>\n"
                             "\n"
                             "\t\t\t<table style=\"margin-top:30px\">\n"
                             "\t\t\t\t<tr>\n"
                             "\t\t\t\t\t<td height=\"100px\" width=\"790px\">%@</td>\n"
                             // "\t\t\t\t\t<td height=\"100px\" width=\"790px\">" + immediateAction + "</td>\n"
                             
                             "\t\t\t\t</tr>\n"
                             "\t\t\t</table>\n"
                             "\n"
                             "\t\t\t<table>\n"
                             "\t\t\t\t<tr>\n"
                             "\t\t\t\t\t<td style=\"color:#ff0000\">NAME AND COMPANY OF THE REPORTER :</td>\n"
                             //  "\t\t\t\t\t<td width=\"600px\">" + reporter + "</td>\n"
                             "\t\t\t\t\t<td width=\"600px\">%@</td>\n"
                             "\t\t\t\t</tr>\n"
                             "\t\t\t\t\n"
                             "\t\t\t</table>\n"
                             "\n"
                             "\t\t\t<table style=\"width: 100%%; \">\n"
                             "\t\t\t\t<tr>\n"
                             "\t\t\t\t\t<td style=\"width: 33%%; text-align: center;\"><img src=\"https://cdn.pbrd.co/images/DewaE1O.jpg\"></td>\n"
                             "\t\t\t\t\n"
                             "\t\t\t\t\t<td style=\"width: 33%%; text-align: center;\"><img src=\"https://cdn.pbrd.co/images/Dezam25.jpg\"></td>\n"
                              "\t\t\t\t\n"
                             "\t\t\t\t\t<td style=\"width: 33%%; text-align: center;\"><img src=\"https://cdn.pbrd.co/images/DeqKUht.png\"></td>\n"
                             "\t\t\t\t</tr>\n"
                            
                             "\n"
                             "\t\t\t</table>\t\n"
                             "  \t\t</div>\n"
                             "\n"
                             "\t\t<script type=\"text/javascript\">\n"
                             "\t\t\tdocument.getElementById(\"%@\").checked = true;\n"
                             //  "\t\t\tdocument.getElementById(\"" + posvalue(goldenRuleData) + "\").checked = true;\n"
                             
                             "\t\t</script>\t\n"
                             "\t</body>\n"
                             "\n"
                             "</html>\n", site,dateString,descriptionTextView.text,immediateActionTextView.text,reporter,ruleValue];
    
    
    
        NSString *initiativeHTML = [NSString stringWithFormat:@"<html>\n"
        "\t<head>\n"
        "\t\t<style type=\"text/css\">\n"
        "\t\t\t\n"
        "\t\t\t#page-wrap {\n"
        "\t\t\t\t\t\t  width: 800px;\n"
        "\t\t\t\t\t\t  margin: 0 auto;\n"
        "\t\t\t\t\t\t  border-radius: 25px;\n"
        "    \t\t\t\t\tborder: 5px solid #01a992;\n"
        "    \t\t\t\t\tpadding: 20px;\n"
        "\t\t\t\t\t\t}\n"
        "\t\t\t#checks{\n"
        "\t\t\t\t\t\twidth: 48px;\n"
        "\t\t\t\t\t\tpadding:10px;\n"
        "\t\t\t\t\t\tfloat: left;\n"
        "\t\t\t}\n"
        "\t\t\t#rules{\n"
        "\t\t\t\t\tpadding:15px;\n"
        "\t\t\t\t\twidth:165px;\n"
        "\t\t\t}\n"
        "\t\t\ttable {\n"
        "    \t\t\t\tborder-collapse: collapse;\n"
        "    \t\t\t\tmargin-bottom: 20px;\t\n"
        "\t\t\t}\n"
        "\t\t\ttable, td, th,tr {\n"
        "    \t\t\tborder: 2px solid #01a992;\n"
        "\t\t\t}\t\t\n"
        "\t\t</style>\n"
        "\t\t\t\n"
        "\t</head>\t\n"
        "\t<body>\n"
        "\t\t<div id=\"page-wrap\">\n"
        "\t\t\t<img src=\"https://cdn.pbrd.co/images/DgWf82i.png\" style=\"float: left; margin-right:10px\">\n"
        "\t\t\t<table>\n"
        "\t\t\t\t<tr>\n"
        "\t\t\t\t\t<td>SITE</td>\n"
        "\t\t\t\t\t<td width=\"100px\">%@</td>\n \t\t\t\t</tr>\n"
     //   "\t\t\t\t\t<td width=\"100px\">"+subject+"</td>\n"
        "\t\t\t\t</tr>\n"
        "\t\t\t\t<tr>\n"
        "\t\t\t\t\t<td>DATE</td>\n"
        "\t\t\t\t\t<td width=\"100px\">%@</td>\n"
  //      "\t\t\t\t\t<td width=\"100px\">"+ DateFormat.getDateTimeInstance().format(new Date()) +"</td>\n"
        "\t\t\t\t</tr>\n"
        "\t\t\t</table>\n"
        "\n"
        "\t\t\t<h1>Initiative Description</h1>\n"
        "\n"
        "\t\t\t<table style=\"margin-top:30px\">\n"
        "\t\t\t\t<tr>\n"
        "\t\t\t\t\t<td height=\"100px\" width=\"790px\">%@</td>\n"
  //      "\t\t\t\t\t<td height=\"100px\" width=\"790px\">"+message+"</td>\n"
        "\t\t\t\t</tr>\n"
        "\t\t\t</table>\n"
        "\n"
        "\t\t\t<h1>Related Golden Rule</h1>\n"
        "\t\t\t<table style=\"margin-top:30px\">\n"
        "\t\t\t\t<tr>\n"
        "\t\t\t\t\t\n"
        "\t\t\t\t\t<td><input type=\"checkbox\" id=\"one\"></td>\n"
        "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/Dcg07j0.png\" id=\"checks\"><div id=\"rules\">High-Risk Situations</div></td>\n"
        "\t\t\t\t\t<td><input type=\"checkbox\" id=\"two\"></td>\n"
        "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DcirIoF.png\" id=\"checks\"><div id=\"rules\">Traffic</div></td>\n"
        "\t\t\t\t\t<td><input type=\"checkbox\" id=\"three\"></td>\n"
        "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DckxVuk.png\" id=\"checks\"><div id=\"rules\">Body Mechanics and Tools</div></td>\n"
        "\t\t\t\t</tr>\n"
        "\t\t\t\t<tr>\n"
        "\t\t\t\t\t<td><input type=\"checkbox\" id=\"four\"></td>\n"
        "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DcmrkOu.png\" id=\"checks\"><div id=\"rules\">Protective Equipment</div></td>\n"
        "\t\t\t\t\t<td><input type=\"checkbox\" id=\"five\"></td>\n"
        "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DctKJFk.png\" id=\"checks\"><div id=\"rules\">Work Permits</div></td>\n"
        "\t\t\t\t\t<td><input type=\"checkbox\" id=\"six\"></td>\n"
        "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/Dcwkn9F.png\" id=\"checks\"><div id=\"rules\">Lifting Operations</div></td>\n"
        "\t\t\t\t</tr>\n"
        "\t\t\t\t<tr>\n"
        "\t\t\t\t\t<td><input type=\"checkbox\" id=\"seven\"></td>\n"
        "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/Dcyokh0.png\" id=\"checks\"><div id=\"rules\">Powered Systems</div></td>\n"
        "\t\t\t\t\t<td><input type=\"checkbox\" id=\"eight\"></td>\n"
        "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DcASmi7.png\" id=\"checks\"><div id=\"rules\">Confined Spaces</div></td>\n"
        "\t\t\t\t\t<td><input type=\"checkbox\" id=\"nine\"></td>\n"
        "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DcLyfFc.png\" id=\"checks\"><div id=\"rules\">Excavation Work</div></td>\n"
        "\t\t\t\t</tr>\n"
        "\t\t\t\t<tr>\n"
        "\t\t\t\t\t<td><input type=\"checkbox\" id=\"ten\"></td>\n"
        "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DcOp5DT.png\" id=\"checks\"><div id=\"rules\">Work at Height</div></td>\n"
        "\t\t\t\t\t<td><input type=\"checkbox\" id=\"eleven\"></td>\n"
        "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DcVfMea.png\" id=\"checks\"><div id=\"rules\">Change Management</div></td>\n"
        "\t\t\t\t\t<td><input type=\"checkbox\" id=\"twelve\"></td>\n"
        "\t\t\t\t\t<td><img src=\"https://cdn.pbrd.co/images/DcWVqJo.png\" id=\"checks\"><div id=\"rules\">Simultaneous Operations or Co-Activities</div></td>\n"
        "\t\t\t\t</tr>\n"
        "\t\t\t</table>\n"
        "\n"
        "\t\t\t<h1>Immediate Action</h1>\n"
        "\n"
        "\t\t\t<table style=\"margin-top:30px\">\n"
        "\t\t\t\t<tr>\n"
        "\t\t\t\t\t<td height=\"100px\" width=\"790px\">%@</td>\n"
    //    "\t\t\t\t\t<td height=\"100px\" width=\"790px\">"+immediateAction+"</td>\n"
        "\t\t\t\t</tr>\n"
        "\t\t\t</table>\n"
        "\n"
        "\t\t\t<table>\n"
        "\t\t\t\t<tr>\n"
        "\t\t\t\t\t<td>NAME AND COMPANY OF THE REPORTER :</td>\n"
        "\t\t\t\t\t<td width=\"600px\">%@</td>\n"
   //     "\t\t\t\t\t<td width=\"600px\">%@</td>\n"
        "\t\t\t\t</tr>\n"
        "\t\t\t\t\n"
        "\t\t\t</table>\n"
        "\n"
        "\t\t\t<table style=\"width: 100%%;\">\n"
        "\t\t\t\t<tr>\n"
        "\t\t\t\t\t<td style=\"width: 33%%; text-align: center;\"><img src=\"https://cdn.pbrd.co/images/DewaE1O.jpg\"></td>\n"
        "\t\t\t\t\n"
        "\t\t\t\t\t<td style=\"width: 33%%; text-align: center;\"><img src=\"https://cdn.pbrd.co/images/Dezam25.jpg\"></td>\n"
        "\t\t\t\t\n"
        "\t\t\t\t\t<td style=\"width: 33%%; text-align: center;\"><img src=\"https://cdn.pbrd.co/images/DeqKUht.png\"></td>\n"
                "\n"
        "\t\t\t\t</tr>\n"
        "\t\t\t</table>\t\n"
        "  \t\t</div>\n"
        "\n"
        "\t\t<script type=\"text/javascript\">\n"
        "\t\t\tdocument.getElementById(\"%@\").checked = true;\n"
      //  "\t\t\tdocument.getElementById(\""+posvalue(goldenRuleData)+"\").checked = true;\n"
        "\t\t</script>\t\n"
        "\t</body>\n"
        "\n"
        "</html>\n",site,dateString,descriptionTextView.text,immediateActionTextView.text,reporter,ruleValue];
    NSString *finalHTML = @"";
    if([introString isEqualToString:@"anomaly"])
        finalHTML = anomalyHTML;
    else
        finalHTML = initiativeHTML;
    
    NSString *rootDocumentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* fileNameHtml = [NSString stringWithFormat:@"%@%@",fileNameFormat,@".html"];
    NSString *filePathHtml = [rootDocumentsPath stringByAppendingPathComponent:fileNameHtml];
    NSError *error = nil;
    if([finalHTML writeToFile:filePathHtml atomically:YES encoding:NSUTF8StringEncoding error:&error])
        NSLog(@"HTML Data saved! File path");
        else
        NSLog(@"HTML Data not saved! Error");
            // it didn't work; "error" will now contain a description of what went wrong
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
    }
    
    BOOL res = [[csv dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
    
    NSString* fileNameCsv = [NSString stringWithFormat:@"%@%@",fileNameFormat,@".csv"];
    
    if (!res) {
        [[[UIAlertView alloc] initWithTitle:@"Error Creating CSV" message:@"Check your permissions to make sure this app can create files so you may email the app data" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
    }else{
        NSLog(@"Data saved! File path = %@", fileNameCsv);
    // Add attachment
        [mc addAttachmentData:[NSData dataWithContentsOfFile:fileAtPath]
                     mimeType:@"text/csv"
                     fileName:fileNameCsv];
    }
    NSLog(@"Count = %lu",(unsigned long)imageArray.count);
    
    for(int i=0;i<imageArray.count;i++){
        [mc addAttachmentData:[imageArray objectAtIndex:i]
                     mimeType:@"image/jpeg" fileName:@"Photo.jpg"];
    }

    [mc addAttachmentData:[NSData dataWithContentsOfFile:filePathHtml]
                 mimeType:@"text/html" fileName:fileNameHtml];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Message"
                                                                message:@"Mail Cancelled"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles: nil];
            [alertView show];
        }
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Message"
                                                                message:@"Mail Saved"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles: nil];
            [alertView show];
        }
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Message"
                                                                message:@"Mail Sent"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles: nil];
                [alertView show];
            }
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:[error localizedDescription]
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles: nil];
            [alertView show];
        }
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)selectPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    //self.imageView.image = chosenImage;
    NSData *imgData=UIImageJPEGRepresentation(chosenImage, 1);
    [imageArray addObject:imgData];
     NSLog(@"Count = %lu",(unsigned long)imageArray.count);
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)fieldToBeChanged:(UITextView*)textFieldName colorValue:(int)val{
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

-(void)textfieldToBeChanged:(UITextField*)textFieldName colorValue:(int)val{
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

- (void)viewDidLoad {
    UIColor *redStyle = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    UIColor *aquaStyle = [UIColor colorWithRed:0.004 green:0.663 blue:0.573 alpha:1];
    NSLog(@"value of reporter %@",self.reporter);
    if([introString isEqual:@"anomaly"]){
        [label setText:@"Anomaly Reporting Card"];
        self.navigationItem.title=@"Anomaly Reporting Card";
        [label setTextColor:redStyle];
        [goldenRuleLabel setTextColor:redStyle];
        [descriptionLabel setTextColor:redStyle];
        [immediateActionLabel setTextColor:redStyle];
        [actorLabel setTextColor:redStyle];
        [self fieldToBeChanged:descriptionTextView colorValue:1];
        [self fieldToBeChanged:immediateActionTextView colorValue:1];
        [self textfieldToBeChanged:goldenRuleTextField colorValue:1];
        [self textfieldToBeChanged:actorTextField colorValue:1];
    }
    else{
        [label setText:@"Initiative Reporting Card"];
        self.navigationItem.title=@"Initiative Reporting Card";
        [label setTextColor:aquaStyle];
        [goldenRuleLabel setTextColor:aquaStyle];
        [descriptionLabel setTextColor:aquaStyle];
        [immediateActionLabel setTextColor:aquaStyle];
        [actorLabel setTextColor:aquaStyle];
        [self fieldToBeChanged:descriptionTextView colorValue:2];
        [self fieldToBeChanged:immediateActionTextView colorValue:2];
        [self textfieldToBeChanged:goldenRuleTextField colorValue:2];
        [self textfieldToBeChanged:actorTextField colorValue:2];
    }

    imageArray = [[NSMutableArray alloc]init];
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        self.takePhotoButton.enabled = NO;
        
    }
    
    NSMutableArray* bandArray = [[NSMutableArray alloc] init];
    
    // add some sample data
    [bandArray addObject:@"High-Risk Situations"];
    [bandArray addObject:@"Traffic"];
    [bandArray addObject:@"Body Mechanics and Tools"];
    [bandArray addObject:@"Protective Equipment"];
    [bandArray addObject:@"Work Permits"];
    [bandArray addObject:@"Lifting Operations"];
    [bandArray addObject:@"Powered Systems"];
    [bandArray addObject:@"Confined Spaces"];
    [bandArray addObject:@"Excavation Work"];
    [bandArray addObject:@"Work at Height"];
    [bandArray addObject:@"Change Management"];
    [bandArray addObject:@"Simultaneous Operations or Co-Activities"];
    
    
    // bind yourTextField to DownPicker
    self.downPicker = [[DownPicker alloc] initWithTextField:self.goldenRuleTextField dependentTextField:self.dummyTextField withData:bandArray];
    
    
    
    [super viewDidLoad];
    self.actorTextField.delegate = self;
    self.descriptionTextView.delegate = self;
    self.immediateActionTextView.delegate = self;
     [self addDoneToolBarToKeyboard:self.immediateActionTextView];
    [self addDoneToolBarToKeyboard:self.descriptionTextView];
    NSLog(@"my netID is: %@", self.reporter);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

UITextView *currentTextView;

-(void)addDoneToolBarToKeyboard:(UITextView *)textView
{
    UIToolbar* doneToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    doneToolbar.barStyle = UIBarStyleBlackTranslucent;
    doneToolbar.items = [NSArray arrayWithObjects:
                         [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                         [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonClickedDismissKeyboard)],
                         nil];
    [doneToolbar sizeToFit];
    textView.inputAccessoryView = doneToolbar;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    currentTextView = textView;
}

-(void)doneButtonClickedDismissKeyboard
{
    [currentTextView resignFirstResponder];
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
