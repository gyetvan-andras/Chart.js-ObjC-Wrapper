//
//  CWPolarAreaChart.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWChart.h"
#import "CWPolarAreaChartOptions.h"

@interface CWPolarAreaChart : CWChart
@property (nonatomic, strong,readonly) NSArray* data;
@property (nonatomic, strong, readonly) CWPolarAreaChartOptions* options;
- (instancetype) initWithWindowScriptObject:(id) win name:(NSString*)name width:(NSInteger)w height:(NSInteger)h data:(NSArray*)data options:(CWPolarAreaChartOptions*) options;
- (void) setValue:(NSNumber*)val inSegment:(NSInteger)segment;

@end
