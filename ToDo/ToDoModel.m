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

@end



@implementation ToDoModel

+(void) initialize
{
    todos = [[NSArray alloc] init];
}


- (id) init
{
    self = [super init];
    self.id = count;
    count += 1;
    return self;
}


- (id) initWithTitle:(NSString*)theTitle complete:(BOOL)complete;
{
    self = [self init];
    self.title = theTitle;
    self.complete = complete;
    return self;
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


# pragma mark - updating

+ (void) addToDo:(ToDoModel *)newToDo;
{
    newToDo = [newToDo copy]; // make sure it has a fresh id
    todos = [todos arrayByAddingObject:newToDo];
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
    }
    else {
        // should probably do some sort of actual error handling :P
        NSLog(@"unable to find todo with id %ld", theToDo.id);
    }
    
}


@end


























