//
//  GADataViewController.h
//  Glossolalia
//
//  Created by Paul on 2/15/14.
//  Copyright (c) 2014 Rupert Deese, Paul Dapolito, Alex Melville. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"
#import "GADataEntry.h"

@interface GADataViewController : UITableViewController

// data from server
@property NSMutableArray *data;

@end
