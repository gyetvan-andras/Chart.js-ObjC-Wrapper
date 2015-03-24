//
//  CWPolarAreaChart.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWChart.h"
#import "CWPolarAreaChartOptions.h"
#import "CWSegmentData.h"
@interface CWPolarAreaChart : CWChart
- (instancetype) initWithWebView:(CWWebView*)webview name:(NSString*)name width:(NSInteger)w height:(NSInteger)h data:(NSArray*)data options:(CWPolarAreaChartOptions*) options;
- (void) setValue:(NSNumber*)val inSegment:(NSInteger)segment;
//.addData( segmentData, index )
- (void) addData:(CWSegmentData*)data index:(NSNumber*)index;
- (void) removeDataAt:(NSNumber*)index;

@end
