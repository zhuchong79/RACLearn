//
//  main.m
//  RACLearn
//
//  Created by hxl on 16/4/22.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveCocoa/ReactiveCocoa.h"
void map(NSString *text) //映射，将字符串映射为其长度
{
    [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:text];
        return nil;
    }]
    map:^id(NSString* text) {
        return @(text.length);
    }]
    subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}
void fliter() //过滤
{
    [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@(15)];
        [subscriber sendNext:@(16)];
        [subscriber sendNext:@(17)];
        [subscriber sendNext:@(18)];
        [subscriber sendNext:@(19)];
        [subscriber sendError:nil];
        [subscriber sendNext:@(20)];
        [subscriber sendNext:@(21)];
        return [RACDisposable alloc];
    }]
      filter:^BOOL(NSNumber*value) {
          return value.intValue >=18;
      }]
     subscribeNext:^(id x) {
         NSLog(@"%@",x);
     }
    error:^(NSError *error) {
          NSLog(@"error");
    }];
     
    
}
void cmd()
{
RACCommand *cmd= [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"dsaffaf");
        [subscriber sendCompleted];
        return nil;
    }] ;
}];
    [cmd execute:nil];
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //fliter();
        //map(@"123");
        cmd();

    }
    return 0;
}
