//
//  NativeWrapper.h
//  Runner
//
//  Created by Chandan on 24/07/24.
//

#ifndef NativeWrapper_h
#define NativeWrapper_h

@interface NativeWrapper : NSObject

+ (int)nativeAdd :(int)a :(int)b;

+ (void)load;

@end

#endif /* NativeWrapper_h */
