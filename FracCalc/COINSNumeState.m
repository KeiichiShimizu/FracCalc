//
//  COINSNumeState.m
//  FracCalc
//
//  Created by Shimizu Keiichi on 2013/10/02.
//  Copyright (c) 2013年 COINS Project AID. All rights reserved.
//

#import "COINSNumeState.h"

@class COINSDenoState;
@class COINSPostCalcState;

@implementation COINSNumeState

@synthesize value;


-(id)initWith:(NSInteger)denomi
{
    self = [super init];
	
	if (self) {
        self.deno = denomi;
        self.numeCounter = 0;
        NSLog(@"Nume");
		return self;
	}else {
        return nil;
    }
}


-(id)handle:(COINSFracContext *)context inchar:(char)c
{
    if (c == 'a') {
        [context toInit];
        context.tmpString = [@"" mutableCopy];
        context.upperlabel.text = [@"" mutableCopy];
        context.upperlabel.first.second.hidden = YES;
        context.upperlabel.first.third.hidden = YES;
        context.answerlabel.text = [@"" mutableCopy];
        context.currentLabel = context.upperlabel.first.first;
        return context.currentState;
    }else if (c == 'c'){
        
        [context.tmpString deleteCharactersInRange:NSMakeRange(self.numeCounter,1)];
        NSMutableString *tmp = [context.upperlabel.text mutableCopy];
        [tmp deleteCharactersInRange:NSMakeRange(self.numeCounter,1)];
        self.numeCounter--;
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
        
        NSInteger num = [self.value integerValue];
        if (context.left == NULL) {
            [context.tmpString appendFormat:@"%c",c];
            context.opr = [NSString stringWithFormat:@"%c", c];
            context.left = [context.left initWith:context.sign numerator:num denominator:self.deno];
            context.sign = 1;
            COINSDenoState *next = [COINSDenoState alloc];
            return [next initWith];
            
        }else{
            
            COINSFraction *right;

            right = [right initWith:context.sign numerator:num denominator:self.deno];
            context.sign = 1;
            
            if ([context.opr  isEqual: @"+"]) {
                context.left = [context.left add:right];
            }else if ([context.opr  isEqual: @"-"]){
                context.left = [context.left sub:right];
            }else if ([context.opr  isEqual: @"*"]){
                context.left = [context.left mul:right];
            }else if ([context.opr  isEqual: @"/"]){
                context.left = [context.left div:right];
            }
            context.opr = [NSString stringWithFormat:@"%c",c];
            COINSDenoState *next = [COINSDenoState alloc];
            next = [next initWith];
            return next;
        }
        
    }else if (c == '0' | c == '1' | c == '2' | c == '3' | c == '4' | c == '5'| c == '6' | c == '7' | c == '8' | c == '9'){
        [self.value appendFormat:@"%c",c];
        self.numeCounter++;
        return self;
        
    }else if (c == '='){
        if (context.left == NULL) {
            return self;
            
        }else{
            NSInteger val = [self.value integerValue];
            COINSFraction *right = [COINSFraction alloc];
            right = [right initWith:context.sign numerator:val denominator:1];
            context.sign = 1;
            if ([context.opr  isEqual: @"+"]) {
                context.left = [context.left add:right];
            }else if ([context.opr  isEqual: @"-"]){
                context.left = [context.left sub:right];
            }else if ([context.opr  isEqual: @"*"]){
                context.left = [context.left mul:right];
            }else if ([context.opr  isEqual: @"/"]){
                context.left = [context.left div:right];
            }
            context.opr = [NSString stringWithFormat:@""];
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
