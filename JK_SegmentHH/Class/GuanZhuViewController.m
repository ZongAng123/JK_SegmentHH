//
//  GuanZhuViewController.m
//  JK_SegmentHH
//
//  Created by 纵昂 on 2022/9/2.
//

#import "GuanZhuViewController.h"

@interface GuanZhuViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UIView * haedView;

@end

@implementation GuanZhuViewController
static NSString * const reuseIdentifier = @"GeneralGoodsCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
  
    [self initHH];
    
   
    
}

#pragma mark - 初始化
-(void)initHH{
    
    _haedView =[UIView new];
        [self.view addSubview:_haedView];
        _haedView.backgroundColor =[UIColor redColor];
        [_haedView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(kSCREEN_WIDTH);
            make.height.mas_equalTo(150);
        }];
    
    self.addTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
     self.addTableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
     self.addTableView.delegate = self;
     self.addTableView.dataSource = self;
     self.addTableView.showsVerticalScrollIndicator = NO;
     self.addTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
     self.addTableView.tableHeaderView = _haedView;//添加头部view
//  添加头部视图无效，找的第三方 ----------
//     [self.addTableView setTableHeaderView:_haedView pullToZoomInEnabled:YES];
     [self.view addSubview:self.addTableView];
     [self.addTableView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.mas_equalTo(0);
 //       make.top.equalTo(_haedView.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(kSCREEN_WIDTH, kSCREEN_HEIGHT-200));
    }];
      
    
    
     
      
    
}


#pragma mark - UITableView section
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}
#pragma mark RowsInSection
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    static NSString *cellIdentifier=@"ZAHomeAddreeTableCell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
//  cell自带下划线
    self.addTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    cell.backgroundColor =[UIColor yellowColor];
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
    
}

//动态获取cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  50;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
