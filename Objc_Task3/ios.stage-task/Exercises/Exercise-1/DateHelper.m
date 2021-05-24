#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber < 1 || monthNumber > 12) { return nil; }
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *month = [[NSDateComponents alloc]init];
    [month setMonth:monthNumber];
    NSDate *date = [calendar dateFromComponents:month];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateFormat = @"MMMM";
    return [format stringFromDate:date];
    
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    NSDate *ourDate = [dateFormatter dateFromString:date];
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateFormat = @"d";
    
    return [[format stringFromDate:ourDate]longLongValue];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateFormat = @"EE";
    format.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    
    return [format stringFromDate:date];

}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateFormat = @"ww";
    if ([format stringFromDate:date] == [format stringFromDate:[NSDate date]]) {
        return YES;
    }
    return NO;
}

@end
