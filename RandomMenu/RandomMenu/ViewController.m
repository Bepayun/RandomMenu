//
//  ViewController.m
//  RandomMenu
//
//  Created by Bepa on 2019/8/9.
//  Copyright © 2019 Bepa. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property(nonatomic, strong) UIButton* breakfastBtn;
@property(nonatomic, strong) UILabel* breakfastLabel;
@property(nonatomic, strong) NSMutableArray* recordingBreakfast;

@property(nonatomic, strong) UIButton* menuBtn;
@property(nonatomic, strong) UILabel* vegetablesLabel;
@property(nonatomic, strong) UILabel* meatLabel;
@property(nonatomic, strong) NSMutableArray* recordingMeatr;
@property(nonatomic, strong) NSMutableArray* recordingVegetables;

@property(nonatomic, strong) UIButton* dinnerBtn;
@property(nonatomic, strong) UILabel* dinnerLabel;
@property(nonatomic, strong) NSMutableArray* recordingDinner;

@property(nonatomic, assign) NSInteger count;

@end

@implementation ViewController

- (UIButton*)menuBtns {
    UIButton* menuBtns = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtns.backgroundColor = [UIColor colorWithRed:67/255.f green:158/255.f blue:240/255.f alpha:1.0f];
    [menuBtns setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    menuBtns.titleLabel.font = [UIFont systemFontOfSize:14.f];
    menuBtns.layer.masksToBounds = YES;
    menuBtns.layer.cornerRadius = 16;
    menuBtns.layer.borderWidth = 0.5f;
    menuBtns.layer.borderColor = [UIColor whiteColor].CGColor;
    
    return menuBtns;
    
}
- (UILabel*)menuLabels {
    UILabel* menuLabels = [[UILabel alloc] init];
    menuLabels.backgroundColor = [UIColor colorWithRed:250/255.f green:206/255.f blue:95 /255.f alpha:1.0f];
    menuLabels.font = [UIFont systemFontOfSize:14.f];
    menuLabels.textColor = [UIColor blackColor];
    menuLabels.textAlignment = NSTextAlignmentCenter;
    menuLabels.layer.masksToBounds = YES;
    menuLabels.layer.cornerRadius = 15;

    return menuLabels;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _recordingBreakfast = [NSMutableArray arrayWithCapacity:0];
    _recordingMeatr = [NSMutableArray arrayWithCapacity:0];
    _recordingVegetables = [NSMutableArray arrayWithCapacity:0];
    _recordingDinner = [NSMutableArray arrayWithCapacity:0];
    _count = 0;
    
    [self initUI];
    [self initLayouts];
}
- (void)initUI {
    // 早饭
    _breakfastBtn = [self menuBtns];
    [_breakfastBtn setTitle:@"早餐菜单" forState:UIControlStateNormal];
    [_breakfastBtn addTarget:self action:@selector(breakfastBtnWithPressed)
            forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.breakfastBtn];
    //
    _breakfastLabel = [self menuLabels];
    _breakfastLabel.hidden = YES;
    [self.view addSubview:self.breakfastLabel];
    
    // 中饭
    _menuBtn = [self menuBtns];
    _menuBtn.frame = CGRectMake(25, 200, 80, 40);
    [_menuBtn setTitle:@"中饭菜单" forState:UIControlStateNormal];
    [_menuBtn addTarget:self action:@selector(orderDishesBtnWithPressed)
       forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.menuBtn];
    //
    _vegetablesLabel = [self menuLabels];
    _vegetablesLabel.frame = CGRectMake(125, 200, 150, 40);
    _vegetablesLabel.hidden = YES;
    [self.view addSubview:self.vegetablesLabel];
    //
    _meatLabel = [self menuLabels];
    _meatLabel.frame = CGRectMake(125, 250, 150, 40);
    _meatLabel.hidden = YES;
    [self.view addSubview:self.meatLabel];
    // 晚饭
    _dinnerBtn = [self menuBtns];
    [_dinnerBtn setTitle:@"晚饭菜单" forState:UIControlStateNormal];
    [_dinnerBtn addTarget:self action:@selector(dinnerBtnWithPressed)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.dinnerBtn];
    //
    _dinnerLabel = [self menuLabels];
    _dinnerLabel.hidden = YES;
    [self.view addSubview:self.dinnerLabel];
}
- (void)initLayouts {
    __weak typeof(&*self) weakSelf = self;
    CGFloat top = 20;
    CGFloat leftSpace = 25;
    CGFloat space = 15;
    CGFloat btn_W = 120;
    CGFloat btn_H = 40;
    CGFloat label_W = 180;
    CGFloat label_H = 40;
    [_breakfastBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(150);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(leftSpace);
        make.size.mas_equalTo(CGSizeMake(btn_W, btn_H));
    }];
    [_breakfastLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.breakfastBtn.mas_centerY);
        make.left.mas_equalTo(weakSelf.breakfastBtn.mas_right).offset(space);
        make.size.mas_equalTo(CGSizeMake(label_W, label_H));
    }];
    //
    [_menuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.breakfastBtn.mas_bottom).offset(top);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(leftSpace);
        make.size.mas_equalTo(CGSizeMake(btn_W, btn_H));
    }];
    [_vegetablesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.menuBtn.mas_centerY);
        make.left.mas_equalTo(weakSelf.menuBtn.mas_right).offset(space);
        make.size.mas_equalTo(CGSizeMake(label_W, label_H));
    }];
    [_meatLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.vegetablesLabel.mas_centerX);
        make.top.mas_equalTo(weakSelf.vegetablesLabel.mas_bottom).offset(top);
        make.size.mas_equalTo(CGSizeMake(label_W, label_H));
    }];
    //
    [_dinnerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.meatLabel.mas_bottom).offset(top);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(leftSpace);
        make.size.mas_equalTo(CGSizeMake(btn_W, btn_H));
    }];
    [_dinnerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.dinnerBtn.mas_centerY);
        make.left.mas_equalTo(weakSelf.dinnerBtn.mas_right).offset(space);
        make.size.mas_equalTo(CGSizeMake(label_W, label_H));
    }];
}
// 早餐菜单按钮的点击事件
- (void)breakfastBtnWithPressed {
    _count ++;
    NSLog(@"\n 编号：-> %ld",_count);
    NSMutableArray* breakfastArrs = [NSMutableArray arrayWithObjects:
                                     @"鸡蛋卷🥚、水果",
                                     @"蒸小香薯、鸡蛋🥚、水果",
                                     @"烧麦、桂花糕、水果",
                                     @"蒸小香薯、水果",
                                     @"鸡蛋🥚、水果",
                                     @"银耳羹、水果",
                                     @"红薯、水果",
                                     @"包子、桂花糕、水果",
                                     @"包子、水果",
                                     @"紫薯、水果",
                                     @"八宝粥、水果", nil];
    
    [self filterMenuWithRecording:_recordingBreakfast
                         menuArrs:breakfastArrs
                     displayLabel:_breakfastLabel];
}

