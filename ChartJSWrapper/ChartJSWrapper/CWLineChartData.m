//
//  CWLineData.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 21/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWLineChartData.h"
#import "CWPointDataSet.h"

@implementation CWLineChartData

- (instancetype) initWithLabels:(NSArray*)labels andPointDataSet:(NSArray*)dataSet {
	self = [super initWithLabels:labels andDataSet:dataSet];
	if(self) {
		for(id data in dataSet) {
			if(![data isKindOfClass:[CWPointDataSet class]]) {
				NSLog(@"Invalid data in dataset");
				return nil;
			}
		}
	}
	return self;
}

//- (void) setValue:(NSNumber*)val inDataset:(NSInteger)dataset at:(NSInteger)data {
//	
//}

@end
