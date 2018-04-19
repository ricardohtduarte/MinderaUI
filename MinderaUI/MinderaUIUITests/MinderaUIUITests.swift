//
//  MinderaUIUITests.swift
//  MinderaUIUITests
//
//  Created by Ricardo Duarte on 16/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import XCTest

class MinderaUIUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func test_ui_items_count(){
        let app = XCUIApplication()
        XCTAssertEqual(app.scrollViews.count, 1)
        XCTAssertEqual(app.collectionViews.count, 2)
        XCTAssertEqual(app.segmentedControls.count, 1)
        XCTAssertEqual(app.navigationBars.count, 1)
    }


    func test_homeScroll(){
        let openDay18Element = XCUIApplication().scrollViews.otherElements.containing(.staticText, identifier:"Open Day '18").element
        openDay18Element.swipeUp()
    }
    
    
    func test_openDay_HorizontalScroll() {
        let collectionView = XCUIApplication().scrollViews.otherElements.containing(.staticText, identifier:"Open Day '18").children(matching: .collectionView).element(boundBy: 0)
        XCTAssertEqual(collectionView.cells.count, 3)
        collectionView.swipeLeft()
        collectionView.swipeRight()
    }
    
    
    func test_graduate_HorizontalScroll(){
        let collectionView = XCUIApplication().scrollViews.otherElements.containing(.staticText, identifier:"Open Day '18").children(matching: .collectionView).element(boundBy: 1)
        XCTAssertEqual(collectionView.cells.count, 3)
        collectionView.swipeLeft()
        collectionView.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.swipeRight()
    }
    
    
    func test_home_to_openDayList(){
        let app = XCUIApplication()
        app.scrollViews.otherElements.collectionViews.cells.otherElements.containing(.staticText, identifier:"Day 01").element.tap()
        
        let table = app.tables.element(boundBy: 0)
        XCTAssert(table.cells.count > 0)
        
        XCTAssertEqual(app.navigationBars.count, 1)
        XCTAssertEqual(app.tables.count, 1)
        XCTAssert(app.staticTexts["List 01"].exists)
    }
    
    
    func test_openDayList_to_collection(){
        
        let app = XCUIApplication()
        app.scrollViews.otherElements.collectionViews.cells.otherElements.containing(.staticText, identifier:"Day 01").element.tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["List 01"]/*[[".cells.staticTexts[\"List 01\"]",".staticTexts[\"List 01\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssertEqual(app.navigationBars.count, 1)
        XCTAssertEqual(app.collectionViews.count, 1)
        
        let collection = app.collectionViews.element(boundBy: 0)
        XCTAssertEqual(collection.cells.count, 6)
        XCTAssert(collection.staticTexts["Description 01"].exists)
    }
}
