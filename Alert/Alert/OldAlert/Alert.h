//
//  Alert.h
//  woaoappios
//
//  Created by jianghui yin on 14-10-27.
//  Copyright (c) 2014年 16816. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^ClickAlertButton)(NSInteger index, UIAlertView * alertView);

@interface Alert : NSObject

+ (id)share;

- (void)message:(NSString *)message clickIndex:(ClickAlertButton)index buttonTitles:(NSString *)titles,...;
- (void)message:(NSString *)message clickIndex:(ClickAlertButton)index leftButtonTitle:(NSString *)title buttonTitles:(NSString *)titles,...;

@end
