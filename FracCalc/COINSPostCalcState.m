//
//  COINSPostCalcState.m
//  FracCalc
//
//  Created by Shimizu Keiichi on 2013/10/02.
//  Copyright (c) 2013年 COINS Project AID. All rights reserved.
//

#import "COINSPostCalcState.h"


@class COINSDenoState;
@class COINSNumeState;

@implementation COINSPostCalcState

@synthesize value;

-(id)initWith{
    self = [super init];
	
	if (self) {
        NSLog(@"Post");
		return self;
	}else {
        return nil;
    }
}

-(id)handle:(COINSFracContext *)context inchar:(char)c
{
    if (c == 'a') {
        context.tmpString = [@"" mutableCopy];
        context.upperlabel = [@"" mutableCopy];
        context.answerlabel.text = [@"" mutableCopy];
        COINSDenoState *next = [COINSDenoState alloc];
        return [next init];
    }else if (c == '+' | c == '-' | c == '*' | c == '/'){
        COINSDenoState *next = [COINSDenoState alloc];
        NSInteger real = [value integerValue];
        context.left = [context.left initWith:context.sign numerator:real denominator:1];
        return [next init];
        
    }else if (c == 's'){
        if (context.sign == -1) {
            context.sign = 1;
        }else{
            context.sign = -1;
        }
        return self;
    }else{
        return self;
    }

}

-(id)clearOne:(COINSFracContext *)context
{
	return nil; // 空のオブジェクトを返します。編集するとき消してね。
}

@end
