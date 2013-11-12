//
//  EarthquakeTimeFrameTVC.m
//  XML_Parser_EarthquakeData
//
//  Created by philopian on 11/7/13.
//  Copyright (c) 2013 philopian. All rights reserved.
//

#import "EarthquakeTimeFrameTVC.h"




@interface EarthquakeTimeFrameTVC ()


@end

@implementation EarthquakeTimeFrameTVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.eqTimeFrameOptions = nil;
    self.eqTimeFrameURLs = nil;
    self.eqTitle = nil;

    self.eqTimeFrameOptions = @[@"Within the last day",
                           @"Within the last 7 days",
                           @"Within the last 30 days"];
    self.eqTimeFrameURLs = @[@"http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_day.atom",
                             @"http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_week.atom",
                             @"http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_month.atom"];
    self.eqTitle = @[@"EQ >4.5 Mag (Last Day)",
                     @"EQ >4.5 Mag (Last Week)",
                     @"EQ >4.5 Mag (Last Month)"];
    
    self.eqOptionTableView.delegate = self;
    self.eqOptionTableView.dataSource = self;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - TableView Delegate/DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.eqTimeFrameOptions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *eqCell = [self.eqOptionTableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (!eqCell) {
        eqCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    if (_eqTimeFrameOptions !=nil) {
        eqCell.textLabel.text = [self.eqTimeFrameOptions objectAtIndex:indexPath.row];

    }
    
    return eqCell;
}



#pragma mark - Prepare For Segue

- (void)      tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // this happens after "prepareForSegue", therefore don't use ... use  NSIndexPath *indexPath = [self.eqOptionTableView indexPathForSelectedRow];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue
                sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"FromTimeFrameOptions"]) {
        // get whatever the user selected in the tableview
        NSIndexPath *indexPath = [self.eqOptionTableView indexPathForSelectedRow];
        
        EarthquakeTVC *destinationController = segue.destinationViewController;
        destinationController.earthquakeTVCTitle = [self.eqTitle objectAtIndex:indexPath.row];
        destinationController.earthquakeUrlForTVC = [self.eqTimeFrameURLs objectAtIndex:indexPath.row];
    }
}


@end
