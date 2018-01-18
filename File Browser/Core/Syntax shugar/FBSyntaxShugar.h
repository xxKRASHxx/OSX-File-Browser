//
//  FBSyntaxShugar.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#ifndef FBSyntaxShugar_h
#define FBSyntaxShugar_h

#define guard(x) if (!(x)) return;
#define guard_ret(x, retVal) if (!(x)) return (retVal);
#define guard_break(x) if (!(x)) break;

#define NSValueFromPrimitive(primitive) ([NSValue value:&primitive withObjCType:@encode(typeof(primitive))])
#define cast_to(value, protocolType) ([value conformsToProtocol:@protocol(protocolType)] ? value : nil)

#define CLAMP(x, low, high) ({\
__typeof__(x) __x = (x); \
__typeof__(low) __low = (low);\
__typeof__(high) __high = (high);\
__x > __high ? __high : (__x < __low ? __low : __x);\
})

#endif /* FBSyntaxShugar_h */
