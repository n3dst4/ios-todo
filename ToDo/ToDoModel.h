//
//  ToDoModel.h
//  ToDo
//
//  Created by Neil de Carteret on 27/07/2016.
//  Copyright © 2016 Neil de Carteret. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoModel : NSObject

@property (strong, atomic) NSString *title;
@property BOOL complete;

- (id) initWithTitle:(NSString*)theTitle;

@end
