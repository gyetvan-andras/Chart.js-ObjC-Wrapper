//
//  CWDonughtChart.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 23/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWDoughnutChart.h"

@implementation CWDoughnutChart
- (void) addChart {
	id jsonData = [self convertToJSON:self.data];
	NSString* dataJSON = [CWObject toJSONString:jsonData];
	NSString* optJSON = [self.options JSON];
	
	NSArray* params = @[self.name,@(self.width),@(self.height),dataJSON,optJSON];
	
	[self callJavaScriptMethod:@"addDoughnutChart" withArguments:params];
}

@end
