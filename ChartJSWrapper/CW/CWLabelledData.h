//
//  CWLabelledData.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 20/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWData.h"
@interface CWLabelledData : CWData
@property (nonatomic, strong,readonly) NSArray* labels;
@property (nonatomic, strong,readonly) NSArray* datasets;

- (instancetype) initWithLabels:(NSArray*)labels andDataSet:(NSArray*)dataSet;
- (void) setValue:(NSNumber*)val inDataset:(NSInteger)dataset at:(NSInteger)data;

@end
