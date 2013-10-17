//
//  COINSFracState.h
//  FracCalc
//
//  Created by Shimizu Keiichi on 2013/10/01.
//  Copyright (c) 2013年 COINS Project AID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "COINSFraction.h"

@class COINSFracContext;
@protocol COINSFracState <NSObject>

-(id)handle:(COINSFracContext *)context inchar:(char)c;

@end

@interface COINSFracState : NSObject <COINSFracState>

-(id)initWith;

-(id)handle:(COINSFracContext *)context inchar:(char)c;


@end
