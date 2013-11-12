//
//  EarthquakeData.h
//  XML Earthquake Parser
//
//  Created by philopian on 10/31/13.
//  Copyright (c) 2013 philopian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EarthquakeData : NSObject

// feed/entry/title
@property (strong, nonatomic) NSMutableArray *eqTitle;

// feed/entry/georss:point
@property (strong, nonatomic) NSMutableArray *eqLocation;


@end
