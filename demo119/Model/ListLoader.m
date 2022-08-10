//
//  ListLoader.m
//  demo119
//
//  Created by xhorse on 2022/1/19.
//

#import "ListLoader.h"
#import <AFNetworking.h>
#import "LIstItem.h"

@implementation ListLoader

- (void)LoadListDataWithFinshBlock:(ListLoaderFinishBlock)finishBlock withpageNumber:(int)pageNumber withpage_size:(int )page_sizeNumber{ 
    
    NSDictionary *params = @{
        @"key" : @"d33bd79604e16e0730b1ed55629e9fce",
        @"type" : @"top",
        @"page" : @(pageNumber),
        @"page_size" : @(page_sizeNumber),
            
    };
    
    [[AFHTTPSessionManager manager] GET:@"http://v.juhe.cn/toutiao/index" parameters:params headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *dataArray =  [((NSDictionary *)[(responseObject) objectForKey:@"result"]) objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        for (NSDictionary *info in dataArray) {
            LIstItem *listItem = [[LIstItem alloc] init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        if (finishBlock) {
            finishBlock(YES,listItemArray.copy);
        };
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
@end
