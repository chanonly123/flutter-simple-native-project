//
//  NativeWrapper.m
//  Runner
//
//  Created by Chandan on 24/07/24.
//

#import <Foundation/Foundation.h>
#import "NativeWrapper.h"
#import "mylib.h"

@implementation NativeWrapper : NSObject

+ (void)load {
    load();
}

@end
