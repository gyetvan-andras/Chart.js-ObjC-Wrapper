//
//  CWDataSet.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 20/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWDataSet.h"

@implementation CWDataSet
//- (instancetype) init {
//	self = [super init];
//	return self;
//}

- (instancetype) initWithData:(NSArray*)data {
	self = [super init];
	if(self) {
		_data = [NSMutableArray arrayWithArray:data];
	}
	return self;
}

- (void) setValue:(NSNumber*)val at:(NSInteger)data {
	NSMutableArray* arr = (NSMutableArray*)_data;
	[arr setObject:val atIndexedSubscript:data];// [data] = val;
}

@end
