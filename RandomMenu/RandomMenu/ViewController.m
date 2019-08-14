//
//  ViewController.m
//  RandomMenu
//
//  Created by Bepa on 2019/8/9.
//  Copyright © 2019 Bepa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) UIButton* menuBtn;
@property(nonatomic, strong) UILabel* vegetablesLabel;
@property(nonatomic, strong) UILabel* meatLabel;

@property(nonatomic, strong) NSMutableArray* recordingMeatr;
@property(nonatomic, strong) NSMutableArray* recordingVegetables;

@property(nonatomic, assign) NSInteger count;

@end

@implementation ViewController

- (UIButton *)menuBtn {
    if (!_menuBtn) {
        _menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _menuBtn.frame = CGRectMake(25, 200, 80, 40);
        _menuBtn.backgroundColor = [UIColor colorWithRed:67/255.f green:158/255.f blue:240/255.f alpha:1.0f];
        [_menuBtn setTitle:@"点菜" forState:UIControlStateNormal];
        [_menuBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _menuBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
        _menuBtn.layer.masksToBounds = YES;
        _menuBtn.layer.cornerRadius = 16;
        _menuBtn.layer.borderWidth = 0.5f;
        _menuBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        
        [_menuBtn addTarget:self action:@selector(orderDishesBtnWithPressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return _menuBtn;
}
- (UILabel *)vegetablesLabel {
    if (!_vegetablesLabel) {
        _vegetablesLabel = [[UILabel alloc] init];
        _vegetablesLabel.frame = CGRectMake(125, 200, 150, 40);
        _vegetablesLabel.backgroundColor = [UIColor colorWithRed:250/255.f green:206/255.f blue:95 /255.f alpha:1.0f];
        _vegetablesLabel.font = [UIFont systemFontOfSize:14.f];
        _vegetablesLabel.textColor = [UIColor blackColor];
        _vegetablesLabel.textAlignment = NSTextAlignmentCenter;
        _vegetablesLabel.layer.masksToBounds = YES;
        _vegetablesLabel.layer.cornerRadius = 12;
        _vegetablesLabel.hidden = YES;
    }
    return _vegetablesLabel;
}
- (UILabel *)meatLabel {
    if (!_meatLabel) {
        _meatLabel = [[UILabel alloc] init];
        _meatLabel.frame = CGRectMake(125, 250, 150, 40);
        _meatLabel.backgroundColor = [UIColor colorWithRed:250/255.f green:206/255.f blue:95 /255.f alpha:1.0f];
        _meatLabel.font = [UIFont systemFontOfSize:14.f];
        _meatLabel.textColor = [UIColor blackColor];
        _meatLabel.textAlignment = NSTextAlignmentCenter;
        _meatLabel.layer.masksToBounds = YES;
        _meatLabel.layer.cornerRadius = 12;
        _meatLabel.hidden = YES;
    }
    return _meatLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _recordingMeatr = [NSMutableArray arrayWithCapacity:0];
    _recordingVegetables = [NSMutableArray arrayWithCapacity:0];
    _count = 0;
    [self.view addSubview:self.menuBtn];
    [self.view addSubview:self.vegetablesLabel];
    [self.view addSubview:self.meatLabel];
}
- (void)orderDishesBtnWithPressed {
    NSMutableArray* vegetablesArrs = [NSMutableArray arrayWithObjects:
                                      @"孜然杏鲍菇🍄",
                                      @"麻辣豆腐",
                                      @"蒜蓉空心菜",
                                      @"香煎土豆🥔",
                                      @"凉拌莴笋丝",
                                      @"青椒炒杏鲍菇",
                                      @"西蓝花🥦",
                                      @"红烧茄子🍆",
                                      @"干锅有机花菜",
                                      @"蚝油生菜🥬",
                                      @"鸡蛋卷🥚", nil];
    NSMutableArray* meatArrs = [NSMutableArray arrayWithObjects:
                                @"椒盐排条",
                                @"可乐鸡翅🥤",
                                @"玉米排骨汤",
                                @"小炒肉🥩",
                                @"糖醋排骨",
                                @"肉末茄子🍆",
                                @"辣子鸡丁🍗",
                                @"红烧肉🥩",
                                @"蛋黄焗鸡翅",
                                @"蒜蓉粉丝虾🦐",
                                @"鱼香肉丝🥩", nil];
    [self randomMenuWithVegetablesArrs:vegetablesArrs meatArrs:meatArrs];
}
- (void)randomMenuWithVegetablesArrs:(NSMutableArray*)vegetablesArrs meatArrs:(NSMutableArray*)meatArrs {
    _count ++;
    NSLog(@"\n 编号：-> %ld",_count);
    
    // ************************* vegetables menu ************************* //
    if (_recordingVegetables.count > 7) {
        [_recordingVegetables removeAllObjects];
    }
    NSInteger vegetablesIndex = 0;
    NSInteger vegetablesCount = vegetablesArrs.count;
    while (vegetablesIndex < vegetablesCount) {
        vegetablesIndex ++;
        if (vegetablesArrs.count == 0) {
            break;
        }
        NSString* vegetablesStr = vegetablesArrs[arc4random()%vegetablesArrs.count];
        
        if (![_recordingVegetables containsObject:vegetablesStr]) {
            [vegetablesArrs removeObject:vegetablesStr];
            [_recordingVegetables addObject:vegetablesStr];
            _vegetablesLabel.hidden = NO;
            _vegetablesLabel.text = vegetablesStr;
            NSLog(@"%@",vegetablesStr);
            break;
        }
    }
    // ************************* meat menu ************************* //    
    if (_recordingMeatr.count > 7) {
        [_recordingMeatr removeAllObjects];
    }
    NSInteger meatIndex = 0;
    NSInteger meatCount = meatArrs.count;
    while (meatIndex < meatCount) {
        meatIndex ++;
        if (meatArrs.count == 0) {
            break;
        }
        NSString* meatStr = meatArrs[arc4random()%meatArrs.count];
        
        if (![_recordingMeatr containsObject:meatStr]) {
            [meatArrs removeObject:meatStr];
            [_recordingMeatr addObject:meatStr];
            _meatLabel.hidden = NO;
            _meatLabel.text = meatStr;
            NSLog(@"%@",meatStr);
            break;
        }
    }
}

@end
