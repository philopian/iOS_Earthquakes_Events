//
//  XMLParser.m
//  XML Earthquake Parser
//
//  Created by philopian on 10/31/13.
//  Copyright (c) 2013 philopian. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser


NSMutableString *currentNodeContent;
NSXMLParser *parser;
EarthquakeData *currentEQ;
bool onlyInsideTagNamedEntry;







-(id) loadXMLByURL:(NSString *)urlString
{
    currentEQ = [[EarthquakeData alloc] init];
    currentEQ.eqTitle = [[NSMutableArray alloc] init];
    currentEQ.eqLocation = [[NSMutableArray alloc] init];

    
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    parser = [[NSXMLParser alloc]initWithData:data];
    parser.delegate = self;
    [parser parse];

    onlyInsideTagNamedEntry = nil;  // reset to nil so fresh each time
    return self;
}





// this trims out the whitespace and new lines charactersets
-(void)  parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string
{
    currentNodeContent = (NSMutableString *) [string stringByTrimmingCharactersInSet:
                                              [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}





// Node starts of the parent node for each pieces e.g. <feed>
-(void)  parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName
     attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"entry"]) {
//        currentEQ = [[EarthquakeData alloc] init];
        onlyInsideTagNamedEntry = YES;
        
    }

}

// Node stops
-(void)  parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName
{
    
    if (onlyInsideTagNamedEntry == YES) {
        if ([elementName isEqualToString:@"title"]) {
            // ... content of the <title> ...</title>
            
            [currentEQ.eqTitle addObject:currentNodeContent];
//            NSLog(@",,,,,title: %@", currentNodeContent);
        }
        if ([elementName isEqualToString:@"georss:point"]) {
            // ... content of the <georss:point> ...</georss:point>
            
            [currentEQ.eqLocation addObject:currentNodeContent];
//            NSLog(@"~~~~Location: %@", currentNodeContent);
        }
    }
    

    
    
    // When parser reached the end of the parent node e.g. </feed>
    if ([elementName isEqualToString:@"feed"]) {

        _earthquakesTitleArray = [[NSArray alloc] initWithArray:currentEQ.eqTitle];
        _earthquakesLocationArray = [[NSArray alloc] initWithArray:currentEQ.eqLocation];

    }
}















@end






































