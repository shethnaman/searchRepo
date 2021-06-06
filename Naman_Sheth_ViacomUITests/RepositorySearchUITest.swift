//
//  RepositorySearchUITest.swift
//  Naman_Sheth_ViacomUITests
//
//  Created by Naman Sheth on 07/06/21.
//

import XCTest

class RepositorySearchUITest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func searchRepo() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let forksButton = app/*@START_MENU_TOKEN@*/.buttons["Forks"]/*[[".segmentedControls[\"scopeBar\"].buttons[\"Forks\"]",".buttons[\"Forks\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        forksButton.tap()
        
        let wantedHelpButton = app/*@START_MENU_TOKEN@*/.buttons["Wanted Help"]/*[[".segmentedControls[\"scopeBar\"].buttons[\"Wanted Help\"]",".buttons[\"Wanted Help\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        wantedHelpButton.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Recent"]/*[[".segmentedControls[\"scopeBar\"].buttons[\"Recent\"]",".buttons[\"Recent\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Stars"]/*[[".segmentedControls[\"scopeBar\"].buttons[\"Stars\"]",".buttons[\"Stars\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        forksButton.tap()
        
        let searchLanguageSearchField = app.searchFields["Search Language"]
        searchLanguageSearchField.tap()
        
        let sKey = app/*@START_MENU_TOKEN@*/.keys["S"]/*[[".keyboards.keys[\"S\"]",".keys[\"S\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        sKey.tap()
        
        let wKey = app/*@START_MENU_TOKEN@*/.keys["w"]/*[[".keyboards.keys[\"w\"]",".keys[\"w\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        wKey.tap()
        
        let iKey = app/*@START_MENU_TOKEN@*/.keys["i"]/*[[".keyboards.keys[\"i\"]",".keys[\"i\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        iKey.tap()
        
        let fKey = app/*@START_MENU_TOKEN@*/.keys["f"]/*[[".keyboards.keys[\"f\"]",".keys[\"f\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        fKey.tap()
        
        let tKey = app/*@START_MENU_TOKEN@*/.keys["t"]/*[[".keyboards.keys[\"t\"]",".keys[\"t\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tKey.tap()
        
        let searchButton = app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"search\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        searchButton.tap()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 0).swipeUp()
        
        let element = collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element(boundBy: 0)
        element.swipeUp()
        searchLanguageSearchField.buttons["Clear text"].tap()
        searchButton.tap()
        wantedHelpButton.tap()
        forksButton.tap()
        
    }

}
