//
//  SockConnect.h
//  TestPrinter
//
//  Created by LiPing on 13-7-17.
//  Copyright (c) 2013年 LiPing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>
#import <unistd.h>
#include <sys/types.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <SystemConfiguration/SystemConfiguration.h>
#include <ifaddrs.h>
#include <net/if.h>

@class SocketConnect;
@protocol SocketConnectDelegate <NSObject>
-(void)SocketCallBack:(SocketConnect *)socketconn state:(int)state recvdata:(NSData *)recvdata;
@end

@interface SocketConnect : NSObject
@property (assign) int socketfd;
@property (assign) BOOL socketFlag;
@property (assign) struct sockaddr_in server_addr;
@property (retain) id<SocketConnectDelegate> delegate;

+(BOOL)isWiFiEnabled;
-(int)initSocket;
-(int)closeSocket;
-(void)sendData:(NSData *)data flag:(BOOL)flag;
-(int)isConnectPrinter;//0打印机已连接 1无有效网络 2有网络但不是打印机
-(int) isConnectP30Printer;
-(NSString *)getWiFiSSID;

@end
