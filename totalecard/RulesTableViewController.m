//
//  RulesTableViewController.m
//  totalecard
//
//  Created by Vanipriya on 26/06/15.
//  Copyright (c) 2015 Vanipriya. All rights reserved.
//

#import "RulesTableViewController.h"
#import "RuleViewController.h"

@interface RulesTableViewController ()

@end

@implementation RulesTableViewController
@synthesize rulesArray;
NSArray *thumbnails;


- (void)viewDidLoad {
    [super viewDidLoad];
    thumbnails = [NSArray arrayWithObjects:@"1-web.png",@"2-web.png", @"3-web.png",@"4-web.png",@"5-web.png",@"6-web.png",@"7-web.png",@"8-web.png",@"9-web.png",@"10-web.png",@"11-web.png",@"12-web.png", nil];

    self.rulesArray = [NSArray arrayWithObjects:@"Golden Rule 1", @"Golden Rule 2", @"Golden Rule 3",  @"Golden Rule 4", @"Golden Rule 5", @"Golden Rule 6", @"Golden Rule 7", @"Golden Rule 8", @"Golden Rule 9", @"Golden Rule 10", @"Golden Rule 11", @"Golden Rule 12",nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.rulesArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell.
    cell.textLabel.text = [self.rulesArray objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath* )indexPath{
    NSLog(@"%ld",(long)indexPath.row);
   // [self performSegueWithIdentifier:@"ruleShow" sender:self];
 }
 
 
// In a storyboard-based application, you will often want to do a little preparation before navigation*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    NSLog(@"cell tapped");
    
    RuleViewController *vc = [segue destinationViewController];
    vc.rule = indexPath.row;
    
    
}


@end
