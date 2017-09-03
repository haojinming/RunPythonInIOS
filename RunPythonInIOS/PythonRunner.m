//
//  PythonRunner.m
//  RunPythonInIOS
//
//  Created by utrc on 30/08/2017.
//  Copyright © 2017 utrc. All rights reserved.
//

#import "PythonRunner.h"
#import <Python/Python.h>

@implementation PythonRunner

+(Boolean)run{
    //init Python
    //get python lib path and set this path as python home directory
    NSString* fullpath = @"/Users/utrc/Documents/Jinming/RunPythonInIOS/Python.framework/Versions/2.7/Resources";
    char home[1024];
    strcpy(home, [fullpath UTF8String]);
    
    Py_SetPythonHome(home);
    Py_Initialize();
    //run simple python code
    PyRun_SimpleString("print 'hello'");//say hello see debug output :)
    
    dispatch_queue_t queue = dispatch_queue_create(0, DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        //run python scipt
        NSString *scriptPath = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"py"];
        
        FILE *mainFile = fopen([scriptPath UTF8String], "r");
        
        PyRun_SimpleFile(mainFile, (char *)[[scriptPath lastPathComponent] UTF8String]) ;
        
    });
    return true;
}

@end
