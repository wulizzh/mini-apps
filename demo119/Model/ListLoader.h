//
//  ListLoader.h
//  demo119
//
//  Created by xhorse on 2022/1/19.
//

#import <Foundation/Foundation.h>

@class  LIstItem;
NS_ASSUME_NONNULL_BEGIN

typedef void(^ListLoaderFinishBlock)(BOOL success, NSArray<LIstItem *> *dataArray);


/// 列表请求及获取数据
@interface ListLoader : NSObject

- (void)LoadListDataWithFinshBlock:(ListLoaderFinishBlock)finishBlock withpageNumber:(int) pageNumber withpage_size:(int )page_sizeNumber;

@end

NS_ASSUME_NONNULL_END
