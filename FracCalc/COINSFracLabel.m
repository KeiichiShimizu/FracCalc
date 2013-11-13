//
//  COINSFracLabel.m
//  FracCalc
//
//  Created by Shimizu Keiichi on 2013/10/25.
//  Copyright (c) 2013年 COINS Project AID. All rights reserved.
//

#import "COINSFracLabel.h"

@implementation COINSFracLabel
@synthesize first;
@synthesize second;
@synthesize third;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWith
{
    self = [super init];
    if(self){
        return self;
    }else{
        return nil;
    }
}

-(void)update:(char) c{
        NSLog(@"hoge");
        NSMutableString *tmp = [self.text mutableCopy];
        [tmp appendFormat:@"%c", c];
        self.text = tmp;
}

-(void)setFraction{
    
}

-(void)cleateFrac:(UILabel *)alabel{
    
}

-(void)addHead:(UILabel *)alabel{
    
}

-(void)addTail:(UILabel *)alabel{
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
