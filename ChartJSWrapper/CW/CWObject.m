//
//  CWObject.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 20/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWObject.h"
#import <objc/runtime.h>

@implementation CWObject

- (void) propertiesOf:(Class)clazz tp:(NSMutableArray*) arr {
	if(clazz == [CWObject class]) return;
	unsigned int outCount;
	objc_property_t *properties = class_copyPropertyList(clazz, &outCount);
	for (int i = 0; i < outCount; i++)
	{
		objc_property_t property = properties[i];
		const char *propName = property_getName(property);
		if(propName)
		{
			NSString *propertyName = @(propName);
			[arr addObject:propertyName];
		}
	}
	free(properties);
	Class superClazz = class_getSuperclass(clazz);
	[self propertiesOf:superClazz tp:arr];
}

- (NSArray*) properties {
	NSMutableArray *array = [NSMutableArray array];
	[self propertiesOf:[self class] tp:array];
	return array;
}

- (id) convertToJSON:(id)val {
	id ret = nil;
	if([val isKindOfClass:[CWObject class]]) {
		ret = [val asJSONObject];
	} else if([val isKindOfClass:[NSArray class]]) {
		NSMutableArray* jsonProp = [NSMutableArray array];
		for(id o in val) {
			[jsonProp addObject:[self convertToJSON:o]];
		}
		ret = jsonProp;
	} else if([val isKindOfClass:[NSDictionary class]]) {
		NSDictionary* dict = val;
		NSMutableDictionary* jsonProp = [NSMutableDictionary dictionary];
		
		for(id key in dict.allKeys) {
			id o = dict[key];
			jsonProp[key] = [self convertToJSON:o];
		}
		ret = jsonProp;
	} else if([val isKindOfClass:[CWColor class]]) {
		CWColor* _c = val;
#if TARGET_OS_IPHONE
		CGFloat fr;
		CGFloat fg;
		CGFloat fb;
		CGFloat fa;
		[_c getRed:&fr green:&fg blue:&fb alpha:&fa];
		int r = (fr*255.0f);
		int g = (fg*255.0f);
		int b = (fb*255.0f);
		CGFloat a = fa;
#else
		CWColor* c = [_c colorUsingColorSpace:[NSColorSpace sRGBColorSpace]];
		int r = (c.redComponent*255.0f);
		int g = (c.greenComponent*255.0f);
		int b = (c.blueComponent*255.0f);
		CGFloat a = (c.alphaComponent);
#endif
		NSString* jsonColor = [NSString stringWithFormat:@"rgba(%d,%d,%d,%f)",r,g,b,a];
		ret = jsonColor;
	} else {
		ret = val;
	}
	return ret;
}

- (id) asJSONObject {
	NSMutableDictionary* ret = [NSMutableDictionary dictionary];
	for(NSString* prop in [self properties]) {
		id val = [self valueForKey:prop];
		if(!val) continue;
		ret[prop] = [self convertToJSON:val];
	}
	return ret;
}

+ (NSString*) toJSONString:(id)val {
//	NSData *dataJSON = [NSJSONSerialization dataWithJSONObject:val options:NSJSONWritingPrettyPrinted error:nil];
	NSData *dataJSON = [NSJSONSerialization dataWithJSONObject:val options:0 error:nil];
	NSString *stringJSON = [[NSString alloc] initWithData:dataJSON encoding:NSUTF8StringEncoding];
	return stringJSON;
}

- (NSString*) JSON {
	return [CWObject toJSONString:[self asJSONObject]];
//	NSData *dataJSON = [NSJSONSerialization dataWithJSONObject:[self asJSONObject] options:NSJSONWritingPrettyPrinted error:nil];
//	NSString *stringJSON = [[NSString alloc] initWithData:dataJSON encoding:NSUTF8StringEncoding];
//	return stringJSON;
}


@end
