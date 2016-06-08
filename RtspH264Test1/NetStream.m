//
//  NetStream.m
//  RtspH264Test1
//
//  Created by Fenix on 16/6/8.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "NetStream.h"

@implementation NetStream
-(id)initStreamWithHost:(NSString *)host Port:(uint32_t)port
{
    if (self = [super init]) {
//        由于NSStream不直接支持远程通讯，所以需要先转换成CFSeamRef
        CFReadStreamRef readRef;
        CFWriteStreamRef writeRef;
        CFStreamCreatePairWithSocketToHost(NULL, (__bridge CFStringRef)host, port, &readRef, &writeRef);
        _inStream = (__bridge_transfer NSInputStream*)readRef;
//        _outStream = (__bridge_transfer NSOutputStream*)writeRef;
        [_inStream setDelegate:self];
//        _outStream.delegate = self;
        [_inStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
//        [_outStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [_inStream open];
//        [_outStream open];
        [[NSRunLoop currentRunLoop] run];
    }
    return self;
}
-(void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode
{
    switch (eventCode) {
        case NSStreamEventHasBytesAvailable:
        {
            NSLog(@"NSStreamEventHasBytesAvailable");
        }
            break;
           case NSStreamEventErrorOccurred:
        {
            NSLog(@"NSStreamEventErrorOccurred");
        }
            break;
            case NSStreamEventNone:
        {
            NSLog(@"NSStreamEventNone");
        }
            break;
            case NSStreamEventOpenCompleted:
        {
            NSLog(@"NSStreamEventOpenCompleted");
        }
            break;
            case NSStreamEventEndEncountered:
        {
            NSLog(@"NSStreamEventEndEncountered");
        }
            break;
            case NSStreamEventHasSpaceAvailable:
        {
                  NSLog(@"NSStreamEventHasSpaceAvailable");
        }
              break;
        default:
            break;
    }
}


@end
