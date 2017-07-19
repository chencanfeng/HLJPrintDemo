//
//  XmlUtil.h
//  wewinprinter2015
//
//  Created by wewin on 15/4/16.
//  Copyright (c) 2015年 wewin. All rights reserved.
//

#import "Data.h"
#import "XmlPrintData.h"

@interface XmlUtil : NSObject<NSXMLParserDelegate>

@property(nonatomic,strong)Data *data;
@property(nonatomic,strong)NSMutableArray *printDatas;
@property(nonatomic,strong)XmlPrintData *xmlPrintData;
@property(nonatomic,strong)NSMutableString *currentString;
@property(nonatomic,strong)NSString *currentTag;

-(void)parseXMLData:(NSData *)data;

@end
