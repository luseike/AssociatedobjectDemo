//
//  YLPerson+Category.h
//  AssociatedobjectDemo
//
//  Created by Luseike on 2018/2/24.
//  Copyright © 2018年 Luseike. All rights reserved.
//

#import "YLPerson.h"

/*
 在分类中，因为类的实例变量布局已经固定，是用@property已经无法向固定的布局中添加新的实例变量
        （这样做可能会覆盖子类的实例变量）
 
 所以我们需要使用关联对象以及两个方法来模拟构成属性的三个要素
 */

@interface YLPerson (Category)
// 分类中的@property并没有为我们生成实例变量和存取方法，需要我们手动实现
@property (nonatomic, copy) NSString *categoryProperty;
@end
