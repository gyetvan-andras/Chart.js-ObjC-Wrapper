//
//  CWBarChart.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWChart.h"
#import "CWBarChartData.h"
#import "CWBarChartOptions.h"
@interface CWBarChart : CWChart
@property (nonatomic, strong,readonly) CWBarChartData* data;
@property (nonatomic, strong, readonly) CWBarChartOptions* options;
- (instancetype) initWithWindowScriptObject:(id) win name:(NSString*)name width:(NSInteger)w height:(NSInteger)h data:(CWBarChartData*)data options:(CWBarChartOptions*) options;
- (void) setValue:(NSNumber*)val inDataset:(NSInteger)dataset at:(NSInteger)data;

@end
