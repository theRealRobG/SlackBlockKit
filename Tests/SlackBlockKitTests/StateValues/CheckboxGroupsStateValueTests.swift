import SlackBlockKit
import XCTest

private let checkboxNoSelection = """
{
  "type": "checkboxes",
  "selected_options": []
}
"""

private let checkboxSingleSelection = """
{
  "type": "checkboxes",
  "selected_options": [
    {
      "text": {
        "type": "mrkdwn",
        "text": "*this is mrkdwn text*",
        "verbatim": false
      },
      "value": "value-1",
      "description": {
        "type": "mrkdwn",
        "text": "*this is mrkdwn text*",
        "verbatim": false
      }
    }
  ]
}
"""

private let checkboxMultiSelection = """
{
  "type": "checkboxes",
  "selected_options": [
    {
      "text": {
        "type": "mrkdwn",
        "text": "*this is mrkdwn text*"
      },
      "value": "value-0"
    },
    {
      "text": {
        "type": "mrkdwn",
        "text": "*this is mrkdwn text*"
      },
      "value": "value-1"
    }
  ]
}
"""

class CheckboxGroupsStateValueTests: XCTestCase {
    var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonDecoder = JSONDecoder()
    }
    
    func test_checkbox_noSelection() throws {
        let checkboxState = try jsonDecoder.decode(CheckboxGroupsStateValue.self, from: checkboxNoSelection)
        let expectedCheckboxState = CheckboxGroupsStateValue(selectedOptions: [])
        XCTAssertEqual(checkboxState, expectedCheckboxState)
    }
    
    func test_checkbox_oneSelection() throws {
        let checkboxState = try jsonDecoder.decode(CheckboxGroupsStateValue.self, from: checkboxSingleSelection)
        let expectedCheckboxState = CheckboxGroupsStateValue(
            selectedOptions: [
                StateValueSelectedOption(
                    text: TextObject(type: .mrkdwn, text: "*this is mrkdwn text*", verbatim: false),
                    value: "value-1",
                    description: TextObject(type: .mrkdwn, text: "*this is mrkdwn text*", verbatim: false)
                )
            ]
        )
        XCTAssertEqual(checkboxState, expectedCheckboxState)
    }
    
    func test_checkbox_multiSelection() throws {
        let checkboxState = try jsonDecoder.decode(CheckboxGroupsStateValue.self, from: checkboxMultiSelection)
        let expectedCheckboxState = CheckboxGroupsStateValue(
            selectedOptions: [
                StateValueSelectedOption(
                    text: TextObject(type: .mrkdwn, text: "*this is mrkdwn text*"),
                    value: "value-0"
                ),
                StateValueSelectedOption(
                    text: TextObject(type: .mrkdwn, text: "*this is mrkdwn text*"),
                    value: "value-1"
                )
            ]
        )
        XCTAssertEqual(checkboxState, expectedCheckboxState)
    }
}
