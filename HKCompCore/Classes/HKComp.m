//
//  HKComp.m
//  HKCollectionView
//
//  Created by HK on 2019/9/20.
//

#import "HKComp.h"

@interface HKComp()

@end

@implementation HKComp
@synthesize compID = _compID;
@synthesize subComps = _subComps;
@synthesize superComp = _superComp;

// 初始化方法
- (instancetype)initWithCompID:(NSString *)compID
{
    self = [super init];
    if (self) {
        _compID = [compID isKindOfClass:[NSString class]] ? compID : nil;
    }
    return self;
}

- (void)addSubComp:(HKComp *)comp
{
    if (!comp || ![comp isKindOfClass:[HKComp class]]) {
        return;
    }
    
    [self addSubComps:@[comp]];
}


- (void)addSubComps:(NSArray <HKComp *> *)comps
{
    if (!comps || ![comps isKindOfClass:[NSArray class]]) {
        return;
    }
    
    NSMutableArray *tempSubComps;
    if (self.subComps) {
        tempSubComps = [[NSMutableArray alloc] initWithArray:self.subComps];
    } else {
        tempSubComps = [[NSMutableArray alloc] init];
    }
    
    for (HKComp *comp in comps) {
        if ([comp isKindOfClass:[HKComp class]]) {
            comp->_superComp = self;
            [tempSubComps addObject:comp];
        }
    }
    
    _subComps = [tempSubComps copy];
}

- (void)removeSubComp:(HKComp *)comp
{
    if (!comp || ![comp isKindOfClass:[HKComp class]]) {
        return;
    }
    
    if (!self.subComps) {
        return;
    }
    
    NSMutableArray *tempSubComps = [[NSMutableArray alloc] initWithArray:self.subComps];
    [tempSubComps removeObject:comp];
    _subComps = [tempSubComps copy];
}


@end
