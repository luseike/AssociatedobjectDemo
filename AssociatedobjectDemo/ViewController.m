//
//  ViewController.m
//  AssociatedobjectDemo
//
//  Created by Luseike on 2018/2/24.
//  Copyright © 2018年 Luseike. All rights reserved.
//

#import "ViewController.h"
#import "YLPerson.h"
#import "YLPerson+Category.h"
#import <objc/runtime.h>

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController

static char KAssociatedKey;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    YLPerson *per = [[YLPerson alloc] init];
    per.property = @"test";
    per.categoryProperty = @"otherProperty";
    
    /*
     小结：
        关于应用：
            问，分类中到底能否实现属性？
            1、如果你把属性理解为 通过方法访问的实例变量， 这个问题的答案应该是不能， 因为   分类不能位类增加额外的实例变量
            2、不过如果属性只是一个    存取方法以及存储值的容器的集合，那么分类是可以实现属性的
     
        分类中对属性的实现只是实现了一个看起来像属性的接口而已
     
        关于实现：
            关联对象又是如何实现并且管理的呢：
            1、关联对象其实就是ObjcAssociation对象
            2、关联对象由AssociationManager管理 并在 AssociationHashMap存储
            3、对象的指针以及其对应ObjectAssociationMap 以键值对的形式存储在AssociationHashMap中
            4、ObjectAssociationMap 则是用于存储关联对象的数据结构
            5、每一个对象都有一个标记位哈斯——assoc 指示对象是否含有关联对象
     */
    
    NSLog(@"%@---",per.categoryProperty);
    
//    [self associationTest];
}

#pragma mark - 关联的简单应用，将一个字符串关联到alertView对象上
-(void)associationTest{
    UIButton *associateBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [associateBtn setTitle:@"click me" forState:UIControlStateNormal];
    [associateBtn addTarget:self action:@selector(associateBtn:) forControlEvents:UIControlEventTouchUpInside];
    associateBtn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:associateBtn];
}
-(void)associateBtn:(UIButton *)btn{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"hello" delegate:self cancelButtonTitle:@"dismiss" otherButtonTitles:nil, nil];
    
    objc_setAssociatedObject(alert, &KAssociatedKey, @"hello world", OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSString *associatedStr = objc_getAssociatedObject(alertView, &KAssociatedKey);
    
    NSLog(@"%zd---%@",buttonIndex, associatedStr);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
