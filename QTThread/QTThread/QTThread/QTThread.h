//
//  QTThred.h
//  QTCoreMain
//
//  Created by MasterBie on 2019/6/10.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^QTThreadTask)(void);
@interface QTThread : NSObject
/**
 在当前子线程执行一个任务
 */
- (void)executeTask:(QTThreadTask)task;

/**
 结束线程
 */
- (void)stop;

@end

NS_ASSUME_NONNULL_END
