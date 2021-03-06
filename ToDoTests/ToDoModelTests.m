//
//  ToDoTests.m
//  ToDoTests
//
//  Created by Neil de Carteret on 01/08/2016.
//  Copyright © 2016 Neil de Carteret. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ToDoModel.h"

@interface ToDoModelTests : XCTestCase

@end

@implementation ToDoModelTests

- (void)setUp {
    [super setUp];
    [ToDoModel wipeEverything];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testListIsEmptyAtStart {
    XCTAssertEqual([[ToDoModel getAllToDos] count], 0);
}

- (void)testAddingOneToDo {
    [ToDoModel addToDo:[[ToDoModel alloc] initWithTitle:@"test" complete:NO]];
    NSArray *todos = [ToDoModel getAllToDos];
    XCTAssertEqual([todos count], 1);
    XCTAssertEqual([[todos objectAtIndex:0] title], @"test");
    XCTAssertEqual([[todos objectAtIndex:0] complete], NO);
}

- (void)testModifyingAToDo {
    ToDoModel *myTodo = [[ToDoModel alloc] initWithTitle:@"test" complete:NO];
    [ToDoModel addToDo:myTodo];
    myTodo = [[ToDoModel getAllToDos] objectAtIndex:0];
    myTodo.title = @"modified";
    [ToDoModel saveToDo:myTodo];
    NSArray *todos = [ToDoModel getAllToDos];
    XCTAssertEqual([todos count], 1);
    XCTAssertTrue([[[todos objectAtIndex:0] title] isEqualToString:@"modified"]);
}

- (void)testCompletingAToDo {
    ToDoModel *myTodo = [[ToDoModel alloc] initWithTitle:@"test" complete:NO];
    [ToDoModel addToDo:myTodo];
    myTodo = [[ToDoModel getAllToDos] objectAtIndex:0];
    myTodo.complete = YES;
    [ToDoModel saveToDo:myTodo];
    NSArray *todos = [ToDoModel getAllToDos];
    XCTAssertEqual([todos count], 1);
    XCTAssertTrue([[todos objectAtIndex:0] complete]);
}

- (void)testStrippingWhitespaceAtStart {
    ToDoModel *myTodo = [[ToDoModel alloc] initWithTitle:@"  test" complete:NO];
    [ToDoModel addToDo:myTodo];
    myTodo = [[ToDoModel getAllToDos] objectAtIndex:0];
    //myTodo.title = @"test";
    XCTAssertEqualObjects([myTodo title], @"test");
}

- (void)testStrippingWhitespaceAtEnd {
    ToDoModel *myTodo = [[ToDoModel alloc] initWithTitle:@"test   " complete:NO];
    [ToDoModel addToDo:myTodo];
    myTodo = [[ToDoModel getAllToDos] objectAtIndex:0];
    //myTodo.title = @"test";
    XCTAssertEqualObjects([myTodo title], @"test");
}

- (void)testStrippingWhitespaceAtBothEnds {
    ToDoModel *myTodo = [[ToDoModel alloc] initWithTitle:@"   test   " complete:NO];
    [ToDoModel addToDo:myTodo];
    myTodo = [[ToDoModel getAllToDos] objectAtIndex:0];
    //myTodo.title = @"test";
    XCTAssertEqualObjects([myTodo title], @"test");
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
