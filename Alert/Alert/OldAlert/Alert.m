//
//  Alert.m
//  woaoappios
//
//  Created by jianghui yin on 14-10-27.
//  Copyright (c) 2014年 16816. All rights reserved.
//

#import "Alert.h"

@interface Alert() <UIAlertViewDelegate>

@property (copy, nonatomic) ClickAlertButton  alertButton;

@end

static Alert * alertInstance = nil;

@implementation Alert

+ (id)share
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertInstance = [[Alert alloc] init];
    });
    return alertInstance;
}

- (void)message:(NSString *)message clickIndex:(ClickAlertButton)index buttonTitles:(NSString *)titles,...
{
    [self message:message clickIndex:index leftButtonTitle:@"确定" buttonTitles:titles];
}

- (void)message:(NSString *)message clickIndex:(ClickAlertButton)index leftButtonTitle:(NSString *)title buttonTitles:(NSString *)titles,...
{
    self.alertButton = index;
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:title otherButtonTitles:titles, nil];
    alert.delegate = self;
    [alert show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.alertButton) {
        self.alertButton(buttonIndex, alertView);
    }
}
- (void)alertViewCancel:(UIAlertView *)alertView
{
    
}

@end
