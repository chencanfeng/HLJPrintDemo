//
//  printData.h
//  printLIB
//
//  Created by 欧海川 on 14-6-27.
//  Copyright (c) 2014年 com.wewin. All rights reserved.
//

@interface printData : NSObject

@property (nonatomic) unsigned char newtype;
@property (nonatomic) unsigned char type;
@property (nonatomic) float x;
@property (nonatomic) float y;
@property (nonatomic) int isbold;
@property (nonatomic) float height;
@property (nonatomic) float width;
@property (nonatomic) int rotation;
@property (nonatomic,strong) NSString *fontName;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) UIImage *image;

@property (nonatomic) int wordsize;
@property (nonatomic) int wordtype;

@property (nonatomic) int pic_height;
@property (nonatomic) int pic_width;
@property (nonatomic) int pic_num;

@property (nonatomic) int biger;

@end
