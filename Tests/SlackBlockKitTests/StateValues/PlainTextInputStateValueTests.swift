import SlackBlockKit
import XCTest

private let inputNoValue = """
{
  "type" : "plain_text_input",
  "value" : null
}
"""

private let inputWithValue = """
{
  "type" : "plain_text_input",
  "value" : "Hello, World!"
}
"""

class PlainTextInputStateValueTests: XCTestCase {
    var jsonEncoder: JSONEncoder!
    var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        jsonDecoder = JSONDecoder()
    }
    
    func test_plainTextInput_noValue_decode() throws {
        let stateValue = try jsonDecoder.decode(PlainTextInputStateValue.self, from: inputNoValue)
        let expectedState = PlainTextInputStateValue(value: nil)
        XCTAssertEqual(stateValue, expectedState)
    }
    
    func test_plainTextInput_noValue_encode() throws {
        let encodedState = try jsonEncoder.encodeAsString(PlainTextInputStateValue(value: nil))
        XCTAssertEqual(encodedState, inputNoValue)
    }
    
    func test_painTextInput_withValue_decode() throws {
        let stateValue = try jsonDecoder.decode(PlainTextInputStateValue.self, from: inputWithValue)
        let expectedState = PlainTextInputStateValue(value: "Hello, World!")
        XCTAssertEqual(stateValue, expectedState)
    }
    
    func test_painTextInput_withValue_encode() throws {
        let encodedState = try jsonEncoder.encodeAsString(PlainTextInputStateValue(value: "Hello, World!"))
        XCTAssertEqual(encodedState, inputWithValue)
    }
}
