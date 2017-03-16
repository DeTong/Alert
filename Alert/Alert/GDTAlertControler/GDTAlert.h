//
//  GDTAlert.h
//  Alert
//
//  Created by DeTong on 2017/3/15.
//  Copyright © 2017年 DeTong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GDTAlert : NSObject

typedef void (^GDTClickAlertButton)(NSInteger index, UIAlertController *alertController);

+ (id)share;

- (void)alertStyle:(UIAlertControllerStyle)alertStyle presentViewController:(UIViewController *)presentViewController title:(NSString *)title clickIndex:(GDTClickAlertButton)index message:(NSString *)message buttonTitles:(NSString *)buttonTitles,...;


- (void)alertPresentViewController:(UIViewController *)presentViewController clickIndex:(GDTClickAlertButton)index message:(NSString *)message;
@end
