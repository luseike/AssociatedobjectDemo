//
//  YLPerson+Category.m
//  AssociatedobjectDemo
//
//  Created by Luseike on 2018/2/24.
//  Copyright © 2018年 Luseike. All rights reserved.
//

#import "YLPerson+Category.h"
#import <objc/runtime.h>

@implementation YLPerson (Category)

-(NSString *)categoryProperty{
    
    // _cmd 代表当前选择的方法子，也就是@selector(categoryProperty)
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCategoryProperty:(NSString *)categoryProperty{
    
    // objc_setAssociatedObject(id _Nonnull object, const void * _Nonnull key, id _Nullable value, objc_AssociationPolicy policy)
    // 参数中的key是一个静态指针 static void * 类型的参数，使用 @selector(categoryProperty)作为key传入，省略了声明参数的代码，并且能很好的保证key的唯一性
    objc_setAssociatedObject(self, @selector(categoryProperty), categoryProperty, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
