//
//  DatabaseCaller.h
//  Glossolalia
//
//  Created by Paul on 2/13/2014
//  Copyright (c) 2014 Harvey Mudd College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Database.h"

@interface DatabaseCaller : NSObject

// actual connection object
@property NSURLConnection *connection;

// object to hold data from the HTTP request
@property NSMutableData *data;
// subsequent array of the parsed HTTP data
@property NSMutableArray *array;

// target and action of data callback
@property id target;
@property SEL action;

- (id)initForCallwithTarget:(id)incomingTarget andAction:(SEL)incomingAction andTesting:(BOOL)testing;

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;

- (void)connectionDidFinishLoading:(NSURLConnection *)connection;

@end