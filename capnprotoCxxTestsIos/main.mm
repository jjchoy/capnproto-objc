//
//  main.m
//  capnprotoCxxTestsIos
//
//  Created by Jason Choy on 09/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

#include <iostream>
#include <gtest/gtest.h>


int main(int argc, char * argv[])
{
    NSLog(@"Started");
    
    std::cout << "Testing" << std::endl;
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
    
    /*
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
     */
}
