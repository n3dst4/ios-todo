//
//  ToDoModel.h
//  ToDo
//
//  Created by Neil de Carteret on 27/07/2016.
//  Copyright © 2016 Neil de Carteret. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoModel : NSObject <NSCopying>

@property (strong, atomic) NSString *title;
@property BOOL complete;

- (id) initWithTitle:(NSString*)theTitle complete:(BOOL)complete;

+ (NSArray *) getAllToDos;
+ (NSArray *) getToDosWhichAreComplete:(BOOL)complete;
+ (void) addToDo:(ToDoModel *)newToDo;
+ (void) saveToDo:(ToDoModel *)theToDo;


@end
