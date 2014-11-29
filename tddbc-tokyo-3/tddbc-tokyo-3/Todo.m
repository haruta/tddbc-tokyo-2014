//
//  Todo.m
//  tddbc-tyokyo-1
//
//  Created by haruta_makoto on 2014/11/22.
//  Copyright (c) 2014年 haruta_makoto. All rights reserved.
//

#import "Todo.h"

@implementation Todo

-(NSString*) getDetail
{
    return self.detail;
}


-(instancetype)initWithDetail:(NSString*)detail
{
    self = [super init];
    if (self == nil) return self;
    
    self.detail = detail;
    
    return self;
}


@end
