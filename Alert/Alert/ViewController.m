//
//  ViewController.m
//  Alert
//
//  Created by DeTong on 2017/3/10.
//  Copyright © 2017年 DeTong. All rights reserved.
//
//  今天才知道。。。原先的alertview在iOS 9 之后被废弃了。。。尴尬。

#import "ViewController.h"
#import "Alert.h"
#import "GDTAlert.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *showIOS9Alert;
@property (weak, nonatomic) IBOutlet UIButton *showOldAlert;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)clickIOS9Alert:(id)sender {

    /*
     UIAlertController 的样式
    UIAlertControllerStyleActionSheet = 0,
    UIAlertControllerStyleAlert
    */
    /*
     UIAlertController 按钮的样式
     typedef NS_ENUM(NSInteger, UIAlertActionStyle) {
     UIAlertActionStyleDefault = 0,
     UIAlertActionStyleCancel,
     UIAlertActionStyleDestructive
     } NS_ENUM_AVAILABLE_IOS(8_0);
     */
    
    //  尝试封装的效果
//    [self alertStyle:UIAlertControllerStyleAlert title:@"提示" message:@"您现在余额不足" buttonTitles:@"3", nil];
    [[GDTAlert share] alertStyle:UIAlertControllerStyleActionSheet presentViewController:self title:@"提示" clickIndex:^(NSInteger index, UIAlertController *alertController) {
        NSLog(@"哎哟，好像不错哦 %ld",index);
    } message:@"你好" buttonTitles:@"4444",nil];
    
//    [[GDTAlert share] alertPresentViewController:self clickIndex:nil message:@"余额不足"];
}

- (IBAction)clickOldAlert:(id)sender {
    [[Alert share] message:@"Hello" clickIndex:nil buttonTitles:@"确3定",@"确1定",@"确2定"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
