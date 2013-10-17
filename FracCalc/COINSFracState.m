//
//  COINSFracState.m
//  FracCalc
//
//  Created by Shimizu Keiichi on 2013/10/01.
//  Copyright (c) 2013年 COINS Project AID. All rights reserved.
//

#import "COINSFracState.h"
#import "COINSFracContext.h"

@implementation COINSFracState

-(id)initWith{
    self = [super init];
	
	if (self) {
		return self;
	}else {
        return nil;
    }
}

-(id)handle:(COINSFracContext *)context inchar:(char)c
{
    return self;
}

@end
