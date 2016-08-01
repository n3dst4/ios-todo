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

- (void)testExample {
    XCTAssertEqual([[ToDoModel getAllToDos] count], 0);
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
