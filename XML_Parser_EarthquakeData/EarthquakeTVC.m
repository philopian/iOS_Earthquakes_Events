//
//  EarthquakeTVC.m
//  XML Earthquake Parser
//
//  Created by philopian on 10/31/13.
//  Copyright (c) 2013 philopian. All rights reserved.
//
// Data Source:
// www.earthquake.usgs.gov/earthquakes/feed/v1.0/quakeml.php


#import "EarthquakeTVC.h"





@interface EarthquakeTVC ()


@end

@implementation EarthquakeTVC


XMLParser *xmlParser;




- (IBAction)btnFetchData:(id)sender
{
    
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.eqEvents = nil;
    self.eqEventLocations = nil;
    
    
    
    // set the view's title
    self.title = [self earthquakeTVCTitle];
    
    // get the data from USGS and parse the EQ
    [self fetchAndParseEarthquakeData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    //NSLog(@"[_eqEvents count]: %lu",[_eqEvents count]);
    return [_eqEvents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EarthQuakeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
    
    
    // Cell label
    if (_eqEvents != nil) {
        NSString *cellLabel = [NSString stringWithFormat:@"%@", [_eqEvents objectAtIndex:indexPath.row]];
        cell.textLabel.text =cellLabel;
    }

    
    // Subtitle
    if (_eqEventLocations != nil) {
        NSString *cellSubtitle = [NSString stringWithFormat:@"%@", [_eqEventLocations objectAtIndex:indexPath.row]];
        cell.detailTextLabel.text = cellSubtitle;
    }

    
    // set background color for each cell
    CGFloat nRed=128.0/255.0;
    CGFloat nBlue=98.0/255.0;
    CGFloat nGreen=53.0/255.0;
    UIColor *myColor=[[UIColor alloc]initWithRed:nRed green:nBlue blue:nGreen alpha:1];
    
    cell.backgroundColor = myColor;
    
    
    return cell;
}



#pragma mark - segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue
                sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showOnMap"]) {
        NSIndexPath *indexPath = [self.eqTableView indexPathForSelectedRow];
        
        MapViewController *mapviewVC = segue.destinationViewController;
        
        // get location title
        NSString *userSelectedPlaceName  = [_eqEvents objectAtIndex:indexPath.row];
        mapviewVC.locationTitle = [NSString stringWithFormat:@"%@",userSelectedPlaceName];
//        NSLog(@"did select cell in table: %@", userSelectedPlaceName);
        
        // Get lat/lng
        NSString *userSelectedLocationOneString = [_eqEventLocations objectAtIndex:indexPath.row];
        NSArray *splitLatLng = [userSelectedLocationOneString componentsSeparatedByString:@" "];
        mapviewVC.lat = [[splitLatLng objectAtIndex:0] doubleValue];
        mapviewVC.lng = [[splitLatLng objectAtIndex:1] doubleValue];

    }
    
    
}


#pragma mark - Which DataSource user clicked

-(void)eqDataSourceURL:(NSString *)dataSource
             xmlParser:(XMLParser*)xmlParser
{
//    NSLog(@"about to get a earthquake data");
    xmlParser = [[XMLParser alloc] loadXMLByURL:dataSource];

    
    self.eqEvents = [xmlParser earthquakesTitleArray];
    self.eqEventLocations = [xmlParser earthquakesLocationArray];
    
//    NSLog(@"self.eqEvents :%lu",(unsigned long)[self.eqEvents count]);
//    NSLog(@"self.eqEventLocations :%lu",(unsigned long)[self.eqEventLocations count]);
}


#pragma mark - Fetch Data from Webservice and parse

-(void)fetchAndParseEarthquakeData
{
    // get the data from USGS and parse the EQ
    xmlParser = [[XMLParser alloc]init];
    
    dispatch_queue_t myParsingQueue = dispatch_queue_create("parsingQueue", NULL);
    
    dispatch_async(myParsingQueue, ^(void){
        //[NSThread sleepForTimeInterval:2];
        [self eqDataSourceURL:self.earthquakeUrlForTVC
                    xmlParser:xmlParser];
 
        dispatch_sync(dispatch_get_main_queue(), ^{
            [_eqTableView reloadData];
        });
    });
}



- (IBAction)btnFetchUpdatedList:(id)sender
{
    [self fetchAndParseEarthquakeData];
}
@end



























