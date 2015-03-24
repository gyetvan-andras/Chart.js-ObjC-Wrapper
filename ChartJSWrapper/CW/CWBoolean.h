//
//  CWBoolean.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 21/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWObject.h"

@interface CWBoolean : CWObject {
	BOOL val;
}

+ (CWBoolean*) cwYES;
+ (CWBoolean*) cwNO;

@end
