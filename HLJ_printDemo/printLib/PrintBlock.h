//
//  PrintModel.h
//  wewinprinter2015
//
//  Created by LiPing on 15/5/20.
//  Copyright (c) 2015年 wewin. All rights reserved.
//

@interface PrintBlock : NSObject

@property(nonatomic,strong) UIImage *image;
@property(nonatomic) CGPoint xyPoint;
@property(nonatomic) BOOL isbarcode;

@end
