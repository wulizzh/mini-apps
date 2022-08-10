//
//  LIstItem.m
//  demo119
//
//  Created by xhorse on 2022/1/19.
//

#import "LIstItem.h"

@implementation LIstItem

- (void)configWithDictionary:(NSDictionary *)dictionary {


    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.pic= [dictionary objectForKey:@"thumbnail_pic_s"];
}


@end


