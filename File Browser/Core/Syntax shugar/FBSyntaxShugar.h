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

#define wait(x) while(x) {};

#define weakify(var) __weak typeof(var) weak_##var = var;

#define strongify(var) \
    _Pragma("clang diagnostic push") \
    _Pragma("clang diagnostic ignored \"-Wshadow\"") \
    __strong typeof(var) var = weak_##var; \
    _Pragma("clang diagnostic pop")

#endif /* FBSyntaxShugar_h */
