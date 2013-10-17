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


-(id)handle:(COINSFracContext *)context inchar:(char)c
{
    if (c == 'a') {
        context.tmpString = [@"" mutableCopy];
        context.upperlabel.text = [@"" mutableCopy];
        COINSDenoState *next = [COINSDenoState alloc];
        return [next init];
    }else if (c == '+' | c == '-' | c == '*' | c == '/'){
        COINSDenoState *next = [COINSDenoState alloc];
        NSInteger real = [value integerValue];
        context.left = [context.left initWith:1 numerator:real denominator:1];
        return [next init];
    }else{
        return self;
    }

}

-(id)clearOne:(COINSFracContext *)context
{
    
}

@end
