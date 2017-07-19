//
//  PrintData.h
//  wewinprinter2015
//
//  Created by wewin on 15/4/16.
//  Copyright (c) 2015年 wewin. All rights reserved.
//

@interface XmlPrintData : NSObject

@property(nonatomic,strong) NSString *PrintType;
@property(nonatomic,strong) NSString *LabelType;
@property(nonatomic,strong) NSString *LabelTitle;
@property(nonatomic,strong) NSString *Code;
@property(nonatomic,retain) NSMutableArray *textArray;

@end
