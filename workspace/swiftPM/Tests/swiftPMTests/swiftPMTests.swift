import XCTest
@testable import swiftPM

class swiftPMTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(swiftPM().text, "Hello, World!")
    }


    static var allTests : [(String, (swiftPMTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
