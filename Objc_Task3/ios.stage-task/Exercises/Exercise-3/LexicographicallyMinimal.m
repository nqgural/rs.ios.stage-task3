#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *resultString = [[NSMutableString alloc]init];
    
    while (string1.length != 0) {
        if (string2.length == 0) {
            [resultString appendString:string1];
            return resultString;
        }

        NSString *firstChar1 = [string1 substringToIndex:1];
        NSString *firstChar2 = [string2 substringToIndex:1];
        
        if (string2 != nil && ([firstChar1 compare:firstChar2] == NSOrderedSame)) {
            [resultString appendString:firstChar1];
            string1 = [string1 substringFromIndex:1];
            continue;
        }
       
        if (string2 != nil && ([firstChar1 compare:firstChar2] == NSOrderedAscending)) {
            [resultString appendString:firstChar1];
            string1 = [string1 substringFromIndex:1];
        } else {
            [resultString appendString:firstChar2];
            string2 = [string2 substringFromIndex:1];
        }
       
    }
    
    if (string2.length != 0) {
        [resultString appendString:string2];
        return resultString;
    }
    
    
    return resultString;
}

@end
