//
//  EarthquakeTVCTests.m
//  XML_Parser_EarthquakeData
//
//  Created by philopian on 11/7/13.
//  Copyright (c) 2013 philopian. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EarthquakeTVC.h"
#import "EarthquakeData.h"
#import "XMLParser.h"

@interface EarthquakeTVCTests : XCTestCase

@end

@implementation EarthquakeTVCTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEqUrlValue
{
  
}


- (void)testArrayValuesForEqEventsAndEqEventLocationDaysExample
{
    EarthquakeTVC *earthquakeTVC = [[EarthquakeTVC alloc]init];
    earthquakeTVC.earthquakeUrlForTVC = @"http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_day.atom";
    
    XMLParser *xmlParser = [[XMLParser alloc] loadXMLByURL:earthquakeTVC.earthquakeUrlForTVC];
    
    earthquakeTVC.eqEvents = [xmlParser earthquakesTitleArray];
    earthquakeTVC.eqEventLocations = [xmlParser earthquakesLocationArray];

    XCTAssertTrue([earthquakeTVC.eqEvents count] == [earthquakeTVC.eqEventLocations count],
                  @"earthquakeTVC.eqEventLocations and .eqEvents count not equal");
}

- (void)testArrayValuesForEqEventsAndEqEventLocationWeekExample
{
    EarthquakeTVC *earthquakeTVC = [[EarthquakeTVC alloc]init];
    earthquakeTVC.earthquakeUrlForTVC = @"http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_week.atom";
    
    XMLParser *xmlParser = [[XMLParser alloc] loadXMLByURL:earthquakeTVC.earthquakeUrlForTVC];
    
    earthquakeTVC.eqEvents = [xmlParser earthquakesTitleArray];
    earthquakeTVC.eqEventLocations = [xmlParser earthquakesLocationArray];
    
    XCTAssertTrue([earthquakeTVC.eqEvents count] == [earthquakeTVC.eqEventLocations count],
                  @"earthquakeTVC.eqEventLocations and .eqEvents count not equal");
}


- (void)testArrayValuesForEqEventsAndEqEventLocationMonthExample
{
    EarthquakeTVC *earthquakeTVC = [[EarthquakeTVC alloc]init];
    earthquakeTVC.earthquakeUrlForTVC = @"http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_month.atom";
    
    XMLParser *xmlParser = [[XMLParser alloc] loadXMLByURL:earthquakeTVC.earthquakeUrlForTVC];
    
    earthquakeTVC.eqEvents = [xmlParser earthquakesTitleArray];
    earthquakeTVC.eqEventLocations = [xmlParser earthquakesLocationArray];
    
    XCTAssertTrue([earthquakeTVC.eqEvents count] == [earthquakeTVC.eqEventLocations count],
                  @"earthquakeTVC.eqEventLocations and .eqEvents count not equal");
}









@end
