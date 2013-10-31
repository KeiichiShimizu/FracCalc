//
//  COINSFracLabel.h
//  FracCalc
//
//  Created by Shimizu Keiichi on 2013/10/25.
//  Copyright (c) 2013年 COINS Project AID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "COINSFraction.h"


@interface COINSFracLabel : UILabel

@property COINSFracLabel *first;
@property COINSFracLabel *second;
@property COINSFracLabel *third;
@property COINSFraction *fraction;

-(void)update:(char) c;



@end

