//
//  COINSDenoState.h
//  FracCalc
//
//  Created by Shimizu Keiichi on 2013/10/02.
//  Copyright (c) 2013年 COINS Project AID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "COINSFracState.h"
#import "COINSFracLabel.h"
#import "COINSFracContext.h"

//this is state that is inputing denominator
@interface COINSDenoState : COINSFracState <COINSFracState>

@property NSMutableString *value;
//COINSFracState's initWith is used to initialize

@end
