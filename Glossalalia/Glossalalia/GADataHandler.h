//
//  GADataHandler.h
//  Glossolalia
//
//  Created by Paul on 2/16/14.
//  Copyright (c) 2014 Rupert Deese, Paul Dapolito, Alex Melville. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Database.h"
#import "GADataEntry.h"

@interface GADataHandler : NSObject

@property NSMutableArray *dataEntries;

-(id)init;

-(GADataEntry*)grabRandomEntryWithPhrases:(bool)phrasesOnly;

-(NSMutableArray*)grabRandomEntries:(int)num withPhrases:(BOOL)phrasesOnly;

@end
