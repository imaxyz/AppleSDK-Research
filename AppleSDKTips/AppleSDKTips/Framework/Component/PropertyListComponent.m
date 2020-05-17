//
//  PropertyListComponent.m
//  AppleSDKTips
//

#import "PropertyListComponent.h"

@implementation PropertyListComponent

+ (NSArray*) propertyListArrayWithPlistPath:(NSString*)plistPathString
{
    if(plistPathString.length == 0) {
        return nil;
    }
    
    NSData* plistXML = [NSData dataWithContentsOfFile:plistPathString];
    
    NSPropertyListFormat format;
    NSError* errorDesc = nil;
    
    NSArray* propertyListArray = [NSPropertyListSerialization propertyListWithData:plistXML
                                                                           options:NSPropertyListImmutable
                                                                            format:&format   error:&errorDesc];

    if(propertyListArray.count > 0) {
        return propertyListArray;
    }

    return nil;
}

@end
