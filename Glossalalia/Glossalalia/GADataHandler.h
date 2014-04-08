//
//  GADataHandler.h
//  Glossalalia
//
//  Created by Paul on 2/16/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Database.h"
#import "GADataEntry.h"

@interface GADataHandler : NSObject

@property NSMutableArray *dataEntries;

-(id)init;

-(GADataEntry*)grabRandomEntry;

-(NSMutableArray*)grabRandomEntries:(int)num withPhrases:(BOOL)includePhrases;

@end
