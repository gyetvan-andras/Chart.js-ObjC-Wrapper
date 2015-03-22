//
//  CWLabelledData.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 20/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWLabelledData.h"
#import "CWDataSet.h"

@implementation CWLabelledData
- (instancetype) init {
	self = [super init];
	if(self) {
		_labels = [NSMutableArray array];
		_datasets = [NSMutableArray array];
	}
	return self;
}

- (instancetype) initWithLabels:(NSArray*)labels andDataSet:(NSArray*)dataSet {
	self = [super init];
	if(self) {
		_labels = [NSMutableArray arrayWithArray:labels];
		_datasets = [NSMutableArray arrayWithArray:dataSet];
	}
	return self;
}

- (void) setValue:(NSNumber*)val inDataset:(NSInteger)dataset at:(NSInteger)data {
	CWDataSet* ds = self.datasets[dataset];
	[ds setValue:val at:data];
}

@end
