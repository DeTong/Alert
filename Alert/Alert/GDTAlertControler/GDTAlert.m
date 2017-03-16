//
//  GDTAlert.m
//  Alert
//
//  Created by DeTong on 2017/3/15.
//  Copyright © 2017年 DeTong. All rights reserved.
//

#import "GDTAlert.h"

@interface GDTAlert ()

@property (copy, nonatomic) GDTClickAlertButton alertButton;

@end

static GDTAlert * alertInstance = nil;

@implementation GDTAlert

+ (id)share
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertInstance = [[GDTAlert alloc] init];
    });
    return alertInstance;
}

- (void)alertPresentViewController:(UIViewController *)presentViewController message:(NSString *)message
{
    [self alertStyle:UIAlertControllerStyleAlert presentViewController:presentViewController title:@"提示" clickIndex:nil message:message buttonTitles:nil];
}

- (void)alertPresentViewController:(UIViewController *)presentViewController clickIndex:(GDTClickAlertButton)index message:(NSString *)message
{
    [self alertStyle:UIAlertControllerStyleAlert presentViewController:presentViewController title:@"提示" clickIndex:index message:message buttonTitles:nil];
}

- (void)alertStyle:(UIAlertControllerStyle)alertStyle presentViewController:(UIViewController *)presentViewController title:(NSString *)title clickIndex:(GDTClickAlertButton)index message:(NSString *)message buttonTitles:(NSString *)buttonTitles,...
{
    //    NSLog(@"%@",@[buttonTitle]);return;
    self.alertButton = index;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertStyle];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (self.alertButton) {
            self.alertButton(0 , alertController);
        }
    }]];
    
    //  利用va_list处理长参数
    va_list args;
    //    NSLog(@"%@",buttonTitles);
    if (buttonTitles) {
        
        [alertController addAction:[UIAlertAction actionWithTitle:buttonTitles style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (self.alertButton) {
                self.alertButton(1 , alertController);
            }
            
        }]];
        
        va_start(args, buttonTitles);
        NSString *titleString = va_arg(args, NSString *);
        int i = 1;
        while (titleString) {
            //            NSLog(@"%@",titleString);
            i++;
            [alertController addAction:[UIAlertAction actionWithTitle:titleString style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (self.alertButton) {
                    self.alertButton(i , alertController);
                }
                
            }]];
            //  根据指针偏移获取下一个目标
            titleString = va_arg(args, NSString *);
            
        }
        va_end(args);
    }
    
    [presentViewController presentViewController:alertController animated:YES completion:nil];
    
}



@end
