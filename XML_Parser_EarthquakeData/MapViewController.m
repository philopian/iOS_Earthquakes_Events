//
//  MapViewController.m
//  XML Earthquake Parser
//
//  Created by philopian on 10/31/13.
//  Copyright (c) 2013 philopian. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

//    NSLog(@"_locationTitle%@", _locationTitle);
//    NSLog(@"lat: %f", _lat);
//    NSLog(@"lng: %f", _lng);
    
    
    // Add a map and center on earthquake
    [self centerMap];
    
    // Add Earthquake Location to map
    [self addEarthquakeLocationToMap];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)centerMap
{
    MKCoordinateRegion centerMapRegion;
    
    CLLocationCoordinate2D centerMapCoor;
    centerMapCoor.latitude = _lat;
    centerMapCoor.longitude = _lng;
    centerMapRegion.center = centerMapCoor;
    
    MKCoordinateSpan centerMapSpan;
    centerMapSpan.latitudeDelta = 90;   // 90 degrees on the map north/south (max is 180)
    centerMapSpan.longitudeDelta = 90;  // 90 degress on the map west/east (max is 360)
    centerMapRegion.span = centerMapSpan;
    
    [_mapView setRegion:centerMapRegion animated:YES];

}


-(void)addEarthquakeLocationToMap
{
    CLLocationCoordinate2D eqCoordinate;
    eqCoordinate.latitude = _lat;
    eqCoordinate.longitude = _lng;
    
    MKPointAnnotation *eqPOI = [[MKPointAnnotation alloc]init];
    eqPOI.coordinate = eqCoordinate;
    eqPOI.title = _locationTitle;
    eqPOI.subtitle = _location;
    
    [_mapView addAnnotation:eqPOI]; 
}


@end


















