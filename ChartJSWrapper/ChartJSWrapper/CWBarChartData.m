//
//  CWBarChartData.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWBarChartData.h"
#import "CWBarDataSet.h"
@implementation CWBarChartData
- (instancetype) initWithLabels:(NSArray*)labels andBarDataSet:(NSArray*)dataSet {
	self = [super initWithLabels:labels andDataSet:dataSet];
	if(self) {
		for(id data in dataSet) {
			if(![data isKindOfClass:[CWBarDataSet class]]) {
				NSLog(@"Invalid data in dataset");
				return nil;
			}
		}
	}
	return self;
}

@end
