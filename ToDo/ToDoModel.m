//
//  ToDoModel.m
//  ToDo
//
//  Created by Neil de Carteret on 27/07/2016.
//  Copyright © 2016 Neil de Carteret. All rights reserved.
//

#import "ToDoModel.h"

@implementation ToDoModel

- (id) initWithTitle:(NSString*)theTitle;
{
    self = [super init];
    self.title = theTitle;
    return self;
}

- (id) copyWithZone:(NSZone *)zone
{
    id copy = [[[self class] alloc] init];
    [copy setTitle:self.title];
    [copy setComplete:self.complete];
    return copy;
}

@end
