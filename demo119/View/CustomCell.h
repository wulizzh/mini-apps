//
//  CustomCell.h
//  demo119
//
//  Created by xhorse on 2022/1/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LIstItem;

/// 自定义单元格cell
@interface CustomCell : UITableViewCell

-(void)layoutTableViewCellWithItems:(LIstItem *)item;

@end

NS_ASSUME_NONNULL_END
