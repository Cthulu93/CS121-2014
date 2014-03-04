//
//  DatabaseCaller.m
//  Glossalalia
//
//  Created by Paul on 2/13/2014
//  Copyright (c) 2014 Harvey Mudd College. All rights reserved.
//

#import "DatabaseCaller.h"

@implementation DatabaseCaller

// initialize the caller and provide authentication
- (id)initForCallwithTarget:(id)incomingTarget andAction:(SEL)incomingAction andTesting:(BOOL)testing
{
    self = [super init];
    if (self) {
        _target = incomingTarget;
        _action = incomingAction;
        
        // connection object passes authentication information with the URL
        // returns to the connectionDidFinishLoading method below
        if(!testing){
        _connection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://paul:paul123@pauldapolito.com/cs121/json.php"]] delegate:self];
        }
        if(testing){
            _connection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://paul:paul123@pauldapolito.com/cs121/jsonTest.php"]] delegate:self];

        }
    }
    return self;
}

// relevant callback methods
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.data = [[NSMutableData alloc] initWithCapacity:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}

// put all entries in database
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSMutableArray* array = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingMutableContainers error:nil];
    [self.target performSelector:self.action withObject:array];
}
@end
