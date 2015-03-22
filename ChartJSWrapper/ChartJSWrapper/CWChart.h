//
//  CWChart.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWObject.h"
#import <WebKit/WebKit.h>

@interface CWChart : CWObject
@property (nonatomic, weak, readonly) id win;
@property (nonatomic, strong, readonly) NSString* name;
@property (nonatomic, readonly) NSInteger width;
@property (nonatomic, readonly) NSInteger height;

- (instancetype) initWithWindowScriptObject:(id) win name:(NSString*)name width:(NSInteger)w height:(NSInteger)h;
-(void) addChart;
- (void) update;

@end
