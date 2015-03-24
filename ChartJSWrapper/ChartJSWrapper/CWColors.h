//
//  CWColors.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 23/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString *const CWCTurquise;
extern NSString *const CWCemerald;
extern NSString *const CWCPeterRiver;
extern NSString *const CWCAmethyst;
extern NSString *const CWCWetAsphalt;
extern NSString *const CWCGreenSea;
extern NSString *const CWCNephritis;
extern NSString *const CWCBelizeHole;
extern NSString *const CWCWisteria;
extern NSString *const CWCMidnightBlue;
extern NSString *const CWCSunFlower;
extern NSString *const CWCCarrot;
extern NSString *const CWCAlizarin;
extern NSString *const CWCClouds;
extern NSString *const CWCConcrete;
extern NSString *const CWCOrange;
extern NSString *const CWCPumpkin;
extern NSString *const CWCPomegrante;
extern NSString *const CWCSilver;
extern NSString *const CWCAsbestos;

@interface CWColors : NSObject
@property (nonatomic, strong) NSDictionary* colors;
- (NSColor*) pickColor;
+ (CWColors*) sharedColors;
@end
