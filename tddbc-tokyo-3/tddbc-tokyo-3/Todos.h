//
//  Todos.h
//  tddbc-tyokyo-1
//
//  Created by haruta_makoto on 2014/11/22.
//  Copyright (c) 2014年 haruta_makoto. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreData/CoreData.h>

#import "Todo.h"

@interface Todos : NSObject

-(void) add:(Todo *)todo;
-(NSInteger)count;
-(Todo*)getLastTodo;
-(Todo*)getFirstTodo;
-(NSArray*)all;
-(void)eachTodoRecord:(void (^) (NSManagedObject *object))block;

@end
