//
//  tddbc_tokyo_3Tests.m
//  tddbc-tokyo-3Tests
//
//  Created by haruta_makoto on 2014/11/22.
//  Copyright (c) 2014年 haruta_makoto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface tddbc_tokyo_3Tests : XCTestCase

@end

@implementation tddbc_tokyo_3Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
