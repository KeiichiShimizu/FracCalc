//
//  COINSDenoState.m
//  FracCalc
//
//  Created by Shimizu Keiichi on 2013/10/02.
//  Copyright (c) 2013年 COINS Project AID. All rights reserved.
//

#import "COINSDenoState.h"


@class COINSNumeState;
@class COINSPostCalcState;


@implementation COINSDenoState

@synthesize value;

-(id)initWith{
    self = [super init];
	
	if (self) {
        NSLog(@"Deno");
		return self;
	}else {
        return nil;
    }
}

-(id)handle:(COINSFracContext *)context inchar:(char)c
{
    if (c == 'a') {
        
        context.tmpString = [@"" mutableCopy];
        context.upperlabel = [[COINSFracLabel alloc] init];
        context.answerlabel = [[COINSFracLabel alloc] init];
        COINSDenoState *next = [COINSDenoState alloc];
        return [next initWith];
        
    }else if(c == 'b'){
        
        context.isNull = 1;
        NSInteger denomi = [self.value integerValue];

        
        //context.upperlabel.first.first seen as line of fraction
        context.upperlabel.first.first.frame = CGRectMake(30, 190, 175, 5);
        context.upperlabel.first.first.backgroundColor = [UIColor blackColor];
        context.upperlabel.first.first.text = @"";
        
        //set second and third
        context.upperlabel.first.second.frame = CGRectMake(30, 205, 175, 125);
        context.upperlabel.first.third.frame = CGRectMake(30, 50, 175, 125);
        context.upperlabel.first.second.backgroundColor = [UIColor lightGrayColor];
        context.upperlabel.first.third.backgroundColor = [UIColor lightGrayColor];

        context.upperlabel.first.second.text = [[NSString stringWithFormat:@"%d", denomi]mutableCopy];
        COINSNumeState *next = [COINSNumeState alloc];
        return [next initWith:denomi];
        
    }else if (c == 'c'){
        
        [context.tmpString deleteCharactersInRange:NSMakeRange(context.tmpString.length,1)];
        NSMutableString *tmp = [context.upperlabel.text mutableCopy];
        [tmp deleteCharactersInRange:NSMakeRange(tmp.length,1)];
        context.counter--;
        return self;

    }else if (c == 's'){
        
        if (context.sign == -1) {
            context.sign = 1;
        }else{
            context.sign = -1;
        }
        return self;
        
    }else if (c == '+' | c == '-' | c == '*' | c == '/'){
        
        //see input as real number
        context.opr = [NSString stringWithFormat:@"%c", c];
        COINSDenoState *next = [COINSDenoState alloc];
        NSInteger real = [value integerValue];
        context.left = [context.left initWith:context.sign numerator:real denominator:1];
        return [next initWith];
    
    }else if (c == '0' | c == '1' | c == '2' | c == '3' | c == '4' |c == '5'| c == '6' | c == '7' | c == '8' | c == '9'){
        
        [self.value appendFormat:@"%c",c];
        return self;
        if (context.left == NULL) {
            return self;
        }else{
            NSInteger val = [self.value integerValue];
            COINSFraction *right = [COINSFraction alloc];
            right = [right initWith:1 numerator:val denominator:1];
            context.left = [context.left add:right];
            context.answerlabel.text = [NSString stringWithFormat:@"%@", [context.left stringRepresentation]];
            COINSPostCalcState *next = [COINSPostCalcState alloc];
            return [next initWith];
        }
    }else{
        return self;
    }
    
}

-(id)clearOne:(COINSFracContext *)context
{
    
}

@end
