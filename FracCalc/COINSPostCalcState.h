//
//  COINSPostCalcState.h
//  FracCalc
//
//  Created by Shimizu Keiichi on 2013/10/02.
//  Copyright (c) 2013年 COINS Project AID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "COINSFracState.h"
#import "COINSFracContext.h"

@interface COINSPostCalcState : COINSFracState <COINSFracState>

@property NSMutableString *value;

-(id)clearOne:(COINSFracContext *)context ;

@end
