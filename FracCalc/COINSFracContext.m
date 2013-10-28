//
//  COINSFracContext.m
//  FracCalc
//
//  Created by Shimizu Keiichi on 2013/10/02.
//  Copyright (c) 2013年 COINS Project AID. All rights reserved.
//

#import "COINSFracContext.h"
#import "COINSFracState.h"
#import "COINSDenoState.h"
#import "COINSNumeState.h"
#import "COINSPostCalcState.h"

@implementation COINSFracContext

@synthesize currentState;
@synthesize left;
@synthesize tmpString;
@synthesize upperlabel;
@synthesize answerlabel;
@synthesize counter;
@synthesize isNull;
@synthesize sign;


-(id)initWith
{
    self = [super init];
	
	if (self) {
        COINSDenoState *state = [COINSDenoState alloc];
        currentState = [state initWith];
        left = [COINSFraction alloc];
        isNull = true;
        counter = 0;
        sign = 1;
		return self;
	}else {
        return nil;
    }
}

-(void)request:(char)inChar;
{
    currentState = [currentState handle:self inchar:inChar];
}

@end
