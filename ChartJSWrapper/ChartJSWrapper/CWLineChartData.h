//
//  CWLineData.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 21/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWLabelledData.h"

@interface CWLineChartData : CWLabelledData
- (instancetype) initWithLabels:(NSArray*)labels andPointDataSet:(NSArray*)dataSet;
@end
