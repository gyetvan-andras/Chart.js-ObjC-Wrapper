//
//  CWPointDataSet.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 21/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWDataSet.h"

@interface CWPointDataSet : CWDataSet
@property (nonatomic, strong) CWColor* pointColor;//: "rgba(220,220,220,1)",
@property (nonatomic, strong) CWColor* pointStrokeColor;//: "#fff",
@property (nonatomic, strong) CWColor* pointHighlightFill;//: "#fff",
@property (nonatomic, strong) CWColor* pointHighlightStroke;//: "rgba(220,220,220,1)",

//- (instancetype) initWithData:(NSArray*)data;

@end
