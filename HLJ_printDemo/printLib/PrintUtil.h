//
//  PrintUtil.h
//  testLIB
//
//  Created by 欧海川 on 15/7/7.
//  Copyright (c) 2015年 com.wewin.print. All rights reserved.
//

@protocol PrintUtilDelegate <NSObject>

@optional

-(void) closeSucess:(int)res;
-(void) sendHandshakeSingleSucess:(NSString *)res;
-(void) sendDarknessSingleSucess:(int)res;
-(void) connectSucess:(NSString *)printerName;
-(void) searchSucess:(NSArray *)bluetoothdevices_array;
-(void) printSuccess:(int)info;//0打印完成
-(void) printFail:(int)info;//0,打印失败重试，1，失败停止
-(void) printStart:(int)info;//0,直接打印，1，先搜索设备
@end

@interface PrintUtil : NSObject

@property (nonatomic) BOOL isddf;
@property (nonatomic) int printHeight;
@property (nonatomic) int copyNum;
@property (nonatomic,weak) UIView *view;
@property (nonatomic,strong) NSMutableArray *labelArray;
@property (nonatomic) int labelWidth;
@property (nonatomic) int labelHeight;
@property (nonatomic) int cutoption;
@property (nonatomic) int bleState;
@property (nonatomic,strong) NSString *rfid_text;
@property (nonatomic,strong) id<PrintUtilDelegate> delegate;
@property (nonatomic, assign) BOOL isNotShowListView;
@property (nonatomic, assign) BOOL onlyConnect;

-(void)findPrinter;
-(void)openPrinter:(NSString *)_printerName;
-(void)sendHandshakeSingle;
-(void)sendDarknessSingle:(NSString *)darkNess;
-(void)printLabel:(NSString *)_printerName;
-(int)closePrinter;
@end
