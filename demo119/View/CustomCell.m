//
//  CustomCell.m
//  demo119
//
//  Created by xhorse on 2022/1/19.
//
#import "UIView+SDAutoLayout.h"
#import "CustomCell.h"
#import "SDAutoLayout.h"
#import "LIstItem.h"
#import<SDWebImage/UIImageView+WebCache.h>

@interface CustomCell ()

@property(nonatomic,strong,readwrite)UILabel *authorname;
@property(nonatomic,strong,readwrite)UILabel *title;
@property(nonatomic,strong,readwrite)UILabel *date;
@property(nonatomic,strong,readwrite)UIImageView *profilepicture;
@property(nonatomic,strong,readwrite)UILabel *content;
@property(nonatomic,strong,readwrite)UILabel *designation;
@property(nonatomic,strong,readwrite)UIImageView *ls;

@end

@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.profilepicture =[UIImageView new];
        self.profilepicture.image=[UIImage imageNamed:@"people"];
        
        self.ls =[UIImageView new];
        
        self.authorname=[UILabel new];

                
        self.title=[UILabel new];
        self.title.font=[UIFont systemFontOfSize:25];
        
        self.designation=[UILabel new];
        self.designation.text=@"知名博主";
        self.designation.font=[UIFont systemFontOfSize:12];
        
        self.date=[UILabel new];
        self.date.textAlignment=NSTextAlignmentRight;
        
        self.content=[[UILabel alloc] init];
        
    }
    return self;
}
-(void)layoutTableViewCellWithItems:(LIstItem *)item{
    
    self.authorname.text = item.authorName;
     
    self.title.text = item.title;
    
    self.date.text = item.date;
    
    self.content.text = @"这是一段文字，这是一段文字，这是一段文字，这是一段文字，这是一段文字，这是一段文字，这是一段文字，这是一段文字，这是一段文字，这是一段文字，这是一段文字。\n这是一段文字，这是一段文字，这是一段文字，这是一段文字，这是一段文字，这是一段文字，这是一段文字，这是一段文字，这是一段文字，这是一段文字，这是一段文字。";

    [self.ls sd_setImageWithURL:[NSURL URLWithString:item.pic]
               placeholderImage:[UIImage imageNamed:@"people"]];
    
    [self.contentView sd_addSubviews:@[self.authorname,self.title,self.content,self.profilepicture,self.designation,self.date,self.ls]];
    
    //self.profilepicture.sd_cornerRadiusFromWidthRatio = (NSInteger *)((int)(self.profilepicture.width*0.5));
    
    self.profilepicture.sd_layout
    .topSpaceToView(self.contentView, 5)
    .leftSpaceToView(self.contentView, 5)
    .heightIs(60)
    .widthIs(60);
    
    self.date.sd_layout
    .topSpaceToView(self.contentView, 5)
    .rightSpaceToView(self.contentView, 5)
    .widthRatioToView(self.contentView, 1)
    .autoHeightRatio(0);

    
    self.authorname.sd_layout
    .topSpaceToView(self.contentView, 5)
    .leftSpaceToView(self.profilepicture, 5)
    .widthRatioToView(self.contentView, 0.2)
    .heightIs(20);
    
    self.designation.sd_layout
    .topSpaceToView(self.authorname, 20)
    .leftSpaceToView(self.profilepicture, 5)
    .widthRatioToView(self.contentView, 0.2)
    .heightIs(20);
    
    self.title.sd_layout
    .topSpaceToView(self.profilepicture, 5)
    .leftSpaceToView(self.contentView, 0)
    .widthRatioToView(self.contentView, 1)
    .autoHeightRatio(0);
    
    self.content.sd_layout
    .topSpaceToView(self.title, 0)
    .leftSpaceToView(self.contentView,10)
    .rightSpaceToView(self.contentView, 5)
    .autoHeightRatio(0);
     
    self.ls.sd_layout
    .topSpaceToView(self.content, 5)
    .leftSpaceToView(self.contentView,10)
    .widthIs(150)
    .heightIs(150);
    
    [self setupAutoHeightWithBottomViewsArray:@[_content, _ls,_title] bottomMargin:10];
}

@end
