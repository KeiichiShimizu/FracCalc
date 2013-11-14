//
//  COINSFracContext.h
//  FracCalc
//
//  Created by Shimizu Keiichi on 2013/10/02.
//  Copyright (c) 2013年 COINS Project AID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "COINSFraction.h"
#import "COINSFracState.h"
#import "COINSFracLabel.h"
#import "COINSDenoState.h"
#import "COINSNumeState.h"
#import "COINSPostCalcState.h"


@class COINSFracState;


@interface COINSFracContext : NSObject

@property COINSFracState *currentState;
@property COINSFracLabel *currentLabel;
@property COINSFraction *left;
@property NSString *opr;
@property NSInteger sign;
@property NSMutableString *tmpString;
@property COINSFracLabel *upperlabel;
@property COINSFracLabel *answerlabel;
@property NSInteger counter;
@property BOOL isNull;

-(id)initWith;

-(void)request:(char)inChar;

-(void)toInit;

@end
