#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    int counter = 0;
    if (ratingArray.count == 0 || ratingArray == nil) {
        return 0;
    }
    for (int i = 0; i<ratingArray.count; i++) {
        for (int j = i+1; j<ratingArray.count; j++) {
            if (i == j) continue;
            for (int k = j + 1; k<ratingArray.count; k++) {
                if (k == j) continue;
                if (([[ratingArray objectAtIndex:i]intValue] > [[ratingArray objectAtIndex:j]intValue] && [[ratingArray objectAtIndex:j]intValue] > [[ratingArray objectAtIndex:k]intValue]) ||
                    ([[ratingArray objectAtIndex:i]intValue] < [[ratingArray objectAtIndex:j]intValue] && [[ratingArray objectAtIndex:j]intValue] < [[ratingArray objectAtIndex:k]intValue])) {
                    counter++;
                }
            }
        }
    }

    return counter;
}

@end
