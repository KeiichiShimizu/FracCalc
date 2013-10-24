//
//  COINSViewController.h
//  FracCalc
//
//  Created by Yusuke Iwama on 9/14/13.
//  Copyright (c) 2013 COINS Project AID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "COINSKeyboard.h"
#import "COINSFraction.h"
#import "COINSFracContext.h"

@interface COINSViewController : UIViewController <COINSKeyboardDelegate>
{
    COINSFracContext *context;
    //NSInteger fracFlag;
    NSMutableString *tmpString;
    NSMutableString *upper;
    NSMutableString *answer;
    NSInteger i;
    COINSFraction *left;
    COINSFraction *right;
}
@end
