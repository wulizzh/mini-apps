//
//  TableViewController.m
//  demo119
//
//  Created by xhorse on 2022/1/21.
//

#import "TableViewController.h"
#import "ListLoader.h"
#import "CustomCell.h"
#import "LIstItem.h"
#import "MJRefresh.h"
#import "SDAutoLayout.h"

@interface TableViewController ()

@property (nonatomic,strong,readwrite)ListLoader *listLoader;
@property (nonatomic,strong,readwrite)NSArray *dataArray;
@property (nonatomic,readwrite)int pageNumber;
@property (nonatomic,readwrite)int page_sizeNumber;


@end

@implementation TableViewController

- (void)viewDidLoad {
    self.pageNumber=1;
    self.page_sizeNumber=10;
    
    [super viewDidLoad];

    self.navigationItem.title=@"新闻列表";
    //[self.tableView registerClass:[CustomCell class] forCellReuseIdentifier:NSStringFromClass([CustomCell class])];
    self.tableView= [[UITableView alloc] initWithFrame:self.view.bounds];
    //[self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    

    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData:)];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore:)];
    //左滑回到前一页
    UISwipeGestureRecognizer *swipleft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipright:)];
    swipleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.tableView addGestureRecognizer:swipleft];
    //右滑去往下一页
    UISwipeGestureRecognizer *swipright = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipleft:)];
    swipright.direction=UISwipeGestureRecognizerDirectionRight;
    [self.tableView addGestureRecognizer:swipright];
    
    //[self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:NSNotFound inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
   


}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
      return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell layoutTableViewCellWithItems:[self.dataArray objectAtIndex: indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:[UIScreen mainScreen].bounds.size.width];
   
    /**
     1. 屏幕适配机型
      2. 国际语言适配（app name， ...）
      3. 代码命名规范
     */
}

//加载新列表
-(void)loadNewData: (id)sender{
    ListLoader *listLoadernew=[[ListLoader alloc] init];
    [listLoadernew LoadListDataWithFinshBlock:^(BOOL success, NSArray<LIstItem *> * _Nonnull dataArray){
        self.dataArray = dataArray;
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } withpageNumber:1 withpage_size:self.page_sizeNumber];
}

//加载更多
-(void)loadMore:(id)sender{
    self.page_sizeNumber+=10;
    if(self.page_sizeNumber<=30){
    ListLoader *listLoadernew=[[ListLoader alloc] init];
    [listLoadernew LoadListDataWithFinshBlock:^(BOOL success, NSArray<LIstItem *> * _Nonnull dataArray){
        self.dataArray = dataArray;
        [self.tableView reloadData];
        } withpageNumber:self.pageNumber withpage_size:self.page_sizeNumber];
    }
    [self.tableView.mj_footer endRefreshing];
}

-(void)swipright: (id)sender{
    self.pageNumber++;
    ListLoader *listLoadernew=[[ListLoader alloc] init];
    [listLoadernew LoadListDataWithFinshBlock:^(BOOL success, NSArray<LIstItem *> * _Nonnull dataArray){
        self.dataArray = dataArray;
        [self.tableView reloadData];
    } withpageNumber:self.pageNumber withpage_size:self.page_sizeNumber];
}


-(void)swipleft: (id)sender{
    if(self.pageNumber>1){
       self.pageNumber--;
       ListLoader *listLoadernew=[[ListLoader alloc] init];
       [listLoadernew LoadListDataWithFinshBlock:^(BOOL success, NSArray<LIstItem *> * _Nonnull dataArray){
           self.dataArray = dataArray;
           [self.tableView reloadData];
       } withpageNumber:self.pageNumber withpage_size:self.page_sizeNumber];
    }
}
//解决手势冲突问题
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (gestureRecognizer.state != 0) {
        return YES;
    } else {
        return NO;
    }
}
@end
