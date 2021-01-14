import SlackBlockKit
import XCTest

private let selectMenuNoSelection = """
{
  "selected_option" : null,
  "type" : "static_select"
}
"""

private let selectMenuWithSelection = """
{
  "selected_option" : {
    "text" : {
      "text" : "*this is plain_text text*",
      "type" : "plain_text"
    },
    "value" : "value-0"
  },
  "type" : "static_select"
}
"""

class SelectMenuStaticOptionsStateValueTests: XCTestCase {
    var jsonEncoder: JSONEncoder!
    var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        jsonDecoder = JSONDecoder()
    }
    
    func test_selectMenu_noSelection_encode() throws {
        let selection = SelectMenuStaticOptionsStateValue(selectedOption: nil)
        try XCTAssertEqual(jsonEncoder.encodeAsString(selection), selectMenuNoSelection)
    }
    
    func test_selectMenu_noSelection_decode() throws {
        let expectedSelection = SelectMenuStaticOptionsStateValue(selectedOption: nil)
        let selection = try jsonDecoder.decode(
            SelectMenuStaticOptionsStateValue.self,
            from: selectMenuNoSelection
        )
        XCTAssertEqual(selection, expectedSelection)
    }
    
    func test_selectMenu_withSelection_encode() throws {
        let selection = SelectMenuStaticOptionsStateValue(
            selectedOption: StateValueSelectedOption(
                text: TextObject(type: .plainText, text: "*this is plain_text text*"),
                value: "value-0"
            )
        )
        try XCTAssertEqual(jsonEncoder.encodeAsString(selection), selectMenuWithSelection)
    }
    
    func test_selectMenu_withSelection_decode() throws {
        let expectedSelection = SelectMenuStaticOptionsStateValue(
            selectedOption: StateValueSelectedOption(
                text: TextObject(type: .plainText, text: "*this is plain_text text*"),
                value: "value-0"
            )
        )
        let selection = try jsonDecoder.decode(
            SelectMenuStaticOptionsStateValue.self,
            from: selectMenuWithSelection
        )
        XCTAssertEqual(selection, expectedSelection)
    }
}
