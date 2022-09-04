//
//  JKViewController.m
//  JK_SegmentHH
//
//  Created by 纵昂 on 2022/9/2.
//

#import "JKViewController.h"
//引入创建好的两个页面
#import "TuiJianViewController.h" //推荐
#import "GuanZhuViewController.h" //关注

@interface JKViewController ()<YNPageViewControllerDelegate, YNPageViewControllerDataSource>

@end

@implementation JKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    
}

+ (instancetype)navPageVC {
    YNPageConfigration *configration = [YNPageConfigration defaultConfig];
    configration.pageStyle = YNPageStyleNavigation;
    configration.headerViewCouldScale = YES;
    configration.headerViewScaleMode = YNPageHeaderViewScaleModeTop;
    configration.showTabbar = NO;
    configration.showNavigation = YES;
    configration.scrollMenu = NO;
    configration.aligmentModeCenter = YES;
    configration.lineWidthEqualFontWidth = NO;
    configration.showBottomLine = NO;//是否显示底部线条 NO
    configration.lineHeight = 4; //底部红线高度
    configration.bottomLineHeight = 2;//底部线height 2
    configration.itemFont = [UIFont systemFontOfSize:15];//选项字体 14
    configration.selectedItemFont = [UIFont systemFontOfSize:15]; //选中
    configration.itemMaxScale = 1.3; //缩放系数
    configration.selectedItemColor = [UIColor blackColor];//选项选中color
    configration.itemMargin = 30;//选项之间间隙
    
    JKViewController *vc = [JKViewController pageViewControllerWithControllers:[self getArrayVCs]
                                                              titles:[self getArrayTitles]
                                                              config:configration];
    vc.dataSource = vc;
    vc.delegate = vc;
    
    return vc;
}

+ (NSArray *)getArrayVCs {
    
    TuiJianViewController *secondVC = [[TuiJianViewController alloc] init];
    secondVC.cellTitle = @"推荐";
    
    GuanZhuViewController *thirdVC = [[GuanZhuViewController alloc] init];
    thirdVC.cellTitle = @"关注";
    return @[ secondVC, thirdVC];
}

+ (NSArray *)getArrayTitles {
    return @[@"推荐", @"关注"];
}

#pragma mark - YNPageViewControllerDataSource
//- (UIScrollView *)pageViewController:(YNPageViewController *)pageViewController pageForIndex:(NSInteger)index {
//    TuiJianViewController *baseVC = pageViewController.controllersM[index];
//    return [baseVC tableView];
//}

#pragma mark - YNPageViewControllerDataSource
- (UIScrollView *)pageViewController:(YNPageViewController *)pageViewController pageForIndex:(NSInteger)index {
    UIViewController *vc = pageViewController.controllersM[index];
    if ([vc isKindOfClass:[TuiJianViewController class]]) {
        return [(TuiJianViewController *)vc collectionView];
    } else {
        return [(GuanZhuViewController *)vc addTableView];
    }
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
