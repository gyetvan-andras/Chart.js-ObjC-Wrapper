//
//  CWObject.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 20/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CWObject : NSObject
- (id) asJSONObject;
- (NSString*) JSON;
@end
