//
//  TopMenuList.m
//  AppleSDKTips
//

#import "TopMenuList.h"
#import <PropertyListComponent/PropertyListComponent.h>

/* Swiftで実装したクラスをObj-Cから使用するための宣言 */
#import "AppleSDKTips-Swift.h"

@interface TopMenuList() {
    NSMutableArray* _sectionKeyStringArray;
    NSMutableArray* _menuIndexStringArray;
    NSDictionary* _topMenuDictionary;
    NSMutableArray* _topMenuArray;
    NSMutableArray* _allItemArray;
}

@end

@implementation TopMenuList

#pragma mark - Life Cycle

- (instancetype)initWithPlistName:(NSString*) plistNameString
{
    self = [super init];
    if (self) {
        
        _sectionKeyStringArray = [NSMutableArray new];
        _menuIndexStringArray = [NSMutableArray new];
        _topMenuArray = [NSMutableArray new];
        _allItemArray = [NSMutableArray new];
        
        if([plistNameString length] == 0) {
            return self;
        }
        
        NSArray* plist = [PropertyListComponent plistWithPath:plistNameString];
        
        [self setupBufferWithSource:plist];
        

        
    }
    
    return self;
}

#pragma mark - Public

- (NSString*) sectionNameStringWithIndex:(NSInteger)indexNo
{
    NSString *sectionName = [_sectionKeyStringArray objectAtIndex:indexNo];
    return sectionName;
}

- (NSInteger) numberOfSection
{
    NSInteger count = [_sectionKeyStringArray count];
    return count;
}

- (TopMenuEntity*) itemForSection:(NSString*)section index:(NSInteger)indexValue
{
    NSArray* itemArray = [_topMenuDictionary objectForKey:section];
    NSDictionary* itemDictionary = [itemArray objectAtIndex:indexValue];
    
    TopMenuEntity* entity = nil;
    if([itemDictionary isKindOfClass:[NSDictionary class]]){
        entity = [TopMenuEntity new];
        entity.sectionNameString = section;
        entity.titleString = [itemDictionary objectForKey:@"title"];
        entity.viewControllerNameString = [itemDictionary objectForKey:@"vc"];
        entity.windowControllerNameString = [itemDictionary objectForKey:@"vc_osx"];
    }
    
    return entity;
}

- (TopMenuEntity*) itemForRow:(NSInteger)rowValue
{
    TopMenuEntity* retEntity = nil;
    
    retEntity = [_allItemArray objectAtIndex:rowValue];
    
    return retEntity;
}

- (NSInteger) numberOfItemForSection:(NSString*)sectionNameString
{
    NSArray* itemArray = [_topMenuDictionary objectForKey:sectionNameString];
    return [itemArray count];
}

#pragma mark - Private

- (void) setupBufferWithSource:(NSArray*)propertyListArray {
    
    if (propertyListArray.count == 0) {
        return;
    }
    
    NSArray* topArray = [propertyListArray firstObject];
    
    for (NSDictionary* themeDictionary in topArray) {
        NSString* themeString = [themeDictionary objectForKey:@"title"];
        
        [_sectionKeyStringArray addObject: themeString];
        [_menuIndexStringArray  addObject: themeString];
        
        NSArray* itemArray = [themeDictionary objectForKey:@"items"];
        [_topMenuArray addObject: itemArray];
        
        for (NSDictionary* itemDic in itemArray) {
            
            if([itemDic isKindOfClass:[NSDictionary class]]){
                TopMenuEntity* entity = [TopMenuEntity new];
                entity.sectionNameString = themeString;
                entity.titleString = [itemDic objectForKey:@"title"];
                entity.viewControllerNameString = [itemDic objectForKey:@"vc"];
                entity.windowControllerNameString = [itemDic objectForKey:@"vc_osx"];
                
                [_allItemArray addObject:entity];
            }
        }
    }
    
    _topMenuDictionary = [[NSDictionary alloc] initWithObjects:_topMenuArray forKeys:_sectionKeyStringArray];
}

@end
