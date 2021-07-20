//
//  ChooseSiteViewController.m
//  MyObjectiveCApp
//
//  Created by aleksandar.aleksic on 16.7.21..
//

#import "ChooseSiteViewController.h"
#import "SiteCell.h"
#import "AppDelegate.h"

@interface ChooseSiteViewController ()

@end

@implementation ChooseSiteViewController
@synthesize listData, imageData, siteData;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    listData = [NSArray arrayWithObjects:@"Donkey", @"Dragon", @"Fairy Godmother", @"Fiona", @"Lord Farquaad", @"Shrek", nil];
    
    imageData = [NSArray arrayWithObjects:@"donkey.png", @"Dragon.png", @"Fairygodmother.png", @"Fiona.png", @"Lord Farquaad.png", @"Shrek.png", nil];
    
    siteData = [NSArray arrayWithObjects:
                @"https://shrek.fandom.com/wiki/Donkey",
                @"https://shrek.fandom.com/wiki/Fiona",
                @"https://shrek.fandom.com/wiki/Shrek_(character)",
                @"https://shrek.fandom.com/wiki/Dragon",
                @"https://shrek.fandom.com/wiki/Fairy_Godmother",
                @"https://shrek.fandom.com/wiki/Lord_Farquaad",
                nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return listData.count;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SiteCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil)
    {
        cell = [[SiteCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.primaryLabel.text = [listData objectAtIndex:indexPath.row];
    cell.secondaryLabel.text = [siteData objectAtIndex:indexPath.row];
    cell.myImageView.image = [UIImage imageNamed:[imageData objectAtIndex:indexPath.row]];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return  cell;
    
}

-(IBAction)unwindToChooseVC:(UIStoryboardSegue *)sender
{
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    mainDelegate.selectedURL = [siteData objectAtIndex: indexPath.row];
    [self performSegueWithIdentifier:@"ChooseSegueToView" sender:self];
}

@end
