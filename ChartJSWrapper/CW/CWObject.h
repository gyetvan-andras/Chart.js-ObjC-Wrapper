//
//  CWObject.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 20/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWTypes.h"

@interface CWObject : NSObject
- (id) convertToJSON:(id)val;
- (id) asJSONObject;
- (NSString*) JSON;
+ (NSString*) toJSONString:(id)val;
@end
