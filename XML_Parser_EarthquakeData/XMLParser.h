//
//  XMLParser.h
//  XML Earthquake Parser
//
//  Created by philopian on 10/31/13.
//  Copyright (c) 2013 philopian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EarthquakeData.h"
#import "EarthquakeTVC.h"

@interface XMLParser : NSObject <NSXMLParserDelegate>

@property (strong, nonatomic) NSArray *earthquakesTitleArray;
@property (strong, nonatomic) NSArray *earthquakesLocationArray;

-(id) loadXMLByURL:(NSString *)urlString;


@end
