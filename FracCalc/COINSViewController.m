//
//  COINSViewController.m
//  FracCalc
//
//  Created by Yusuke Iwama on 9/14/13.
//  Copyright (c) 2013 COINS Project AID. All rights reserved.
//

#import "COINSViewController.h"
#import "COINSFraction.h"
#import "COINSFracLabel.h"
#import <UIKit/UIKit.h>


@interface COINSViewController ()

@end

@implementation COINSViewController {
	NSMutableString *inputString;
	
	CGSize appSize;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	inputString = [NSMutableString string];
    
    context = [[COINSFracContext alloc] initWith];


	appSize = CGSizeMake([UIScreen mainScreen].applicationFrame.size.width,
						 [UIScreen mainScreen].applicationFrame.size.height);
	
	COINSFraction *x = [COINSFraction fractionWithString:@"-1/7"];
	COINSFraction *y = [COINSFraction fractionWith:1 numerator:1 denominator:7];

	NSLog(@"%@ + %@ = %@", x.stringRepresentation, y.stringRepresentation, [x add:y].stringRepresentation);
	NSLog(@"%@ - %@ = %@", x.stringRepresentation, y.stringRepresentation, [x sub:y].stringRepresentation);
	NSLog(@"%@ * %@ = %@", x.stringRepresentation, y.stringRepresentation, [x mul:y].stringRepresentation);
	NSLog(@"%@ / %@ = %@", x.stringRepresentation, y.stringRepresentation, [x div:y].stringRepresentation);
	
	NSLog(@"%@ + %@ / %@ = %@", x.stringRepresentation, x.stringRepresentation, y.stringRepresentation, [x add:[x div:y]].stringRepresentation);
	
	NSArray *buttonTitles = @[@"AC",	@"C",	@"±",	@"÷",
						   @"7",	@"8",	@"9",	@"×",
						   @"4",	@"5",	@"6",	@"-",
						   @"1",	@"2",	@"3",	@"+",
						   @"0",	@"分の",	@"分の",	@"="];
	NSString *outCharacters = @"acs/789*456-123+0bb=";
	COINSKeyboard *keyboard = [[COINSKeyboard alloc] initWithFrame:CGRectMake(600, 20, 400, 738)];
    keyboard.delegate = self;
    [keyboard updateButtonsWithRow:5 column:4 titles:buttonTitles outCharacters:outCharacters];
	NSArray *mergeInfo = @[@[@17, @18]];
	[keyboard mergeButtons:mergeInfo];
	[self.view addSubview:keyboard];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0, 20, 600, 78);
    titleLabel.backgroundColor = [UIColor lightGrayColor];
    titleLabel.text = @"Fraction Calculator";
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.font = [UIFont systemFontOfSize:30];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    

    
    //create upperlabel
    context.upperlabel = [[COINSFracLabel alloc] init];
    context.currentLabel = [[COINSFracLabel alloc] init];

    
    //first has left operand
    context.upperlabel.first = [[COINSFracLabel alloc] init];
    //context.upperlabel.first.frame = CGRectMake(30, 50, 175, 300);
    //context.upperlabel.first.backgroundColor = [UIColor redColor];
    
    
    //context.upperlabel.first.first is int value or line of fraction
    context.upperlabel.first.first = [[COINSFracLabel alloc] init];
    context.upperlabel.first.first.frame = CGRectMake(30, 225, 175, 125);
    context.upperlabel.first.first.backgroundColor = [UIColor lightGrayColor];
    context.upperlabel.first.first.text = @"";
	//[self.view addSubview:context.upperlabel.first];
    [self.view addSubview:context.upperlabel.first.first];

    
    //init of denomi and nume label
    context.upperlabel.first.second = [[COINSFracLabel alloc] init];
    context.upperlabel.first.third = [[COINSFracLabel alloc] init];
    [self.view addSubview:context.upperlabel.first.second];
    [self.view addSubview:context.upperlabel.first.third];
    
    //set second and third
    context.upperlabel.first.second.frame = CGRectMake(30, 305, 175, 125);
    context.upperlabel.first.third.frame = CGRectMake(30, 150, 175, 125);
    context.upperlabel.first.second.backgroundColor = [UIColor lightGrayColor];
    context.upperlabel.first.third.backgroundColor = [UIColor lightGrayColor];
    context.upperlabel.first.second.hidden = YES;
    context.upperlabel.first.third.hidden = YES;

    
    
    //second has operator
    context.upperlabel.second = [[COINSFracLabel alloc] init];
    context.upperlabel.second.frame = CGRectMake(215, 165, 125, 250);
    context.upperlabel.second.backgroundColor = [UIColor blueColor];
	[self.view addSubview:context.upperlabel.second];
    context.upperlabel.second.font = [UIFont systemFontOfSize:60];
    context.upperlabel.second.textAlignment = NSTextAlignmentCenter;


    
    //third has right operand
    context.upperlabel.third = [[COINSFracLabel alloc] init];
    //context.upperlabel.third.frame = CGRectMake(350, 50, 175, 300);
    //context.upperlabel.third.backgroundColor = [UIColor redColor];
 //   [self.view addSubview:context.upperlabel.third];
    //context.upperlabel.third.first is int value or line of fraction
    context.upperlabel.third.first = [[COINSFracLabel alloc] init];
    context.upperlabel.third.first.frame = CGRectMake(350, 225, 175, 125);
    context.upperlabel.third.first.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:context.upperlabel.third.first];
    
    //init of denomi and nume label
    context.upperlabel.third.second = [[COINSFracLabel alloc] init];
    context.upperlabel.third.third = [[COINSFracLabel alloc] init];
    [self.view addSubview:context.upperlabel.third.second];
    [self.view addSubview:context.upperlabel.third.third];
    //set second and third
    context.upperlabel.third.second.frame = CGRectMake(30, 305, 175, 125);
    context.upperlabel.third.third.frame = CGRectMake(30, 150, 175, 125);
    context.upperlabel.third.second.backgroundColor = [UIColor lightGrayColor];
    context.upperlabel.third.third.backgroundColor = [UIColor lightGrayColor];
    context.upperlabel.third.second.hidden = YES;
    context.upperlabel.third.third.hidden = YES;

    
    
    upper = [NSMutableString string];
    
    [upper appendFormat:@" "];
    
    
    //create label
    context.answerlabel = [[COINSFracLabel alloc] init];
    
    context.answerlabel.frame = CGRectMake(30, 400, 550, 300);
    

    
    context.answerlabel.first = [[COINSFracLabel alloc] init];
    context.answerlabel.first.frame = CGRectMake(30, 530, 175, 100);
    context.answerlabel.first.text = @"=";
    context.answerlabel.first.font = [UIFont systemFontOfSize:60];
    context.answerlabel.first.textAlignment  = NSTextAlignmentCenter;
    //context.answerlabel.first.backgroundColor = [UIColor lightGrayColor];
    //context.answerlabel.first.hidden = YES;
    
    //context.answerlabel.second has answer fraction
    context.answerlabel.second = [[COINSFracLabel alloc] init];
    context.answerlabel.second.first = [[COINSFracLabel alloc] init];
    context.answerlabel.second.second = [[COINSFracLabel alloc] init];
    context.answerlabel.second.third = [[COINSFracLabel alloc] init];
    //context.answerlabel.second.frame = CGRectMake(130, 400, 420, 300);
    context.answerlabel.second.first.frame = CGRectMake(200, 510, 300, 150);
    context.answerlabel.second.first.backgroundColor = [UIColor lightGrayColor];
    context.answerlabel.second.second.frame = CGRectMake(200, 425, 300, 150);
    context.answerlabel.second.second.backgroundColor = [UIColor lightGrayColor];
    context.answerlabel.second.third.frame = CGRectMake(200, 594, 300, 150);
    context.answerlabel.second.third.backgroundColor = [UIColor lightGrayColor];
    //context.answerlabel.second.second.frame = CGRectMake(130, 400, 300, 150);
    context.answerlabel.second.first.adjustsFontSizeToFitWidth = YES;
    context.answerlabel.second.second.adjustsFontSizeToFitWidth = YES;
    context.answerlabel.second.third.adjustsFontSizeToFitWidth = YES;
    //context.answerlabel.second.first.hidden = YES;
    context.answerlabel.second.second.hidden = YES;
    context.answerlabel.second.third.hidden = YES;
    
    answer = [NSMutableString string];
    
    
    
    [answer appendFormat:@" "];
    
    //context.answerlabel.first.text = answer;
    
    [self.view addSubview:context.answerlabel.first];
    [self.view addSubview:context.answerlabel.second.first];
    [self.view addSubview:context.answerlabel.second.second];
    [self.view addSubview:context.answerlabel.second.third];
    context.currentLabel = context.upperlabel.first;
    [context toInit];

    tmpString = [@"" mutableCopy];
    i = 0;
}



