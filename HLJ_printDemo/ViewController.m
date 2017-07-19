//
//  ViewController.m
//  HLJ_printDemo
//
//  Created by wewin on 2017/7/11.
//  Copyright © 2017年 wewin. All rights reserved.
//

#import "ViewController.h"
#import "Print.h"

@interface ViewController ()
{
    Print *p;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    p=[[Print alloc] init];
    p.view=self.view;
    p.showVp=_parentView;
    p.showimg=_showview;
    UITapGestureRecognizer *nizer=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenshow:)];
    [_parentView addGestureRecognizer:nizer];
    
}

-(void)hiddenshow:(UITapGestureRecognizer *)nizer
{
    _parentView.hidden=YES;
}

- (IBAction)printAction:(id)sender {
    NSString *str=@"<?xml version=\"1.0\" encoding=\"utf-8\" ?><Data><Print><EntityTypeId>1001</EntityTypeId><Code></Code><Text>本端：江北-金色年华农转非安置房A区7栋负一楼车库-POS104-1:16-10MU-01江北-金色年华农转非安置房A区7栋负一楼车库-POS104-1:16-10MU-01江北-金色年华农转非安置房A区7栋负一楼车库-POS104-1:16-10MU-01江北-金色年华农转非安置房A区7栋负一楼车库-POS104-1:16-10MU-01江北-金色年华农转非安置房A区7栋负一楼车库-POS104-1:16-10MU-01江北-金色年华农转非安置房A区7栋负一楼车库-POS104-1:16-10MU-01江北-金色年华农转非安置房A区7栋负一楼车库-POS104-1:16-10MU-01江北-金色年华农转非安置房A区7栋负一楼车库-POS104-1:16-10MU-01江北-金色年华农转非安置房A区7栋负一楼车库-POS104-1:16-10MU-01</Text><Text>地址：洋河19-8人大家象局家属院）光改FT洋河19-8人大家象局家属院）光改FT洋河19-8人大家象局家属院）光改FT洋河19-8人大家象局家属院）光改FT洋河19-8人大家象局家属院）光改FT洋河19-8人大家象局家属院）光改FT洋河19-8人大家象局家属院）光改FT洋河19-8人大家象局家属院）光改FT洋河19-8人大家象局家属院）光改FT洋河19-8人大家象局家属院）光改FT洋河19-8人大家象局家属院）光改FT洋河19-8人大家象局家属院）光改FT</Text></Print></Data>";
    NSLog(@"content : %@",str);
    [p printContent:str printName:@""];
}
- (IBAction)closeAction:(id)sender {
    if (p) {
        [p closePrint];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
