//
//  ViewModeDemo.h
//  RACTest
//
//  Created by hxl on 16/5/4.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface ViewModeDemo : NSObject

@property(nonatomic)NSString*str1;
@property(nonatomic)NSString*str2;
@property(nonatomic)NSString*str3;
-(id)init;
-(void)bindViewMode;
@end
