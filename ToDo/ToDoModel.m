//
//  ToDoModel.m
//  ToDo
//
//  Created by Neil de Carteret on 27/07/2016.
//  Copyright © 2016 Neil de Carteret. All rights reserved.
//

#import "ToDoModel.h"

static NSArray * todos = nil;
static NSUInteger count = 0;



@interface ToDoModel ()

@property NSUInteger id;

+ (NSString *) pathToArchive;
+ (void) readArchive;
+ (void) saveArchive;

@end



@implementation ToDoModel

+(void) initialize
{
    [ToDoModel readArchive];
    NSLog(@"%@", todos);
    if (! todos) {
        NSLog(@"Creating new blank array");
        todos = [[NSArray alloc] init];
    }
}


- (id) init
{
    self = [super init];
    self.id = count;
    count += 1;
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.title = [aDecoder decodeObjectForKey:@"title"];
    self.complete = [aDecoder decodeBoolForKey:@"complete"];
    return self;
}


- (id) initWithTitle:(NSString*)theTitle complete:(BOOL)complete;
{
    self = [self init];
    self.title = theTitle;
    self.complete = complete;
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeBool:self.complete forKey:@"complete"];
}

- (id) copyWithZone:(NSZone *)zone
{
    id copy = [[[self class] alloc] initWithTitle:self.title complete:self.complete];
    return copy;
}

+ (NSArray *) getAllToDos;
{
    return todos;
}

+ (NSArray *) getToDosWhichAreComplete:(BOOL)complete;
{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"complete == %@", [NSNumber numberWithBool:complete]];

    return [todos filteredArrayUsingPredicate:pred];
}


# pragma mark - persistence

+ (NSString *) pathToArchive;
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths[0] stringByAppendingString:@"/todos.archive"];
}


+ (void) readArchive;
{
    todos = [NSKeyedUnarchiver unarchiveObjectWithFile:[ToDoModel pathToArchive]];
    NSLog(@"restored %@ items from %@", @(todos.count), [ToDoModel pathToArchive]);
}


+ (void) saveArchive;
{
    NSLog(@"archiving %@ items to %@", @(todos.count), [ToDoModel pathToArchive]);
    [NSKeyedArchiver archiveRootObject:todos toFile:[ToDoModel pathToArchive]];
}



# pragma mark - updating

+ (void) addToDo:(ToDoModel *)newToDo;
{
    newToDo = [newToDo copy]; // make sure it has a fresh id
    todos = [todos arrayByAddingObject:newToDo];
    [ToDoModel saveArchive];
}


+ (void) saveToDo:(ToDoModel *)theToDo;
{
    NSInteger i, count = [todos count];
    BOOL found = NO;
    for (i =0; i < count; i++) {
        if ([todos[i] id] == theToDo.id) {
            found = YES;
            break;
        }
    }
    
    if (found) {
        NSMutableArray *mut = [NSMutableArray arrayWithArray:todos];
        [mut replaceObjectAtIndex:i withObject:theToDo];
        todos = [mut copy];
        [ToDoModel saveArchive];
    }
    else {
        // should probably do some sort of actual error handling :P
        NSLog(@"unable to find todo with id %ld", theToDo.id);
    }
    
}

+ (void) clearCompleted;
{
    NSMutableArray *mut = [NSMutableArray array];
    for (ToDoModel * todo in todos) {
        if (! todo.complete) {
            [mut addObject:todo];
        }
    }
    todos = [mut copy];
    [ToDoModel saveArchive];
}


@end


























