//
//  TuiJianViewController.m
//  JK_SegmentHH
//
//  Created by 纵昂 on 2022/9/2.
//

#import "TuiJianViewController.h"
#import "PageView.h"
#import "BottomView.h"

@interface TuiJianViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,SDCycleScrollViewDelegate>
{
    NSArray *_imagesURLStrings;
    SDCycleScrollView *_customCellScrollViewDemo;
}
@property (nonatomic, strong) UIView * headVC; //定义头部view
@property (nonatomic, strong)SDCycleScrollView * cycleScrollView3;
@property (nonatomic, strong) UIView * lunboVC;
@property (nonatomic, strong) PageView * pageV; //精选、教练社团、兴趣社团
@property (nonatomic, strong) BottomView * bottomV;//话题


@end

@implementation TuiJianViewController
static NSString * const reuseIdentifier = @"GeneralGoodsCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB_GGCOLOR(248, 246, 249);
  
#pragma mark - 采用网络图片实现
    _imagesURLStrings = @[
                           @"hggsd",
                           @"hjkhhj",
                           @"onejj"
                           ];
    
    [self initHH];
    
}

#pragma mark - 初始化
-(void)initHH{
    
       _headVC =[UIView new];
       [self.view addSubview:_headVC];
       _headVC.backgroundColor = RGB_GGCOLOR(248, 246, 249); //取色器驱颜色值
       [_headVC mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.mas_equalTo(0);
           make.left.mas_equalTo(0);
           make.width.mas_equalTo(kSCREEN_WIDTH);
           make.height.mas_equalTo(500);
       }];

#pragma mark - 初始化 瀑布流
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.headerReferenceSize = CGSizeMake(kSCREEN_WIDTH, 500);//头部大小
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, kSCREEN_HEIGHT) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
}


#pragma mark -  collectionView代理方法
//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
    
}
//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
    
}

#pragma mark 每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor=[UIColor redColor];
    cell.layer.cornerRadius = 15;
    return cell;
}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(180, 250);
    
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 10, 10, 20);

}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
   
    return 10;
    
}

#pragma mark - 头部显示的内容
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:
                                            UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
    
    [headerView addSubview:_headVC];//头部广告栏
    
    _lunboVC =[UIView new];
    [_headVC addSubview:_lunboVC];
    _lunboVC.backgroundColor =[UIColor whiteColor];
    _lunboVC.layer.cornerRadius = 16;
    [self addShadowToView:_lunboVC withColor:RGB_GGCOLOR(245, 245, 245)];
    [_lunboVC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(120);
    }];
#pragma mark - 轮播图
    self.cycleScrollView3 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH-20, 120) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.cycleScrollView3.layer.cornerRadius = 16;
//    self.cycleScrollView3.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
//    self.cycleScrollView3.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    self.cycleScrollView3.imageURLStringsGroup = _imagesURLStrings;
    [_lunboVC addSubview:self.cycleScrollView3];
    
    
    _pageV = [PageView new];
    [_headVC addSubview:_pageV];
    _pageV.backgroundColor =[UIColor whiteColor];
    _pageV.layer.cornerRadius = 16;
    [self addShadowToView:_pageV withColor:RGB_GGCOLOR(245, 245, 245)];
    [_pageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_lunboVC.mas_bottom).offset(10);
        make.left.mas_equalTo(7);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(200);
    }];
    
    _bottomV = [BottomView new];
    [_headVC addSubview:_bottomV];
    _bottomV.backgroundColor =[UIColor whiteColor];
    _bottomV.layer.cornerRadius = 16;
#pragma mark - 添加阴影
    [self addShadowToView:_bottomV withColor:RGB_GGCOLOR(245, 245, 245)];
    [_bottomV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_pageV.mas_bottom).offset(10);
        make.left.mas_equalTo(7);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(138);
    }];
    
    
    return headerView;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

#pragma mark UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"奥利给++++++++++");
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"---点击了第%ld张图片", (long)index);
    [self.navigationController pushViewController:[NSClassFromString(@"DemoVCWithXib") new] animated:YES];
}




#pragma mark -  产品在一个新项目里沿用了白色背景，因此很多地方被迫需要用阴影，不用阴影的话，边界看不见。
- (void)addShadowToView:(UIView *)theView withColor:(UIColor *)theColor {
    // 阴影颜色
    theView.layer.shadowColor = theColor.CGColor;
    // 阴影偏移，默认(0, -3)
    theView.layer.shadowOffset = CGSizeMake(0,0);
    // 阴影透明度，默认0
    theView.layer.shadowOpacity = 0.5;
    // 阴影半径，默认3
    theView.layer.shadowRadius = 5;
    
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
