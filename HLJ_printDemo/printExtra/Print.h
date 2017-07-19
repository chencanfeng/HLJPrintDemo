//
//  Print.h
//  testLIB
//
//  Created by LiPing on 16/2/19.
//  Copyright © 2016年 com.wewin.print. All rights reserved.
//
@interface Print:NSObject

@property(nonatomic,weak) UIView *view;

@property(nonatomic,assign) UIView *showVp;
@property(nonatomic,assign) UIImageView *showimg;

-(int)printContent:(NSString *)xml printName:(NSString *)printName;
-(int)closePrint;

@end
