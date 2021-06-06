//
//  RepositoryViewModelTest.swift
//  Naman_Sheth_ViacomTests
//
//  Created by Naman Sheth on 07/06/21.
//

import XCTest
@testable import Naman_Sheth_Viacom

class RepositoryViewModelTest: XCTestCase {
    var repositoryViewModel: RepositoryViewModel? = RepositoryViewModel()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            self.checkEmptyResponseIfSearchTextIsEmpty()
            self.checkIfResponse()
        }
    }
    
    func checkEmptyResponseIfSearchTextIsEmpty() {
        repositoryViewModel?.searchRepository(with: "", filter: "stars", paging: "1")
        XCTAssertTrue(repositoryViewModel?.repositoryObject.count == 0)
    }
    
    func checkIfResponse() {
        repositoryViewModel?.searchRepository(with: "swift", filter: "stars", paging: "1")
        repositoryViewModel?.bindViewModelToController = {
            XCTAssertTrue(self.repositoryViewModel?.repositoryObject.count != 0)
        }
    }

}
