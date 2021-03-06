//
//  MLBUtilities.m
//  MyOne3
//
//  Created by meilbn on 2/22/16.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import "MLBUtilities.h"

static NSDateFormatter *myOneDateFormatter;
static NSDateFormatter *longDateFormatter;
static NSDateFormatter *readDetailsDateFormatter;
static NSDateFormatter *musicDetailsDateFormatter;
static NSDateFormatter *commentDateFormatter;

@implementation MLBUtilities

#pragma mark - String / 字符串

+ (NSString *)stringDateFormatWithddMMMyyyyEEEByNormalDateString:(NSString *)normalDateString {
    if (!myOneDateFormatter) {
        myOneDateFormatter = [NSDateFormatter new];
//        myOneDateFormatter.dateFormat = @"dd MMM,yyyy. EEE.";
		myOneDateFormatter.dateFormat = @"EEE dd MMM. yyyy";
        myOneDateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    }
    
    NSDate *date = [MLBUtilities dateWithString:normalDateString];
    
    return [myOneDateFormatter stringFromDate:date];
}

+ (NSString *)stringDateFormatWithEEEddMMMyyyyByNormalDateString:(NSString *)normalDateString {
	if (!myOneDateFormatter) {
		myOneDateFormatter = [NSDateFormatter new];
		myOneDateFormatter.dateFormat = @"EEE dd MMM. yyyy";
		myOneDateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
	}
	
	NSDate *date = [MLBUtilities dateWithString:normalDateString];
	
	return [myOneDateFormatter stringFromDate:date];
}

+ (NSString *)stringDateForReadDetailsDateString:(NSString *)normalDateString {
	if (!readDetailsDateFormatter) {
		readDetailsDateFormatter = [NSDateFormatter new];
		readDetailsDateFormatter.dateFormat = @"MMM. dd,yyyy";
		readDetailsDateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
	}
	
	NSDate *date = [MLBUtilities dateWithString:normalDateString];
	
	return [readDetailsDateFormatter stringFromDate:date];
}

+ (NSString *)stringDateForMusicDetailsDateString:(NSString *)normalDateString {
    if (!musicDetailsDateFormatter) {
        musicDetailsDateFormatter = [NSDateFormatter new];
        musicDetailsDateFormatter.dateFormat = @"MMM dd,yyyy";
        musicDetailsDateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    }
    
    NSDate *date = [MLBUtilities dateWithString:normalDateString];
    
    return [musicDetailsDateFormatter stringFromDate:date];
}

+ (NSString *)stringDateForCommentDateString:(NSString *)normalDateString {
	if (!commentDateFormatter) {
		commentDateFormatter = [NSDateFormatter new];
		commentDateFormatter.dateFormat = @"yyyy.MM.dd";
		commentDateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
	}
	
	NSDate *date = [MLBUtilities dateWithString:normalDateString];
	
	return [commentDateFormatter stringFromDate:date];
}

+ (NSString *)appCurrentVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)appCurrentBuild {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
}

+ (NSAttributedString *)mlb_attributedStringWithText:(NSString *)text lineSpacing:(CGFloat)lineSpacing font:(UIFont *)font textColor:(UIColor *)textColor {
    return [MLBUtilities mlb_attributedStringWithText:text lineSpacing:lineSpacing font:font textColor:textColor lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)mlb_attributedStringWithText:(NSString *)text lineSpacing:(CGFloat)lineSpacing font:(UIFont *)font textColor:(UIColor *)textColor lineBreakMode:(NSLineBreakMode)lineBreakMode {
	NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
	paragraphStyle.lineSpacing = lineSpacing;
	paragraphStyle.lineBreakMode = lineBreakMode;
	
	NSDictionary *attrsDictionary = @{NSFontAttributeName : font, NSForegroundColorAttributeName : textColor, NSParagraphStyleAttributeName : paragraphStyle};
	NSAttributedString *attributedString =  [[NSAttributedString alloc] initWithString:text attributes:attrsDictionary];
	
	return attributedString;
}

+ (CGRect)mlb_rectWithAttributedString:(NSAttributedString *)attributedString size:(CGSize)size {
    CGRect rect = [attributedString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    return rect;
}

#pragma mark - Int

+ (NSInteger)rowWithCount:(NSInteger)count colNumber:(NSInteger)colNumber {
    NSInteger row = ceilf(count / (CGFloat)colNumber);
    
    return row;
}

#pragma mark - Date / 日期

+ (NSDate *)dateWithString:(NSString *)string {
    if (!longDateFormatter) {
        longDateFormatter = [NSDateFormatter new];
        longDateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        longDateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    }
    
    return [longDateFormatter dateFromString:string];
}

+ (NSTimeInterval)diffTimeIntervalSinceNowFromDateString:(NSString *)dateString {
    NSDate *date = [MLBUtilities dateWithString:dateString];
    NSTimeInterval interval = [date timeIntervalSinceNow];
    
    return interval;
}

+ (NSTimeInterval)diffTimeIntervalSinceNowToDateString:(NSString *)dateString {
    NSDate *date = [MLBUtilities dateWithString:dateString];
    NSDate *now = [NSDate date];
    NSTimeInterval interval = [date timeIntervalSinceDate:now];
    
    return interval;
}

@end
