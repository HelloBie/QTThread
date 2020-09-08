//
//  QTThred.m
//  QTCoreMain
//
//  Created by MasterBie on 2019/6/10.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import "QTThread.h"

@interface QTThread ()
@property (strong, nonatomic) NSThread *thread;
@end

@implementation QTThread
- (instancetype)init
{
    if (self = [super init]) {
        self.thread = [[NSThread alloc] initWithBlock:^{
            NSLog(@"begin----");
            
            // 创建上下文（要初始化一下结构体）
            CFRunLoopSourceContext context = {0};
            
            // 创建source
            CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
            
            // 往Runloop中添加source
            CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
            
            // 销毁source
            CFRelease(source);
            
            // 启动
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, false);
            
            //            while (weakSelf && !weakSelf.isStopped) {
            //                // 第3个参数：returnAfterSourceHandled，设置为true，代表执行完source后就会退出当前loop
            //                CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, true);
            //            }
            
            NSLog(@"end----");
        }];
        self.thread.name = @"QTThread常驻线程";
        [self.thread start];
    }
    return self;
}


- (void)executeTask:(QTThreadTask)task
{
    if (!self.thread || !task) return;
    
    [self performSelector:@selector(__executeTask:) onThread:self.thread withObject:task waitUntilDone:NO];
}

- (void)stop
{
    if (!self.thread) return;
    
    [self performSelector:@selector(__stop) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)__stop
{
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.thread = nil;
}

- (void)__executeTask:(QTThreadTask)task
{
    task();
}

- (void)dealloc
{
    [self stop];
}
@end
