//
//  ArticlesVCUITEst.swift
//  NY-TimesUITests
//
//  Created by Hadeer Kamel on 12/10/20.
//

import XCTest

class ArticlesVCUITEst: XCTestCase {

    var app: XCUIApplication!
   
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
         app = XCUIApplication()
        // In UI tapp = XCUIApplication()ests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTableExistance() {
        app.launch()
        let articleTableView = app.tables["table-artcliesTableView"]
        XCTAssertTrue(articleTableView.exists, "The article tableview exists")

    }

    func testCellTappedThenPushedADetailsVC(){
            app.launch()
            
            let articleTableView = app.tables["table-artcliesTableView"]
            articleTableView.cells.element(boundBy: 0).tap()
            
            let articleDetailsView = app.otherElements["view_articleDetails"]
            let articleDetailsViewShown = articleDetailsView.waitForExistence(timeout: 5)

            XCTAssert(articleDetailsViewShown)
        }
    
}
