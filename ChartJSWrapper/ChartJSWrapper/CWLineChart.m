//
//  CWLineChart.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWLineChart.h"

@interface CWLineChart ()
@property (nonatomic, strong,readonly) CWLineChartData* data;
@property (nonatomic, strong, readonly) CWLineChartOptions* options;
@end

@implementation CWLineChart
- (instancetype) initWithWindowScriptObject:(id) win name:(NSString*)name width:(NSInteger)w height:(NSInteger)h data:(CWLineChartData*)data options:(CWLineChartOptions*) options {
	self = [super initWithWindowScriptObject:win name:name width:w height:h];
	if(self) {
		_data = data;
		_options = options;
		if(!_options) {
			_options = [[CWLineChartOptions alloc] init];
		}
	}
	return self;
}

- (void) addChart {
	NSString* dataJSON = [self.data JSON];
	NSString* optJSON = [self.options JSON];
	
	NSArray* params = @[self.name,@(self.width),@(self.height),dataJSON,optJSON];

	id res = [self.win callWebScriptMethod:@"addLineChart" withArguments:params];

	NSLog(@"Result is:%@",res);
}

- (void) setValue:(NSNumber*)val inDataset:(NSInteger)dataset at:(NSInteger)data {
	[_data setValue:val inDataset:dataset at:data];
	NSArray* params = @[self.name,@(dataset),@(data),val];
	
	id res = [self.win callWebScriptMethod:@"setPointValue" withArguments:params];
	
	NSLog(@"Result setPointValue is:%@",res);
}

- (void) addData:(NSArray*)values label:(NSString*)label {
	NSMutableArray* safeArray = [NSMutableArray arrayWithArray:values];
	while (safeArray.count > self.data.datasets.count) {
		[safeArray removeLastObject];
	};
	id jsonValues = [self convertToJSON:safeArray];
	NSString* valuesJSON = [CWObject toJSONString:jsonValues];
	
	NSArray* params = @[self.name,valuesJSON,label];
	id res = [self.win callWebScriptMethod:@"addPointData" withArguments:params];
	NSLog(@"Result addPointData is:%@",res);
}

- (void) removeData {
	NSArray* params = @[self.name];
	id res = [self.win callWebScriptMethod:@"removePointData" withArguments:params];
	NSLog(@"Result - removePointData is:%@",res);
	
}

@end
