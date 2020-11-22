import SlackBlockKit

// https://api.slack.com/reference/block-kit/block-elements#radio__example
private let radioButtons = """
{
    "type": "radio_buttons",
    "action_id": "this_is_an_action_id",
    "initial_option": {
        "value": "A1",
        "text": {
            "type": "plain_text",
            "text": "Radio 1"
        }
    },
    "options": [
        {
            "value": "A1",
            "text": {
                "type": "plain_text",
                "text": "Radio 1"
            }
        },
        {
            "value": "A2",
            "text": {
                "type": "plain_text",
                "text": "Radio 2"
            }
        }
    ]
}
"""

class RadioButtonGroupElementTests: BlockElementTestCase {
    func test_radioButtons() {
        let expectedRadioButtons = RadioButtonGroupElement(
            actionId: "this_is_an_action_id",
            options: [
                OptionObject(
                    text: TextObject(type: .plainText, text: "Radio 1"),
                    value: "A1"
                ),
                OptionObject(
                    text: TextObject(type: .plainText, text: "Radio 2"),
                    value: "A2"
                )
            ],
            initialOption: OptionObject(
                text: TextObject(type: .plainText, text: "Radio 1"),
                value: "A1"
            )
        )
        testCodableEquality(block: expectedRadioButtons, jsonString: radioButtons)
    }
}
