#import "Converter.h"

// Do not change
NSString *KeyPhoneNumber = @"phoneNumber";
NSString *KeyCountry = @"country";

@implementation PNConverter
- (NSDictionary*)converToPhoneNumberNextString:(NSString*)string; {
    // good luck
    NSString *number = @"";
    NSString *country = @"";
    
    unsigned short firstSymbol = [string characterAtIndex:0];
    NSString *firstSymbolString = [NSString stringWithFormat:@"%c", firstSymbol];
    if ([firstSymbolString  isEqual: @"7"]) {
        country = @"RU";
    }
    if (string.length >=2) {
        unsigned short secondSymbol = [string characterAtIndex:1];
        NSString *secondSymbolString = [NSString stringWithFormat:@"%c", secondSymbol];
        if ([firstSymbolString  isEqual: @"7"]) {
            if ([secondSymbolString  isEqual: @"7"]) {
                country = @"KZ";
            }
            else country = @"RU";
        } else  country = @"";
    }
    if (string.length >=3) {
        unsigned short secondSymbol = [string characterAtIndex:1];
        NSString *secondSymbolString = [NSString stringWithFormat:@"%c", secondSymbol];
        unsigned short thirdSymbol = [string characterAtIndex:2];
        NSString *thirdSymbolString = [NSString stringWithFormat:@"%c", thirdSymbol];

        if ([firstSymbolString  isEqual: @"3"]) {
            if ([secondSymbolString  isEqual: @"8"]) {
                country = @"UA";
            } else if ([thirdSymbolString  isEqual: @"3"]) {
                country = @"MD";
            } else if ([thirdSymbolString  isEqual: @"4"]) {
                country = @"AM";
            } else if ([thirdSymbolString  isEqual: @"5"]) {
                country = @"BY";
            }
        }

        if ([firstSymbolString  isEqual: @"9"]) {
            if ([thirdSymbolString  isEqual: @"2"]) {
                country = @"TJ";
            } else if ([thirdSymbolString  isEqual: @"3"]) {
                    country = @"TM";
            } else if ([thirdSymbolString  isEqual: @"4"]) {
                    country = @"AZ";
                } else if ([thirdSymbolString  isEqual: @"6"]) {
                        country = @"KG";
                    } else if ([thirdSymbolString  isEqual: @"8"]) {
                        country = @"UZ";
                    }
        }
    }
    NSMutableString *myResultString =  [[NSMutableString alloc] init];
    if ([firstSymbolString isEqual: @"+"]) {
        [myResultString appendString:string];
    }    else [myResultString appendString:@"+"];
        [myResultString appendString:string];
    if ([country  isEqual: @"RU"] || [country  isEqual: @"KZ"]) {
        if (string.length == 1) {
            number = myResultString;
        }
        if (string.length >= 2) {
            [myResultString insertString:@" (" atIndex:(2)];
            number = myResultString;
        }
        if (string.length >= 5) {
            [myResultString insertString:@") " atIndex:(7)];
            number = myResultString;
        }
        if (string.length >= 8) {
            [myResultString insertString:@"-" atIndex:(12)];
            number = myResultString;
        }
        if (string.length >= 10) {
            [myResultString insertString:@"-" atIndex:(15)];
            if (string.length == 10) {
                number = [myResultString substringToIndex:17];
            }
            if (string.length >= 11) {
                number = [myResultString substringToIndex:18];
            }
        }
    }
    if ([country  isEqual: @"BY"] || [country  isEqual: @"UA"] || [country  isEqual: @"TJ"] || [country  isEqual: @"AZ"] || [country  isEqual: @"KG"] || [country  isEqual: @"UZ"]) {
        if (string.length >= 3) {
            number = myResultString;
        }
        if (string.length >= 4) {
            [myResultString insertString:@" (" atIndex:(4)];
            number = myResultString;
        }
        if (string.length >= 6) {
            [myResultString insertString:@") " atIndex:(8)];
            number = myResultString;
        }
        if (string.length >= 9) {
            [myResultString insertString:@"-" atIndex:(13)];
            number = myResultString;
        }
        if (string.length >= 11) {
            [myResultString insertString:@"-" atIndex:(16)];
            if (string.length == 11) {
                number = myResultString;
            }
            if (string.length >= 12) {
                number = [myResultString substringToIndex:19];
            }
        }
    }
    if ([country  isEqual: @"MD"] || [country  isEqual: @"AM"] || [country  isEqual: @"TM"]) {
        if (string.length >= 3) {
            number = myResultString;
        }
        if (string.length >= 4) {
            [myResultString insertString:@" (" atIndex:(4)];
            number = myResultString;
        }
        if (string.length >= 6) {
            [myResultString insertString:@") " atIndex:(8)];
            number = myResultString;
        }
        if (string.length >=9){
            [myResultString insertString:@"-" atIndex:(13)];
        }
        if (string.length >=11) {
            number = [myResultString substringToIndex:17];
        }
    }
    if ([country isEqual: @""]) {
        if (string.length <= 12) {
            number = myResultString;
        } else number = [myResultString substringToIndex:13];
    }
    NSDictionary *result = @{
        KeyPhoneNumber: number,
        KeyCountry: country,
    };
    return result;
}
@end
