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
#import "COINSDenoState.h"
#import "COINSNumeState.h"
#import "COINSPostCalcState.h"


@class COINSFracState;

@interface COINSFracContext : NSObject

@property COINSFracState *currentState;
@property COINSFraction *left;
@property NSString *opr;
@property NSInteger sign;
@property NSMutableString *tmpString;
@property UILabel *upperlabel;
@property UILabel *answerlabel;
@property NSInteger counter;
@property BOOL isNull;

-(id)initWith;

-(void)request:(char)inChar;



@end
