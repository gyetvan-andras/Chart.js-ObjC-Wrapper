//
//  CWColors.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 23/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWColors.h"

NSString *const CWCTurquise = @"turquise";
NSString *const CWCEmerald = @"emerald";
NSString *const CWCPeterRiver = @"peter river";
NSString *const CWCAmethyst = @"amethyst";
NSString *const CWCWetAsphalt = @"wet asphalt";
NSString *const CWCGreenSea = @"green sea";
NSString *const CWCNephritis = @"nephritis";
NSString *const CWCBelizeHole = @"belize hole";
NSString *const CWCWisteria = @"wisteria";
NSString *const CWCMidnightBlue = @"midnight blue";
NSString *const CWCSunFlower = @"sun flower";
NSString *const CWCCarrot = @"carrot";
NSString *const CWCAlizarin = @"alizarin";
NSString *const CWCClouds = @"clouds";
NSString *const CWCConcrete = @"concrete";
NSString *const CWCOrange = @"orange";
NSString *const CWCPumpkin = @"pumpkin";
NSString *const CWCPomegrante = @"pomegrante";
NSString *const CWCSilver = @"silver";
NSString *const CWCAsbestos = @"asbestos";



static CWColors* _sharedColors = nil;
@interface CWColors ()
- (CWColor*) rgba:(NSString*) string;
- (NSInteger) random:(NSInteger) max;
@end

@implementation CWColors

- (NSInteger) random:(NSInteger) max {
	return (NSInteger)arc4random_uniform((u_int32_t)max);
}

- (CWColor*) pickColor {
	NSArray* keys = self.colors.allKeys;
	NSString* key = keys[[self random:keys.count]];
	NSLog(@"Picking %@",key);
	return self.colors[key];
}

+ (CWColors*) sharedColors {
	if(!_sharedColors) {
		_sharedColors = [[CWColors alloc] init];
	}
	return _sharedColors;
}

- (instancetype) init {
	self = [super init];
	if(self) {
		NSMutableDictionary* __colors = [NSMutableDictionary dictionary];
		__colors[@"turquise"] = [self rgba:@"26, 188, 156,1.0"];
		__colors[@"emerald"] = [self rgba:@"46, 204, 113,1.0"];
		__colors[@"peter river"] = [self rgba:@"52, 152, 219,1.0"];
		__colors[@"amethyst"] = [self rgba:@"155, 89, 182,1.0"];
		__colors[@"wet asphalt"] = [self rgba:@"52, 73, 94,1.0"];
		__colors[@"green sea"] = [self rgba:@"22, 160, 133,1.0"];
		__colors[@"nephritis"] = [self rgba:@"39, 174, 96,1.0"];
		__colors[@"belize hole"] = [self rgba:@"41, 128, 185,1.0"];
		__colors[@"wisteria"] = [self rgba:@"142, 68, 173,1.0"];
		__colors[@"midnight blue"] = [self rgba:@"44, 62, 80,1.0"];
		__colors[@"sun flower"] = [self rgba:@"241, 196, 15,1.0"];
		__colors[@"carrot"] = [self rgba:@"230, 126, 34,1.0"];
		__colors[@"alizarin"] = [self rgba:@"231, 76, 60,1.0"];
		__colors[@"clouds"] = [self rgba:@"236, 240, 241,1.0"];
		__colors[@"concrete"] = [self rgba:@"149, 165, 166,1.0"];
		__colors[@"orange"] = [self rgba:@"243, 156, 18,1.0"];
		__colors[@"pumpkin"] = [self rgba:@"211, 84, 0,1.0"];
		__colors[@"pomegrante"] = [self rgba:@"192, 57, 43,1.0"];
		__colors[@"silver"] = [self rgba:@"189, 195, 199,1.0"];
		__colors[@"asbestos"] = [self rgba:@"127, 140, 141,1.0"];
		_colors = __colors;
	}
	return self;
}
- (CWColor*) rgba:(NSString*) string {
	NSArray* components = [string componentsSeparatedByString:@","];
	NSInteger r = [components[0] integerValue];
	NSInteger g = [components[1] integerValue];
	NSInteger b = [components[2] integerValue];
	CGFloat a = [components[0] floatValue];
#if TARGET_OS_IPHONE
	CWColor* col = [CWColor colorWithRed:(CGFloat)r/255.0f green:(CGFloat)g/255.0f blue:(CGFloat)b/255.0f alpha:a];
#else
	CWColor* col = [CWColor colorWithDeviceRed:(CGFloat)r/255.0f green:(CGFloat)g/255.0f blue:(CGFloat)b/255.0f alpha:a];
#endif
	return col;
}

@end
