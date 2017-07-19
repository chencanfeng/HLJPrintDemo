//
//  PrintHelper.h
//  wewinprinter2015
//
//  Created by LiPing on 15/5/19.
//  Copyright (c) 2015年 wewin. All rights reserved.
//
#import "SocketConnect.h"

@protocol PrintHelperDelegate <NSObject>
-(void) wifi_printSuccess:(int)info;//0打印完成
-(void) wifi_printFail:(int)info;//0,打印失败重试，1，失败停止
@end

@interface PrintHelper : NSObject<SocketConnectDelegate>

@property (retain) SocketConnect *socketconn;
@property (nonatomic,strong) NSMutableString *labelName;
@property (nonatomic) int syCount;
@property (nonatomic) int totalCount;
@property (nonatomic) int isPutPower;
@property (nonatomic) int dl;
@property (nonatomic) int issetHeiduSuc;
@property (nonatomic) int issetCutSuc;
@property (nonatomic) int model_num;

@property (nonatomic) int darkness;
@property (nonatomic) int gap;
@property (nonatomic) int cutoption;
@property (nonatomic) BOOL printRfid;
@property (nonatomic) BOOL print300Dpi;
@property (nonatomic,strong) NSString *rfid_text;
@property (nonatomic,weak) id<PrintHelperDelegate> delegate;

-(void)LabelPrint:(NSArray *)myprintBlocks andPrintCount:(int)myprintcount andModelName:(NSString*)mymodelName andIsDdf:(int)myisddf andLabelWidth:(int)myLabelWidth andLabelHeight:(int)mylabelHeight;
-(int)checkAndConnectWiFi:(BOOL)isShow;
-(int)checkConnect:(BOOL)isShow;
-(void)sendHandshake:(BOOL)isShow;
-(void)sendDarknessSingle:(NSString *)darkNess;
-(void)sendCutoptions:(long)index;
-(void)closeConn;

@end
