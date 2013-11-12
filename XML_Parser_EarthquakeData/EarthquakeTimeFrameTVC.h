//
//  EarthquakeTimeFrameTVC.h
//  XML_Parser_EarthquakeData
//
//  Created by philopian on 11/7/13.
//  Copyright (c) 2013 philopian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EarthquakeTVC.h"
#import "EarthquakeData.h"
#import "XMLParser.h"

@interface EarthquakeTimeFrameTVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *eqOptionTableView;

@property (strong, nonatomic) NSString *urlToUse;
@property (strong, nonatomic) NSString *titleToUse;

@property (strong, nonatomic) NSArray *eqTimeFrameOptions;
@property (strong, nonatomic) NSArray *eqTimeFrameURLs;
@property (strong, nonatomic) NSArray *eqTitle;

@end
