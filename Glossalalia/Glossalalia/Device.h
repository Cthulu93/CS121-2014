//
//  Device.h
//  Glossalalia
//
//  Created by Paul on 4/27/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Device : NSManagedObject

@property (nonatomic, retain) NSNumber * highScore;
@property (nonatomic, retain) NSString * lastDBUpdate;

@end
