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


-(void)toInit
{
    
    
    //first has left operand
    //context.upperlabel.first.first is int value or line of fraction
    self.upperlabel.first.first.frame = CGRectMake(30, 225, 175, 125);
    self.upperlabel.first.first.backgroundColor = [UIColor lightGrayColor];
    
    //init of denomi and nume label
    self.upperlabel.first.second.frame = CGRectMake(30, 305, 175, 125);
    self.upperlabel.first.third.frame = CGRectMake(30, 150, 175, 125);
    self.upperlabel.first.second.backgroundColor = [UIColor lightGrayColor];
    self.upperlabel.first.third.backgroundColor = [UIColor lightGrayColor];
    self.upperlabel.first.second.hidden = YES;
    self.upperlabel.first.third.hidden = YES;


    
    //second has operator
    self.upperlabel.second = [[COINSFracLabel alloc] init];
    self.upperlabel.second.frame = CGRectMake(215, 165, 125, 250);
    self.upperlabel.second.backgroundColor = [UIColor blueColor];
    
    
    //third has right operand
    self.upperlabel.third = [[COINSFracLabel alloc] init];
    self.upperlabel.third.frame = CGRectMake(350, 150, 175, 300);
    self.upperlabel.third.backgroundColor = [UIColor redColor];
    //   [self.view addSubview:context.upperlabel.third];
    
    //context.upperlabel.third.first is int value or line of fraction
    self.upperlabel.third.first = [[COINSFracLabel alloc] init];
    self.upperlabel.third.first.frame = CGRectMake(350, 225, 175, 125);
    self.upperlabel.third.first.backgroundColor = [UIColor lightGrayColor];
    
    
    //init of denomi and nume label
    self.upperlabel.third.second.frame = CGRectMake(30, 305, 175, 125);
    self.upperlabel.third.third.frame = CGRectMake(30, 150, 175, 125);
    self.upperlabel.third.second.backgroundColor = [UIColor lightGrayColor];
    self.upperlabel.third.third.backgroundColor = [UIColor lightGrayColor];
    self.upperlabel.third.second.hidden = YES;
    self.upperlabel.third.third.hidden = YES;
    
    
    self.tmpString = [@"" mutableCopy];
    self.upperlabel.first.first.text = @"";
    self.upperlabel.first.second.text = @"";
    self.upperlabel.first.third.text = @"";
    self.upperlabel.second.text = @"";
    self.upperlabel.third.first.text = @"";
    self.upperlabel.third.second.text = @"";
    self.upperlabel.third.third.text = @"";
    self.upperlabel.first.second.hidden = YES;
    self.upperlabel.first.third.hidden = YES;
    self.answerlabel.text = @"";

    
    //init of currentLabel, first.first
    self.currentLabel = self.upperlabel.first.first;
    
    currentState = [[COINSDenoState alloc] initWith];
    left = [[COINSFraction alloc] init];
    isNull = true;
    counter = 0;
    sign = 1;
    
}

-(id)initWith
{
    self = [super init];
	
	if (self) {
        currentState = [[COINSDenoState alloc] initWith];
        left = [[COINSFraction alloc] init];
        isNull = true;
        counter = 0;
        sign = 1;
    }
    return self;
}

-(void)request:(char)inChar;
{
    currentState = [currentState handle:self inchar:inChar];
}

@end
