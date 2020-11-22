import SlackBlockKit

// https://api.slack.com/reference/block-kit/block-elements#static_multi_select__example
private let staticMultiSelectMenu = """
{
    "action_id": "text1234",
    "type": "multi_static_select",
    "placeholder": {
        "type": "plain_text",
        "text": "Select items"
    },
    "options": [
        {
            "text": {
                "type": "plain_text",
                "text": "*this is plain_text text*"
            },
            "value": "value-0"
        },
        {
            "text": {
                "type": "plain_text",
                "text": "*this is plain_text text*"
            },
            "value": "value-1"
        },
        {
            "text": {
                "type": "plain_text",
                "text": "*this is plain_text text*"
            },
            "value": "value-2"
        }
    ]
}
"""

class MultiSelectMenuStaticOptionsTests: BlockTestCase {
    func test_staticMultiSelectMenu() {
        let expectedStaticMultiSelect = MultiSelectMenuStaticOptions(
            placeholder: TextObject(
                type: .plainText,
                text: "Select items"
            ),
            actionId: "text1234",
            options: [
                OptionObject(
                    text: TextObject(
                        type: .plainText,
                        text: "*this is plain_text text*"
                    ),
                    value: "value-0"
                ),
                OptionObject(
                    text: TextObject(
                        type: .plainText,
                        text: "*this is plain_text text*"
                    ),
                    value: "value-1"
                ),
                OptionObject(
                    text: TextObject(
                        type: .plainText,
                        text: "*this is plain_text text*"
                    ),
                    value: "value-2"
                )
            ]
        )
        testCodableEquality(block: expectedStaticMultiSelect, jsonString: staticMultiSelectMenu)
    }
}
