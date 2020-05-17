//
//  TopMenuModelControllerTests.swift
//  AppleSDKTips
//
//

import XCTest


//import AppleSDKTips

/**
 TopMenuControllerのテストコード
 */
class TopMenuListTests: XCTestCase {
    
    var controller: TopMenuList?
    
    //---------------------------------
    //Mark - Life Cycle
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    
        let testBundle = Bundle(for: type(of: self))
        let plistPath = testBundle.path(forResource: "topMenuTest", ofType: "plist")
        
        guard let plistName = plistPath else {
            return
        }
        
        controller = TopMenuList(plistName: plistName)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    //---------------------------------
    //Mark - 単体試験

    func testThatControllerHasMenuSpec() {
        
        guard let model = controller else {
            XCTAssert(false, "model controller作成失敗")
            return
        }
        
        XCTAssertTrue(model.numberOfSection() > 0, "複数のセクションを持つこと")
    }
    
    func testThatControllerCanReturnSectionKeyString() {

        guard let model = controller else {
            XCTAssert(false, "model controller作成失敗")
            return
        }

        let numberOfSection = model.numberOfSection()
        XCTAssertGreaterThan(numberOfSection, 0, "必ず１つ以上のセクションをもつこと");
        
        for index in 0..<numberOfSection {
            let sectionNameString = model.sectionNameString(with: index)
            XCTAssertNotNil(sectionNameString, "全てのセクションは名称をもつこと");
        }

    }

    func testThatCozntrollerCanReturnCountOfItemsInSection() {

        guard let model = controller else {
            XCTAssert(false, "model controller作成失敗")
            return
        }

        let sampleSectionNameString = "UIKit"
        let countOfItem = model.numberOfItem(forSection: sampleSectionNameString)

        XCTAssertGreaterThanOrEqual(countOfItem, 1, "セクションが保持するアイテム数を取得することができる");
    }
    
    func testThatControllerCanReturnEachSectionCount() {
        
    }
    
    func testThatControllerCanReturnItemForSectionAtIndex() {
    	
    }
    
    /*
     /*!
     @abstract  全てのセクションの項目数を取得することができること
     */
     - (void) testThatControllerCanReturnEachSectionCount
     {
     NSInteger countOfSection = [modelController numberOfSection];
     for(int i = 0; i < countOfSection; i++){
     NSString* sectionNameString = [modelController sectionNameStringWithIndex:i];
     NSInteger countOfItem = [modelController numberOfItemForSection:sectionNameString];
     
     XCTAssertGreaterThanOrEqual(countOfItem, 0, @"全てのセクションの項目数を知ることができること");
     }
     }
     
     /*!
     @abstract  コントローラーは、検証項目のエンティティを返すことができる
     */
     - (void) testThatControllerCanReturnItemForSectionAtIndex
     {
     NSInteger countOfSection = [modelController numberOfSection];
     for(int i = 0; i < countOfSection; i++){
     NSString* sectionNameString = [modelController sectionNameStringWithIndex:i];
     NSInteger countOfItem = [modelController numberOfItemForSection:sectionNameString];
     
     for(int j = 0; j < countOfItem; j++){
     MTMTopMenuEntity* entity = [modelController itemForSection:sectionNameString index:j];
     XCTAssertNotNil(entity, @"モデルコントローラーは、指定されたセクション、指定された番号のエンティティを返すことができる: (%@:%@)", sectionNameString, entity);
     }
     }
     
     }
     */
    
}
