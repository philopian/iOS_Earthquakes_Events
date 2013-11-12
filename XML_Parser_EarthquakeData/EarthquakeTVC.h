//
//  EarthquakeTVC.h
//  XML Earthquake Parser
//
//  Created by philopian on 10/31/13.
//  Copyright (c) 2013 philopian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"
#import "EarthquakeData.h"
#import "MapViewController.h"

@interface EarthquakeTVC : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *eqTableView;

@property (nonatomic, strong) NSString *earthquakeUrlForTVC;
@property (nonatomic, strong) NSString *earthquakeTVCTitle;

@property (nonatomic, strong) NSArray *eqEvents;
@property (nonatomic, strong) NSArray *eqEventLocations;


- (IBAction)btnFetchUpdatedList:(id)sender;

@end
