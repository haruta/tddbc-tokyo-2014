#import "Kiwi.h"

#import <CoreData/CoreData.h>

#import "AppDelegate.h"
#import "Todo.h"
#import "Todos.h"

SPEC_BEGIN(TodoSpec)

__block Todos * todos;
__block Todo *firstTodo;
__block Todo *secondTodo;
__block Todo *thirdTodo;


beforeEach(^{
    todos = [[Todos alloc] init];
    firstTodo = [[Todo alloc] initWithDetail:@"first detail"];
    secondTodo = [[Todo alloc] initWithDetail:@"second detail"];
    thirdTodo = [[Todo alloc] initWithDetail:@"third detail"];
    [todos add:firstTodo];
    [todos add:secondTodo];
    [todos add:thirdTodo];
});

afterEach(^{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [todos eachTodoRecord:^(NSManagedObject *object){
        [appDelegate.managedObjectContext deleteObject:object];
    }];
    NSError *error;
    [appDelegate.managedObjectContext save:&error];
    
});

describe(@"TodoAddSpec", ^{
    it(@"add される", ^{
        [[theValue([todos count]) should] equal:theValue(3)];
    });
});

describe(@"GetLastTodoSpec", ^{
    it(@"最後に追加したTODOの詳細を取得する", ^{
        [[[[todos getLastTodo] getDetail] should] equal:@"third detail"];
    });
});

describe(@"GetFirstTodoSpec", ^{
    it(@"最初に追加したTODOの詳細を取得する", ^{
        [[[todos getFirstTodo].detail should] equal:@"first detail"];
    });
});

describe(@"GetTodoListSpec", ^{
    it(@"すべてのTODOを取得する", ^{
        NSArray *todoList = [todos all];
        [[theValue([todoList count]) should] equal:theValue(3)];
    });
});

describe(@"RemoveFirstTodoSpec", ^{
    it(@"すべてのTODOを取得する", ^{
        NSArray *todoList = [todos all];
        [[theValue([todoList count]) should] equal:theValue(3)];
    });
});

SPEC_END