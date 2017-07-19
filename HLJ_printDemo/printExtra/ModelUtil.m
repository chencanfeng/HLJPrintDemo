//
//  ModelUtil.m
//  testLIB
//
//  Created by LiPing on 15/7/7.
//  Copyright (c) 2015年 com.wewin.print. All rights reserved.
//
#import "ModelUtil.h"
#import "XmlUtil.h"
#import "ZxingObjc.h"


@implementation ModelUtil

#pragma mark 设备标识


+(NSMutableArray *)createBitmap_1001_ModelArray4Ble:(XmlPrintData *)data
{
    NSMutableArray *array=[[NSMutableArray alloc] init];
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0.f ,0.f, 304.f, 200.f)];
    
    UILabel *toplable=[[UILabel alloc] initWithFrame:CGRectMake(60, 0, 244, 84)];
    [toplable setNumberOfLines:0];
    [toplable setLineBreakMode:NSLineBreakByCharWrapping];
    CGFloat fixFont=[self getWrapFontSize:data.textArray[0] Width:244 Height:84 minFontSize:6 maxFontSize:22];
    [toplable setFont:[UIFont systemFontOfSize:fixFont]];
    [toplable setText:data.textArray[0]];
    
    [view addSubview:toplable];
    
    UILabel *label2=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 244, 84)];
    [label2 setNumberOfLines:0];
    [label2 setLineBreakMode:NSLineBreakByCharWrapping];
    fixFont=[self getWrapFontSize:data.textArray[1] Width:244 Height:84 minFontSize:6 maxFontSize:22];
    [label2 setFont:[UIFont systemFontOfSize:fixFont]];
    [label2 setText:data.textArray[1]];
    
    UIImageView *imgv=[[UIImageView alloc] initWithFrame:label2.frame];
    [imgv setImage:[self rotateImage:[self transUI2Image:label2] orient:UIImageOrientationDown]];
    imgv.frame=CGRectMake(16, 200-imgv.frame.size.height, imgv.frame.size.width, imgv.frame.size.height);
    
    [view addSubview:imgv];
    
    
    printData *d = [[printData alloc]init];
    d.type=4;    //1文字 2条形码 3二维码 4图标
    d.newtype = 4;
    d.rotation=3;   //是否旋转 0不旋转 1：90  2：180  3：270
    d.image=[self transUI2Image:view] ;
    d.x=0.f;
    d.y=0.f;
    [array addObject:d];
    
    return array;
}


+(float)getWrapFontSize:(NSString *)text Width:(CGFloat)Width Height:(CGFloat)Height minFontSize:(CGFloat)minFontSize maxFontSize:(CGFloat)maxFontSize{
    
    NSLineBreakMode mode = NSLineBreakByCharWrapping;
    int currentFontSize=minFontSize;
    CGSize maxSize = CGSizeMake(Width, Height);
    NSString *tempstr=[text copy];
//    if ([text rangeOfString:@"接入号："].location!=NSNotFound) {
//        tempstr=[tempstr substringWithRange:NSMakeRange(4, tempstr.length-4)];
//    }
    CGSize requiredSize = [tempstr sizeWithFont:[UIFont systemFontOfSize:currentFontSize] constrainedToSize:CGSizeMake(Width,MAXFLOAT) lineBreakMode:mode];
    if(requiredSize.height<=maxSize.height)//初次化判定
    {
        while (requiredSize.height<=maxSize.height&&requiredSize.width<=maxSize.width&&currentFontSize<=maxFontSize) {
            currentFontSize++;
            requiredSize=[tempstr sizeWithFont:[UIFont systemFontOfSize:currentFontSize] constrainedToSize:CGSizeMake(Width,MAXFLOAT) lineBreakMode:mode];
        }
    }
    currentFontSize--;
    return currentFontSize;
}

#pragma mark 文字转图片自适应
+(UIImage *)getPrintTextImage:(NSString *)text Width:(CGFloat)Width Height:(CGFloat)Height textHeight:(CGFloat)textHeight
{
    NSLineBreakMode mode = NSLineBreakByCharWrapping;
    UIFont *fn = [UIFont systemFontOfSize:textHeight];
    UILabel *textlable = [[UILabel alloc]initWithFrame: CGRectMake(0, 0, Width, Height)];
    [textlable setText:text];
    [textlable setBackgroundColor:[UIColor clearColor]];
    [textlable setFont:fn];
    [textlable setTextColor:[UIColor blackColor]];
    textlable.textAlignment = NSTextAlignmentLeft;
    [textlable setLineBreakMode:mode];
    [textlable setNumberOfLines:0];
    
    //    UIView *contentview=[[UIView alloc] init];
    //    CGFloat ty=0;
    //    if ([text rangeOfString:@"接入号："].location!=NSNotFound) {
    //        UILabel *titlel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 4*(currentFontSize+2), currentFontSize+4)];
    //        titlel.text=@"接入号：";
    //        [titlel setFont:[UIFont systemFontOfSize:26]];
    //        [titlel sizeToFit];
    //        ty=titlel.frame.size.height;
    //        contentview.frame=CGRectMake(0, 0, sizeName.width, textlable.frame.size.height+titlel.frame.size.height-2);
    //        [contentview addSubview:titlel];
    //    }else{
    //        contentview.frame=textlable.frame;
    //    }
    //    textlable.frame=CGRectMake(0, ty, sizeName.width, sizeName.height);
    //    [contentview addSubview:textlable];
    
    UIGraphicsBeginImageContextWithOptions(textlable.frame.size, NO, 0.0);
    [textlable.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *r=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return r;
}
#pragma mark 讲UI控件转化成图片
+(UIImage *)transUI2Image:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *r=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return r;
}
#pragma mark 旋转图片
+(UIImage *)rotateImage:(UIImage *)aImage orient:(UIImageOrientation)orient
{
    CGImageRef imgRef = aImage.CGImage;
    CGFloat width = aImage.size.width;//CGImageGetWidth(imgRef);
    CGFloat height = aImage.size.height;//CGImageGetHeight(imgRef);
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds = CGRectMake(0, 0, width, height);
    CGFloat scaleRatio = 1;
    CGFloat boundHeight;
    switch(orient)
    {
        case UIImageOrientationUp: //EXIF = 1
            transform = CGAffineTransformIdentity;
            break;
        case UIImageOrientationUpMirrored: //EXIF = 2
            transform = CGAffineTransformMakeTranslation(width, 0.0);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            break;
        case UIImageOrientationDown: //EXIF = 3
            transform = CGAffineTransformMakeTranslation(width, height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
        case UIImageOrientationDownMirrored: //EXIF = 4
            transform = CGAffineTransformMakeTranslation(0.0, height);
            transform = CGAffineTransformScale(transform, 1.0, -1.0);
            break;
        case UIImageOrientationLeftMirrored: //EXIF = 5
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(height, width);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
        case UIImageOrientationLeft: //EXIF = 6
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(0.0, width);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
        case UIImageOrientationRightMirrored: //EXIF = 7
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeScale(-1.0, 1.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
        case UIImageOrientationRight: //EXIF = 8
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(height, 0.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
    }
    UIGraphicsBeginImageContext(bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft) {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -height, 0);
    }
    else {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        CGContextTranslateCTM(context, 0, -height);
    }
    CGContextConcatCTM(context, transform);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageCopy;
}

@end