#pragma mark COINSKeyboardDelegate

- (void)input:(unichar)c
{
	[inputString appendFormat:@"%c", c];

    context.currentState = [context.currentState handle:context inchar:c];
   /*
    if (fracFlag == 1) {
        if (c == '/' | c == '*' | c == '+' | c == '-') {
            fracFlag = 0;
            i = [upper length] + 1;
            [tmpString appendFormat:@"%c",c];
            if (c == '+') {
                left = [left add:right];
            }else if(c == '-')
            {
                left = [left sub:right];
            }else if(c == '*')
            {
                left = [left mul:right];
            }else if (c == '/')
            {
                left = [left div:right];
            }
            [upper appendFormat:@"%c", c];
        }else if(c == '0' | c == '1' | c == '2' | c == '3' | c == '4' | c == '5' | c == '6' | c == '7' | c == '8' | c == '9'){
            [upper insertString:[NSString stringWithFormat:@"%c", c] atIndex:i];
            i++;
            [tmpString appendFormat:@"%c",c];
        }else if(c == 'a'){
            upper = [@"" mutableCopy];
           // NSLog(@"%@", tmpString);
            fracFlag = 0;
            i = 0;
        }
    }else{
    
        if (c == 'b') {
            fracFlag = 1;
            [upper insertString:@"/" atIndex:i];
            left.numerator = [tmpString integerValue];
            tmpString = [@"" mutableCopy];
        }else if(c == 'a'){
            upper = [@"" mutableCopy];
            NSLog(@"%@", tmpString);
            fracFlag = 0;
            i = 0;
        }else{
            [upper appendFormat:@"%c", c];
            NSLog(@"%@", tmpString);
        }
    }
    */
//    [upper appendString:tmpString];
    context.upperlabel.text = upper;

    NSLog(@"inputString: %@", inputString);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end