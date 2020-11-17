import XCTest
@testable import SlackBlockKit

final class SlackBlockKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SlackBlockKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
