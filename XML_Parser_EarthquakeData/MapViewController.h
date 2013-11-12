//
//  MapViewController.h
//  XML Earthquake Parser
//
//  Created by philopian on 10/31/13.
//  Copyright (c) 2013 philopian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) NSString *locationTitle;
@property (strong, nonatomic) NSString *location;
@property (nonatomic) double lat;
@property (nonatomic) double lng;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
