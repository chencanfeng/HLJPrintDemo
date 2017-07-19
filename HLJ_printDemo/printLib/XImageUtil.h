//
//  XImageUtil.h
//  wewinprint
//
//  Created by 欧海川 on 16/7/15.
//  Copyright © 2016年 com.wewin.print. All rights reserved.
//

@interface XImageUtil : NSObject

+(UIImage *)qrImageForString:(NSString *)content imageSize:(int)size;
+(UIImage *)transformWidth:(UIImage*) image width:(CGFloat)width height:(CGFloat)height;
+(UIImage *)getGrayImage:(UIImage *)image;
+(UIImage *)rotateImage:(UIImage *)aImage orient:(UIImageOrientation)orient;
+(NSMutableArray *)cropPingImage:(UIImage *)imageToCrop;
+(UIImage *)getPrintTextImage:(NSString *)text fontName:(NSString *)fontname Width:(CGFloat)Width textHeight:(CGFloat)textHeight;
+(UIImage *)getBarCodeImage:(NSString *)text width:(CGFloat)width height:(CGFloat)height;
+(NSData *)getPrintData:(UIImage *)image;

+ (UIImage *)doBinarize:(UIImage *)sourceImage;

+ (unsigned char*) getPixelData:(UIImage *)image;
+ (BOOL)getBoolAtLocation:(CGPoint)point data:(unsigned char*)data image:(UIImage *)image;
+ (CGContextRef) createARGBBitmapContextFromImage:(CGImageRef) inImage;
@end
