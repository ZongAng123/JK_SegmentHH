//
//  PageView.m
//  JK_SegmentHH
//
//  Created by 纵昂 on 2022/9/3.
//

#import "PageView.h"
#import "YNPageScrollMenuView.h"
#import "YNPageConfigration.h"
#import "UIView+YNPageExtend.h"

#import "JXViewController.h" //精选
#import "JLSTViewController.h"//教练社团
#import "XQViewController.h" //兴趣社团

@interface PageView ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIButton *hhhBtn; //图标
@property (nonatomic, strong) UILabel *titleL; //标题
@property (nonatomic, strong) UILabel *decrcL; //多少人加入

@end

@implementation PageView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {

        [self initHJK];
    }
    return self;
}

#pragma mark -初始化布局
-(void)initHJK{
    
    _scrollView = [UIScrollView new];
    _scrollView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(200);
    }];
    
    YNPageConfigration *sixthConfigStyle = [YNPageConfigration defaultConfig];
    sixthConfigStyle.scrollMenu = YES;
    sixthConfigStyle.aligmentModeCenter = NO;
    sixthConfigStyle.bottomLineHeight = 1;
    sixthConfigStyle.bottomLineBgColor = [UIColor whiteColor];
    sixthConfigStyle.showBottomLine = YES;
    YNPageScrollMenuView *sixthStyle = [YNPageScrollMenuView pagescrollMenuViewWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 44) titles:@[@"精选", @"教练社团", @"兴趣社团"].mutableCopy configration:sixthConfigStyle delegate:nil currentIndex:1];
    sixthStyle.layer.cornerRadius = 16;
    [_scrollView addSubview:sixthStyle];
    
    
    self.hhhBtn =[UIButton new];
    [self.hhhBtn setBackgroundColor:[UIColor yellowColor]];
    [_scrollView addSubview:self.hhhBtn];
    [self.hhhBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(sixthStyle.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(80);
        make.width.mas_equalTo(80);
    }];
    
    self.titleL =[UILabel new];
    self.titleL.text =@"每天都要哦气";
    self.titleL.textColor =[UIColor blackColor];
    self.titleL.font =[UIFont systemFontOfSize:16];
    self.titleL.numberOfLines = 0;
    [_scrollView addSubview:self.titleL];
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.hhhBtn.mas_bottom).offset(5);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(80);
    }];
    
    
    self.decrcL =[UILabel new];
    self.decrcL.text =@"279人已加入";
    self.decrcL.font =[UIFont systemFontOfSize:13];
    self.decrcL.textColor =[UIColor darkGrayColor];
    [_scrollView addSubview:self.decrcL];
    [self.decrcL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleL.mas_bottom).offset(0);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(80);
    }];
    
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
