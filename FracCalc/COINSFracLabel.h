//
//  COINSFracLabel.h
//  FracCalc
//
//  Created by Shimizu Keiichi on 2013/10/25.
//  Copyright (c) 2013年 COINS Project AID. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COINSFracLabel : UILabel

@property COINSFracLabel *first;
@property COINSFracLabel *second;
@property COINSFracLabel *third;

-(id)update:(char) c;



@end

