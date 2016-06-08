//
//  NetStream.h
//  RtspH264Test1
//
//  Created by Fenix on 16/6/8.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetStream : NSObject<NSStreamDelegate>
@property (nonatomic, strong) NSInputStream *inStream;
@property (nonatomic, strong) NSOutputStream *outStream;
-(id)initStreamWithHost:(NSString *)host Port:(uint32_t)port;
@end
