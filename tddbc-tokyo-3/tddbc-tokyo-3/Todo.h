//
//  Todo.h
//  tddbc-tyokyo-1
//
//  Created by haruta_makoto on 2014/11/22.
//  Copyright (c) 2014年 haruta_makoto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic) NSString *detail;
@property (nonatomic) NSString *title;
@property (nonatomic) NSDate *createdAt;

-(instancetype)initWithDetail:(NSString*)detail;

-(NSString*) getDetail;

@end
