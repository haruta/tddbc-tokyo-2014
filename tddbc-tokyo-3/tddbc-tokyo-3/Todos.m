//
//  Todos.m
//  tddbc-tyokyo-1
//
//  Created by haruta_makoto on 2014/11/22.
//  Copyright (c) 2014年 haruta_makoto. All rights reserved.
//

#import "Todos.h"
#import "AppDelegate.h"

@interface Todos()

@property (nonatomic) NSMutableArray *todoList;

@end

@implementation Todos

-(instancetype)init
{
    self = [super init];
    if (self == nil) return self;

    self.todoList = [[NSMutableArray alloc] init];
    __weak typeof(self) weakSelf = self;
    [self eachTodoRecord:^(NSManagedObject *object) {
        Todo *todo = [[Todo alloc]
                      initWithDetail:[object valueForKey:@"detail"]];
        [weakSelf.todoList addObject:todo];
    }];
    
    return self;
}

-(void)add:(Todo *)todo
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObject *managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"Todo" inManagedObjectContext:appDelegate.managedObjectContext];
    [managedObject setValue:todo.title forKey:@"title"];
    [managedObject setValue:todo.detail forKey:@"detail"];
    [managedObject setValue:todo.createdAt forKey:@"createdAt"];

    NSError *error = nil;
    if (![appDelegate.managedObjectContext save:&error]) {
        NSLog(@"add failed");
    }
    [self.todoList addObject:todo];
}

-(NSInteger)count
{
    return [self.todoList count];
}


-(Todo*)getLastTodo
{
    return (Todo*)[self.todoList lastObject];
}

-(Todo*)getFirstTodo
{
    return (Todo *)[self.todoList firstObject];
}

-(NSArray*)all
{
    return [NSArray arrayWithArray:self.todoList];
}

-(void)eachTodoRecord:(void (^) (NSManagedObject *object))block
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Todo" inManagedObjectContext:appDelegate.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSArray *results = [appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    for (NSManagedObject *obj in results) {
        block(obj);
    }
}
@end
