//
//  CWBoolean.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 21/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWBoolean.h"

@interface CWBoolean ()
- (instancetype) initWithBOOL:(BOOL) val;
@end

static CWBoolean* yes = nil;
static CWBoolean* no = nil;

@implementation CWBoolean

- (instancetype) initWithBOOL:(BOOL) _val {
	self = [super init];
	if(self) {
		val = _val;
	}
	return self;
}

- (id) asJSONObject {
	if(val) {
		return @"true";
	} else {
		return @"false";
	}
}

+ (CWBoolean*) cwYES {
	if(!yes) {
		yes = [[CWBoolean alloc] initWithBOOL:YES];
	}
	return yes;
}

+ (CWBoolean*) cwNO {
	if(!no) {
		no = [[CWBoolean alloc] initWithBOOL:NO];
	}
	return no;
}

@end
