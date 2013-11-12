//
//  XMLParserTests.m
//  XML_Parser_EarthquakeData
//
//  Created by philopian on 11/8/13.
//  Copyright (c) 2013 philopian. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XMLParser.h"

@interface XMLParserTests : XCTestCase

@end

@implementation XMLParserTests

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

- (void)testFinalArrayLengthForDayExample
{
    
    XMLParser *xmlParser = [[XMLParser alloc]init];
    NSString *eqTimeFrameURLs = @"http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_day.atom";
    
    [xmlParser loadXMLByURL:eqTimeFrameURLs];
     
    XCTAssertTrue([xmlParser.earthquakesTitleArray count] == [xmlParser.earthquakesLocationArray count],
                  @"arrays are not the same length");
}

- (void)testFinalArrayLengthForWeekExample
{
    
    XMLParser *xmlParser = [[XMLParser alloc]init];
    NSString *eqTimeFrameURLs = @"http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_week.atom";
    
    [xmlParser loadXMLByURL:eqTimeFrameURLs];
    
    XCTAssertTrue([xmlParser.earthquakesTitleArray count] == [xmlParser.earthquakesLocationArray count],
                  @"arrays are not the same length");
}

- (void)testFinalArrayLengthForMonthExample
{
    
    XMLParser *xmlParser = [[XMLParser alloc]init];
    NSString *eqTimeFrameURLs = @"http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_month.atom";
    
    [xmlParser loadXMLByURL:eqTimeFrameURLs];
    
    XCTAssertTrue([xmlParser.earthquakesTitleArray count] == [xmlParser.earthquakesLocationArray count],
                  @"arrays are not the same length");
}





@end
