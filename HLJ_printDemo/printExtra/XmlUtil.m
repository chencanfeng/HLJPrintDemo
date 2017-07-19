//
//  XmlUtil.m
//  wewinprinter2015
//
//  Created by wewin on 15/4/16.
//  Copyright (c) 2015年 wewin. All rights reserved.
//

#import "XmlUtil.h"
@implementation XmlUtil
{
    NSString *valueStr;
}

@synthesize data;

//解析XML数据
-(void)parseXMLData:(NSData *)xmlData
{
    //1.创建解析器
    NSXMLParser *parser=[[NSXMLParser alloc]initWithData:xmlData];
    //2.设置代理
    parser.delegate=self;
    
    //3.开始解析
    [parser parse];  //这个方法会卡住（同步解析，解析完毕后才会返回）
}

#pragma mark-NSXMLParserDelegate
//解析到一个元素的开头时调用
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    self.currentTag = elementName;
    if ([elementName isEqualToString:@"Print"]) {
        self.xmlPrintData = [[XmlPrintData alloc] init];
    }else if([@"Text" isEqualToString:elementName]){
        valueStr=@"";
    }else if([_currentTag isEqualToString:@"Code"]){
        valueStr=@"";
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([self.currentTag isEqualToString:@"EntityTypeId"]) {
        _xmlPrintData.PrintType=string;
    }else if([self.currentTag isEqualToString:@"Code"]){
        valueStr=[valueStr stringByAppendingString:string];
    }else if([self.currentTag isEqualToString:@"Text"]){
        valueStr=[valueStr stringByAppendingString:string];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {

    if ([elementName isEqualToString:@"Print"]) {
        if (_printDatas==nil) {
            _printDatas=[[NSMutableArray alloc] init];
        }
        [self.printDatas addObject:self.xmlPrintData];
        self.xmlPrintData = nil;
    }else if([self.currentTag isEqualToString:@"Code"]){
        _xmlPrintData.Code=valueStr;
    }else if([self.currentTag isEqualToString:@"Text"]){
        if (_xmlPrintData.textArray==nil) {
            _xmlPrintData.textArray=[[NSMutableArray alloc] init];
        }
        
        [_xmlPrintData.textArray addObject:valueStr];
    }
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"开始解析xml文件");
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"解析xml文件完成");
}

@end
