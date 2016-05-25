//
//  ViewModeDemo.m
//  RACTest
//
//  Created by hxl on 16/5/4.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "ViewModeDemo.h"

@implementation ViewModeDemo
//@property()
-(id)init
{
    self = [super init];
    if (self) {
        [self initCommand];
    }
    return self;
}
-(void)initCommand
{
    RACSignal *signal1= [RACObserve(self, str1) map:^id(id value) {
        return nil;
    }];
    
    RACSignal *sig2 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"zcxv"];
        return nil;
    }];
    RAC(self,str3)=[RACSignal combineLatest:@[RAC(self,str1),RAC(self,str2)]]]
    //RAC(self,str3)=RACObserve(self, str1)
}
@end
