//
//  ViewController.m
//  QTThread
//
//  Created by MasterBie on 2020/9/8.
//  Copyright © 2020 MasterBie. All rights reserved.
//

#import "ViewController.h"
#import "QTThread.h"
@interface ViewController ()
@property(nonatomic,strong)QTThread *th;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.th = [[QTThread alloc] init];
          [self.th executeTask:^{
              NSLog(@"thread tasl complet1 %@",[NSThread currentThread]);
          }];
          
          [self.th executeTask:^{
              NSLog(@"thread tasl complet2 %@",[NSThread currentThread]);
          }];
}


@end
