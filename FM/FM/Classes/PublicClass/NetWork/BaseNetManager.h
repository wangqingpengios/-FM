//
//  BaseNetManager.h
//  FM
//
//  Created by home on 2017/8/21.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BaseNetManager : NSObject

+ (id)Get:(NSString *)path parameters:(NSDictionary *)parames complationHandle:(void (^)(id responseObject, NSError *error))completed;

+ (id)Post:(NSString *)path parameters:(NSDictionary *)parames complationHandle:(void(^)(id responseObject, NSError *error))completed;

@end
