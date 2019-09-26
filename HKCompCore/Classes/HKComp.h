//
//  HKComp.h
//  HKCollectionView
//
//  Created by HK on 2019/9/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// Comp 类型
typedef NSString * HKCompType;


@interface HKComp : NSObject

// 组件ID （通常为UUID）
@property (copy, nonatomic, readonly) NSString *compID;

// 父组件
@property (weak, nullable, nonatomic, readonly) HKComp *superComp;

// 组件类型
@property (nonatomic, readonly) HKCompType compType;

// 子组件列表
@property (copy, nonatomic, readonly) NSArray <HKComp *> *subComps;


// 初始化方法
- (instancetype)initWithCompID:(NSString *)compID;

- (void)addSubComp:(HKComp *)comp;
- (void)addSubComps:(NSArray <HKComp *> *)comps;
- (void)removeSubComp:(HKComp *)comp;


@end

NS_ASSUME_NONNULL_END
