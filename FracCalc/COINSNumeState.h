//
//  COINSNumeState.h
//  FracCalc
//
//  Created by Shimizu Keiichi on 2013/10/02.
//  Copyright (c) 2013年 COINS Project AID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "COINSFracState.h"
#import "COINSFracContext.h"


@interface COINSNumeState : COINSFracState <COINSFracState>
//this called affter inputing denominator
-(id)initWith:(NSInteger)denomi;

@property NSMutableString *value;
@property NSInteger deno;
@property NSInteger numeCounter;

@end
