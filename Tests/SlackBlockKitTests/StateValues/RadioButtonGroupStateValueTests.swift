import SlackBlockKit
import XCTest

let radioGroupNoSelection = """
{
  "selected_option" : null,
  "type" : "radio_buttons"
}
"""

let radioGroupWithSelection = """
{
  "selected_option" : {
    "text" : {
      "emoji" : true,
      "text" : "*this is plain_text text*",
      "type" : "plain_text"
    },
    "value" : "value-2"
  },
  "type" : "radio_buttons"
}
"""

class RadioButtonGroupStateValueTests: XCTestCase {
    var jsonEncoder: JSONEncoder!
    var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        jsonDecoder = JSONDecoder()
    }
    
    func test_radioGroup_noSelection_encode() throws {
        let radioGroup = try jsonEncoder.encodeAsString(RadioButtonGroupStateValue(selectedOption: nil))
        XCTAssertEqual(radioGroup, radioGroupNoSelection)
    }
    
    func test_radioGroup_noSelection_decode() throws {
        let expectedRadioGroup = RadioButtonGroupStateValue(selectedOption: nil)
        let radioGroup = try jsonDecoder.decode(RadioButtonGroupStateValue.self, from: radioGroupNoSelection)
        XCTAssertEqual(radioGroup, expectedRadioGroup)
    }
    
    func test_radioGroup_withSelection_encode() throws {
        let radioGroup = try jsonEncoder.encodeAsString(
            RadioButtonGroupStateValue(
                selectedOption: StateValueSelectedOption(
                    text: TextObject(type: .plainText, text: "*this is plain_text text*", emoji: true),
                    value: "value-2"
                )
            )
        )
        XCTAssertEqual(radioGroup, radioGroupWithSelection)
    }
    
    func test_radioGroup_withSelection_decode() throws {
        let expectedRadioGroup = RadioButtonGroupStateValue(
            selectedOption: StateValueSelectedOption(
                text: TextObject(type: .plainText, text: "*this is plain_text text*", emoji: true),
                value: "value-2"
            )
        )
        let radioGroup = try jsonDecoder.decode(RadioButtonGroupStateValue.self, from: radioGroupWithSelection)
        XCTAssertEqual(radioGroup, expectedRadioGroup)
    }
}