/**
 过滤7天重复的菜单，保证7天不重样...

 @param recordingArrs 7天内的菜单数组
 @param menuArrs 菜单数组
 @param displayLabel 显示label
 */
- (void)filterMenuWithRecording:(NSMutableArray*)recordingArrs
                       menuArrs:(NSMutableArray*)menuArrs
                   displayLabel:(UILabel*)displayLabel {
    if (recordingArrs.count > 7) {
        [recordingArrs removeAllObjects];
    }
    NSInteger menuIndex = 0;
    NSInteger menuCount = menuArrs.count;
    while (menuIndex < menuCount) {
        menuIndex ++;
        if (menuArrs.count == 0) {
            break;
        }
        NSString* menuStr = menuArrs[arc4random()%menuArrs.count];
        
        if (![recordingArrs containsObject:menuStr]) {
            [menuArrs removeObject:menuStr];
            [recordingArrs addObject:menuStr];
            displayLabel.hidden = NO;
            displayLabel.text = menuStr;
            NSLog(@"%@",menuStr);
            break;
        }
    }
}
// 中午菜单按钮的点击事件
- (void)orderDishesBtnWithPressed {
    NSMutableArray* vegetablesArrs = [NSMutableArray arrayWithObjects:
                                      @"孜然杏鲍菇🍄",
                                      @"西红柿炒鸡蛋🍅",
                                      @"麻辣豆腐",
                                      @"黄瓜炒鸡蛋🥒",
                                      @"蒜蓉空心菜🥬",
                                      @"空心菜炒干丝🥬",
                                      @"香煎土豆🥔",
                                      @"土豆炒豆角🥔",
                                      @"凉拌莴笋丝",
                                      @"上汤娃娃菜🥬",
                                      @"凉拌莴笋丝",
                                      @"蒜蓉菠菜🥬",
                                      @"青椒炒杏鲍菇",
                                      @"西蓝花🥦",
                                      @"红烧茄子🍆",
                                      @"糖醋藕片",
                                      @"干锅有机花菜",
                                      @"蚝油生菜🥬",
                                      @"香菇青菜🥬",
                                      @"鸡蛋卷🥚", nil];
    NSMutableArray* meatArrs = [NSMutableArray arrayWithObjects:
                                @"肉沫粉丝🥩",
                                @"豆角肉沫🥩",
                                @"芙蓉虾仁🦐",
                                @"青椒炒牛肉🥩",
                                @"椒盐排条",
                                @"可乐鸡翅🥤",
                                @"玉米排骨汤",
                                @"小炒肉🥩",
                                @"葱油虾🦐",
                                @"糖醋排骨",
                                @"肉沫茄子🍆",
                                @"辣子鸡丁🍗",
                                @"卤鸡腿🍗",
                                @"红烧肉🥩",
                                @"虎皮凤爪",
                                @"蛋黄焗鸡翅",
                                @"蒜蓉粉丝虾🦐",
                                @"红烧鱼🐟",
                                @"鱼香肉丝🥩", nil];
    [self randomMenuWithVegetablesArrs:vegetablesArrs meatArrs:meatArrs];
}
// 随机菜单
- (void)randomMenuWithVegetablesArrs:(NSMutableArray*)vegetablesArrs
                            meatArrs:(NSMutableArray*)meatArrs {
    
    // ************************* vegetables menu ************************* //
    [self filterMenuWithRecording:_recordingVegetables
                         menuArrs:vegetablesArrs
                     displayLabel:_vegetablesLabel];
    
    // ************************* meat menu ************************* //
    [self filterMenuWithRecording:_recordingMeatr
                         menuArrs:meatArrs
                     displayLabel:_meatLabel];
}
// 晚上点菜按钮的点击事件
- (void)dinnerBtnWithPressed {
    NSMutableArray* dinnerArrs = [NSMutableArray arrayWithObjects:
                                  @"稀饭、凉菜",
                                  @"米饭🍚、菜",
                                  @"银耳羹、小香薯、水果",
                                  @"炒凉粉、水果",
                                  @"米粉、水果",
                                  @"烧烤、酸奶🥛、水果",
                                  @"臭豆腐、烤面筋、水果",
                                  @"包子、水果",
                                  @"八宝粥、水果", nil];
    [self filterMenuWithRecording:_recordingDinner
                         menuArrs:dinnerArrs
                     displayLabel:_dinnerLabel];
}

@end
