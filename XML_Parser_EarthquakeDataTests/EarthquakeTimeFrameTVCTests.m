//
//  EarthquakeTimeFrameTVCTests.m
//  XML_Parser_EarthquakeData
//
//  Created by philopian on 11/7/13.
//  Copyright (c) 2013 philopian. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppDelegate.h"
#import "EarthquakeTimeFrameTVC.h"

@interface EarthquakeTimeFrameTVCTests : XCTestCase

@end

@implementation EarthquakeTimeFrameTVCTests

#pragma mark - setup/tearDown

- (void)setUp
{
    [super setUp];
    // ...
}

- (void)tearDown
{
    // ...
    [super tearDown];
}



#pragma mark - tests


//eqTimeFrameOptions;
//@property (strong, nonatomic) NSArray *eqTimeFrameURLs;

- (void)testEqTimeFrameOptionsHasThreeObjectsInArray
{
    EarthquakeTimeFrameTVC *earthquakeTimeFrameTVC = [[EarthquakeTimeFrameTVC alloc]init];
    [earthquakeTimeFrameTVC viewDidLoad];
    [earthquakeTimeFrameTVC eqTimeFrameOptions];
    
    NSLog(@"....%lu",(unsigned long)[[earthquakeTimeFrameTVC eqTimeFrameOptions]count] );
    XCTAssertTrue([[earthquakeTimeFrameTVC eqTimeFrameOptions] count] == 3 ,
                  @"");

}

- (void)testEqTimeFrameURLsHasThreeObjectsInArray
{
    EarthquakeTimeFrameTVC *earthquakeTimeFrameTVC = [[EarthquakeTimeFrameTVC alloc]init];
    [earthquakeTimeFrameTVC viewDidLoad];
    [earthquakeTimeFrameTVC eqTimeFrameURLs];
    
    NSLog(@"....%lu",(unsigned long)[[earthquakeTimeFrameTVC eqTimeFrameURLs]count] );
    XCTAssertTrue([[earthquakeTimeFrameTVC eqTimeFrameURLs] count] == 3 ,
                  @"");
}

- (void)testEqTitleHasThreeObjectsInArray
{
    EarthquakeTimeFrameTVC *earthquakeTimeFrameTVC = [[EarthquakeTimeFrameTVC alloc]init];
    [earthquakeTimeFrameTVC viewDidLoad];
    [earthquakeTimeFrameTVC eqTitle];
    
    NSLog(@"....%lu",(unsigned long)[[earthquakeTimeFrameTVC eqTitle]count] );
    XCTAssertTrue([[earthquakeTimeFrameTVC eqTitle] count] == 3 ,
                  @"");
}



-(void)testSelectedURL
{
//    EarthquakeTimeFrameTVC *earthquakeTimeFrameTVC = [[EarthquakeTimeFrameTVC alloc]init];
//    [earthquakeTimeFrameTVC didselec];

}








@end
