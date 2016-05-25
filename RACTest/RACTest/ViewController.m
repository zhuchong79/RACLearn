//
//  ViewController.m
//  RACTest
//
//  Created by hxl on 16/4/15.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "ViewModeDemo.h"


@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *text1;
@property (strong, nonatomic) IBOutlet UITextField *text2;

@property (strong, nonatomic) IBOutlet UITextField *result;
@property (strong, nonatomic) IBOutlet UIButton *btn1;

@property (strong, nonatomic) NSString * strsd;
@end

@implementation ViewController
@synthesize btn=_btn;
@synthesize text1=_text1;
@synthesize text2=_text2;
- (void)viewDidLoad {
    [super viewDidLoad];
    UIFont *font =[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    NSNumber *fontsize = [font.fontDescriptor objectForKey:@"NSFontSizeAttribute"];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0,50,fontsize.intValue, fontsize.intValue)];
    lable.text=@"12";
    lable.textAlignment=NSTextAlignmentCenter;
    [lable.layer setMasksToBounds:YES];
    [lable.layer setCornerRadius:fontsize.intValue/2];
    [lable setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:lable];
    

    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(0,80,500, 500)];
    
    
    // Do any additional setup after loading the view, typically from a nib.
   /* [[self.mytext rac_signalForControlEvents:UIControlEventEditingChanged] subscribeNext:^(id x){
       // UITextField *tt=x;
        
       // NSLog(@"%@",tt.text);
         NSLog(@"%@",x);
    }];
    [[self.btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x){
        NSLog(@"dafadf");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"RAC" message:@"RAC TEST" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"other", nil];
        [[[self rac_signalForSelector:@selector(alertView:clickedButtonAtIndex:) fromProtocol:@protocol(UIAlertViewDelegate)] subscribeNext:^(RACTuple *tuple) {
            NSLog(@"%@",tuple.first);
            NSLog(@"%@",tuple.second);
            NSLog(@"%@",tuple.third);
        }] ];
        [alertView show];
    }
     ];
    @weakify(self);
    [RACObserve(self, text1) subscribeNext:^(NSString*x)
     {
         @strongify(self);
         self.text2.text=x;
         NSLog(@"%@",x);
     }];
    */
    //RAC(self.text2, text) = self.text1.rac_textSignal;
    //RAC(self.text2, text,@"收到nil时就显示我") = self.text1.rac_textSignal;
   // RAC(self.outputLabel, text, @"收到nil时就显示我") = self.inputTextField.rac_textSignal;
    //RAC(self.result,text) = (self.text1.rac_textSignal+self.text2.rac_textSignal);
  
    /*
    @weakify(self);
    self.btn.rac_command = [[RACCommand alloc] initWithEnabled:
                                    [RACSignal combineLatest:@[RACObserve(self.text1, text),
                                                               self.text1.rac_textSignal,
                                                               self.text2.rac_textSignal]
                                                      reduce:^id(id x){
                                                          @strongify(self);
                                                          return @(self.text1.text.length > 4 && self.text2.text.length > 5);
                                                      }]
                                                           signalBlock:^RACSignal *(id input) {
                                                               @strongify(self);
                                                               
                                                               [self.text1 resignFirstResponder];
                                                              // [self tradeLoginWithAccount:self.tradeAccountField.text andPassword:self.tradePasswordField.text];
                                                               
                                                               return [RACSignal empty];
                                                           }];

*/
    
    //self.btn.rac_command =
    
    [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@(15)];
        [subscriber sendNext:@(16)];
        [subscriber sendNext:@(17)];
        [subscriber sendNext:@(18)];
        [subscriber sendNext:@(19)];
        [subscriber sendNext:@(20)];
        [subscriber sendNext:@(21)];
        return [RACDisposable alloc];
    }]
      filter:^BOOL(NSNumber*value) {
        return value.intValue >=18;
    }]
    subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    __block int i=0;
    @weakify(self);
    
    [RACObserve(self,strsd).distinctUntilChanged subscribeNext:^(NSString* x) {
        //[self.btn1.titleLabel.text x];
        @strongify(self);
        //[self.btn1 setTitle:x forState:UIControlStateNormal];
        [self.btn1 setEnabled:NO];
        self.btn1.titleLabel.text = x;
        [self.btn1 setTitle:x forState:UIControlStateDisabled];
    }];
    

    RACSignal *sig1 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"1"];
        [subscriber sendNext:@"2"];
        [subscriber sendNext:@"3"];
        return  nil;
    }];
    RACSignal *sig2 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"4"];
        [subscriber sendNext:@"5"];
        [subscriber sendNext:@"6"];
        return nil;
    }];
    RACSignal *sig3 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"7"];
        [subscriber sendNext:@"8"];
        [subscriber sendNext:@"9"];
        return nil;
    }];
    RACSignal *sig4 = [[RACSignal combineLatest:@[sig1,sig2,sig3]]
                                                            subscribeNext:^(id x) {
        __block NSInteger sum=0;
        for(NSString* s in x)
        {
            sum+=s.intValue;
        }
        NSLog(@"%d",(int)sum);
    }];
    
    
    RACSignal *sig5 = [[RACSignal combineLatest:@[sig1,sig2] reduce:^id(NSString*str1,NSString *str2){
        return [str1 stringByAppendingString:str2];
    }]
                       subscribeNext:^(id x) {
                           
                           NSLog(@"%@",x);
                       }];
    
    
    [[[RACSignal createSignal:^RACDisposable *(id subscriber) {
        [[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(id x) {
            [subscriber sendNext:@"直到世界的尽头才能把我们分开"];
        }];
        return nil;
    }] takeUntil:[RACSignal createSignal:^RACDisposable *(id subscriber) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"世界的尽头到了");
            [subscriber sendNext:@"世界的尽头到了"];
        });
        return nil;
    }]] subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
    
    
    RAC()
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addNavBar
{
    CGRect rect = [[UIScreen mainScreen]bounds];
    UINavigationController *navCtr = [[UINavigationController alloc]initWithRootViewController:self];
    UINavigationBar *navBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0,0,rect.size.width, 44)];
    UINavigationItem *item1 = [[UINavigationItem alloc]initWithTitle:@"向左"];
    [navCtr pushViewController:item1 animated:YES];
    
    UINavigationItem *item2 = [[UINavigationItem alloc]initWithTitle:@"向右"];
    [navCtr pushViewController:item2 animated:YES];
    
    [self.view addSubview:navBar];
}
@end
