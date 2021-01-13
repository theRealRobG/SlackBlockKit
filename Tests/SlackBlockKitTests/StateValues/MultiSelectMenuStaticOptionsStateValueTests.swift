import SlackBlockKit
import XCTest

private let multiSelectStaticOptionsNoSelection = """
{
  "type": "multi_static_select",
  "selected_options": []
}
"""

private let multiSelectStaticOptionsSingleSelection = """
{
  "type": "multi_static_select",
  "selected_options": [
    {
      "text": {
        "type": "plain_text",
        "text": "this is plain text",
        "emoji": true
      },
      "value": "value-2",
      "description": {
        "type": "plain_text",
        "text": "this is plain text",
        "emoji": true
      }
    }
  ]
}
"""

private let multiSelectStaticOptionsMultiSelection = """
{
  "type": "multi_static_select",
  "selected_options": [
    {
      "text": {
        "type": "plain_text",
        "text": "this is plain text"
      },
      "value": "value-0"
    },
    {
      "text": {
        "type": "plain_text",
        "text": "this is plain text"
      },
      "value": "value-2"
    }
  ]
}
"""

class MultiSelectMenuStaticOptionsStateValueTests: XCTestCase {
    var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonDecoder = JSONDecoder()
    }
    
    func test_multiSelectStaticOptions_noSelection() throws {
        let multiSelectState = try jsonDecoder.decode(MultiSelectMenuStaticOptionsStateValue.self, from: multiSelectStaticOptionsNoSelection)
        let expectedState = MultiSelectMenuStaticOptionsStateValue(selectedOptions: [])
        XCTAssertEqual(multiSelectState, expectedState)
    }
    
    func test_multiSelectStaticOptions_oneSelection() throws {
        let multiSelectState = try jsonDecoder.decode(MultiSelectMenuStaticOptionsStateValue.self, from: multiSelectStaticOptionsSingleSelection)
        let expectedState = MultiSelectMenuStaticOptionsStateValue(
            selectedOptions: [
                StateValueSelectedOption(
                    text: TextObject(type: .plainText, text: "this is plain text", emoji: true),
                    value: "value-2",
                    description: TextObject(type: .plainText, text: "this is plain text", emoji: true)
                )
            ]
        )
        XCTAssertEqual(multiSelectState, expectedState)
    }
    
    func test_multiSelectStaticOptions_multiSelection() throws {
        let multiSelectState = try jsonDecoder.decode(MultiSelectMenuStaticOptionsStateValue.self, from: multiSelectStaticOptionsMultiSelection)
        let expectedState = MultiSelectMenuStaticOptionsStateValue(
            selectedOptions: [
                StateValueSelectedOption(
                    text: TextObject(type: .plainText, text: "this is plain text"),
                    value: "value-0"
                ),
                StateValueSelectedOption(
                    text: TextObject(type: .plainText, text: "this is plain text"),
                    value: "value-2"
                )
            ]
        )
        XCTAssertEqual(multiSelectState, expectedState)
    }
}
