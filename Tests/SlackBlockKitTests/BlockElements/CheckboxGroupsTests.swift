import SlackBlockKit
import XCTest

// https://api.slack.com/reference/block-kit/block-elements#checkboxes__example
private let groupOfCheckboxes = """
{
    "type": "checkboxes",
    "action_id": "this_is_an_action_id",
    "initial_options": [{
        "value": "A1",
        "text": {
            "type": "plain_text",
            "text": "Checkbox 1"
        }
    }],
    "options": [
        {
            "value": "A1",
            "text": {
                "type": "plain_text",
                "text": "Checkbox 1"
            }
        },
        {
            "value": "A2",
            "text": {
                "type": "plain_text",
                "text": "Checkbox 2"
            }
        }
    ]
}
"""

class CheckboxGroupsTests: BlockElementTestCase {
    func test_groupOfCheckboxes() {
        let expectedCheckbox = CheckboxGroups(
            actionId: "this_is_an_action_id",
            options: [
                OptionObject(
                    text: TextObject(
                        type: .plainText,
                        text: "Checkbox 1"
                    ),
                    value: "A1"
                ),
                OptionObject(
                    text: TextObject(
                        type: .plainText,
                        text: "Checkbox 2"
                    ),
                    value: "A2"
                )
            ],
            initialOptions: [
                OptionObject(
                    text: TextObject(
                        type: .plainText,
                        text: "Checkbox 1"
                    ),
                    value: "A1"
                )
            ]
        )
        
        testCodableEquality(block: expectedCheckbox, jsonString: groupOfCheckboxes)
    }
}
