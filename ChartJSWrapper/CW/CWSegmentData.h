//
//  CWSegmentData.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWData.h"

@interface CWSegmentData : CWData
@property (nonatomic,strong) NSNumber* value;//: 300,
@property (nonatomic, strong) CWColor* color;//:"#F7464A",
@property (nonatomic, strong) CWColor* highlight;//: "#FF5A5E",
@property (nonatomic, strong) NSString* label;//: "Red"
@end
