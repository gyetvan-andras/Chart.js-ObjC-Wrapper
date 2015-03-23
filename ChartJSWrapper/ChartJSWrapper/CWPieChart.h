//
//  CWPieChart.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWChart.h"
#import "CWPieChartOptions.h"
@interface CWPieChart : CWChart
@property (nonatomic, strong, readonly) CWPieChartOptions* options;
@property (nonatomic, strong,readonly) NSArray* data;
- (instancetype) initWithWindowScriptObject:(id) win name:(NSString*)name width:(NSInteger)w height:(NSInteger)h data:(NSArray*)data options:(CWPieChartOptions*) options;
- (void) setValue:(NSNumber*)val inSegment:(NSInteger)segment;
@end
