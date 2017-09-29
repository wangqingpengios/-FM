//
//  BaseNetManager.m
//  FM
//
//  Created by home on 2017/8/21.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "BaseNetManager.h"

@implementation BaseNetManager


+ (AFHTTPSessionManager *)sharedManager {
    static AFHTTPSessionManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json",@"text/plain",@"text/javascript",@"application/json", nil];    });
    
    return manager;
}

+ (id)Get:(NSString *)path parameters:(NSDictionary *)parames complationHandle:(void (^)(id responseObject, NSError *error))completed {

    return [[self sharedManager] GET:path parameters:parames progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completed(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"GET Error %@",error.userInfo);
    }];
}

+ (id)Post:(NSString *)path parameters:(NSDictionary *)parames complationHandle:(void(^)(id responseObject, NSError *error))completed {
    
    return [[self sharedManager] POST:path parameters:parames progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completed(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
@end
