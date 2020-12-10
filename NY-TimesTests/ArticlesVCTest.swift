//
//  ArticlesVCTest.swift
//  NY-TimesTests
//
//  Created by Hadeer Kamel on 12/10/20.
//

import XCTest
@testable import NY_Times

class ArticlesVCTest: XCTestCase {
    var view : ArticlesVC!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        view = ArticlesVC()
        
        view.beginAppearanceTransition(true, animated: false)
        
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        view.endAppearanceTransition()
    }

   
    
    
    

}
