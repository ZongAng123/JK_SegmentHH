//
//  BottomView.m
//  JK_SegmentHH
//
//  Created by 纵昂 on 2022/9/3.
//

#import "BottomView.h"

@implementation BottomView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {

        [self initHJK];
    }
    return self;
}

-(void)initHJK{
/*=================左侧=================================================================*/
#pragma mark - 顶部标题
    self.jingImg =[UIImageView new];
    self.jingImg.image =[UIImage imageNamed:@"lekesport"];
    [self addSubview:self.jingImg];
    [_jingImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
    self.titleBT =[UILabel new];
    self.titleBT.text =@"正在热议";
    self.titleBT.textColor =[UIColor darkGrayColor];
    self.titleBT.font =[UIFont systemFontOfSize:16];
    self.titleBT.numberOfLines = 0;
    [self addSubview:self.titleBT];
    [self.titleBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(self.jingImg.mas_right).offset(10);
        make.height.mas_equalTo(20);
    }];
    
#pragma mark - 中间竖杠
    self.lineHX =[UILabel new];
    self.lineHX.backgroundColor =RGB_GGCOLOR(211, 211, 211);
    [self addSubview:self.lineHX];
    [self.lineHX mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.center.equalTo(self);
        make.width.mas_equalTo(1);
        make.bottom.mas_equalTo(-10);
    }];
    
    
    self.titleHT =[UILabel new];
    self.titleHT.text =@"#我的第一支运动视频#";
    self.titleHT.font =[UIFont systemFontOfSize:15];
    self.titleHT.textColor = [UIColor blackColor];
    [self addSubview:self.titleHT];
    [self.titleHT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleBT.mas_bottom).offset(15);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(20);
    }];
    
    self.titleHTOne =[UILabel new];
    self.titleHTOne.text =@"#超有效精准拉伸#";
    self.titleHTOne.font =[UIFont systemFontOfSize:15];
    self.titleHTOne.textColor = [UIColor blackColor];
    [self addSubview:self.titleHTOne];
    [self.titleHTOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleHT.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(20);
    }];
    
    self.titleHTTwo =[UILabel new];
    self.titleHTTwo.text =@"#乐刻运动嘉年华#";
    self.titleHTTwo.font =[UIFont systemFontOfSize:15];
    self.titleHTTwo.textColor = [UIColor blackColor];
    [self addSubview:self.titleHTTwo];
    [self.titleHTTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleHTOne.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(20);
    }];
    
/*=================右侧=================================================================*/
    
    self.titleHTJK =[UILabel new];
    self.titleHTJK.text =@"#举铁才痛快#";
    self.titleHTJK.font =[UIFont systemFontOfSize:15];
    self.titleHTJK.textColor = [UIColor blackColor];
    [self addSubview:self.titleHTJK];
    [self.titleHTJK mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleBT.mas_bottom).offset(10);
        make.left.mas_equalTo(self.lineHX.mas_right).offset(10);
        make.height.mas_equalTo(20);
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
