//
//  ARCSingletonTemplate.h
//  HCContacts
//
//  Created by administrator on 14-7-2.
//
//

#ifndef HCContacts_ARCSingletonTemplate_h
#define HCContacts_ARCSingletonTemplate_h

#define SYNTHESIZE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

#define SYNTHESIZE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

#endif
