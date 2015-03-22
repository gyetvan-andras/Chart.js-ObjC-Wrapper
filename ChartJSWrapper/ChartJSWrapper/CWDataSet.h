//
//  CWDataSet.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 20/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CWObject.h"
#import "CWBoolean.h"

@interface CWDataSet : CWObject
@property (nonatomic, strong) NSString* label;
@property (nonatomic, strong) NSColor* fillColor;
@property (nonatomic, strong) NSColor* strokeColor;
@property (nonatomic, strong,readonly) NSArray* data;//: [65, 59, 80, 81, 56, 55, 40]

- (instancetype) initWithData:(NSArray*)data;
- (void) setValue:(NSNumber*)val at:(NSInteger)data;

@end
