//
//  COINSKeyboard.h
//  FracCalc
//
//  Created by Yusuke IWAMA on 9/16/13.
//  Copyright (c) 2013 COINS Project AID. All rights reserved.
//

/**
 キーボードを実現するクラスである。
 このクラスのインスタンスを作るには、入力を処理するデリゲート、座標、キーの行数・列数、キートップに表示するタイトル、
 入力を判別するための文字を格納した文字列を渡す。
 
 ユーザーがキーをタップすると、デリゲートに対して押されたキーに対応する文字列が渡される。
*/

#import <UIKit/UIKit.h>

@protocol COINSKeyboardDelegate <NSObject>

- (void)input:(unichar)c;

@end


@interface COINSKeyboard : UIView

@property id<COINSKeyboardDelegate> delegate;
@property UIEdgeInsets buttonInset;

// Designated initializer
- (id)initWithDelegate:(id<COINSKeyboardDelegate>)d Frame:(CGRect)f row:(NSUInteger)r column:(NSUInteger)c titles:(NSArray *)t outCharacters:(NSString *)s;
+ (COINSKeyboard *)keyboardWithDelegate:(id<COINSKeyboardDelegate>)d Frame:(CGRect)frame row:(NSUInteger)r column:(NSUInteger)c titles:(NSArray *)t outCharacters:(NSString *)s;
//merrgeInfo is Array of No. of Buttons
- (void)mergeButtons:(NSArray *)mergeInfo;


@end
