//
//  Person.h
//  归档解档
//
//  Created by 王月超 on 2017/11/10.
//  Copyright © 2017年 wyc. All rights reserved.
//

#import "BaseModel.h"

@interface Person : BaseModel
 /** 名字*/
@property (nonatomic,copy)NSString *name;
 /** 年龄*/
@property (nonatomic,copy)NSString *age;
@end
