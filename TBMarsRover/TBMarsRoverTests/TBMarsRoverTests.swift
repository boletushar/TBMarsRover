//
//  TBMarsRoverTests.swift
//  TBMarsRoverTests
//
//  Created by BOLE, Tushar on 21/11/19.
//  Copyright © 2019 BOLE, Tushar. All rights reserved.
//

import XCTest
@testable import TBMarsRover

class TBMarsRoverTests: XCTestCase {

    var presenter: MarsViewPresenting?
    var mockDisplay: MockMarsViewDisplay!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        mockDisplay = MockMarsViewDisplay()
        presenter = MarsViewPresenter(display: mockDisplay)
        presenter?.processInput("5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM")
        presenter?.updateOutput()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        presenter = nil
    }

    func testMeshBounds() {

        XCTAssertEqual(mockDisplay.xBound, 5)
        XCTAssertEqual(mockDisplay.yBound, 5)
    }

    func testRoverData() {

        XCTAssertEqual(mockDisplay.rovers?.count, 2)

        let rover1 = mockDisplay.rovers?.first
        XCTAssertEqual(rover1?.xPos, 1)
        XCTAssertEqual(rover1?.yPos, 2)
        XCTAssertEqual(rover1?.direction.text, "N")

        let rover2 = mockDisplay.rovers?.last
        XCTAssertEqual(rover2?.xPos, 3)
        XCTAssertEqual(rover2?.yPos, 3)
        XCTAssertEqual(rover2?.direction.text, "E")
    }

    func testFinalPosition() {

        sleep(1)
        XCTAssertEqual(mockDisplay.outputText, "1 3 N\n5 1 E\n")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
