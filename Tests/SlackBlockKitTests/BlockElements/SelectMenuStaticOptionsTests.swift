import SlackBlockKit

// https://api.slack.com/reference/block-kit/block-elements#static_select__example
private let staticSelectMenu = """
{
    "action_id": "text1234",
    "type": "static_select",
    "placeholder": {
        "type": "plain_text",
        "text": "Select an item"
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

class SelectMenuStaticOptionsTests: BlockTestCase {
    func test_staticSelectMenu() {
        let expectedSelectMenu = SelectMenuStaticOptions(
            placeholder: TextObject(
                type: .plainText,
                text: "Select an item"
            ),
            actionId: "text1234",
            options: [
                OptionObject(
                    text: TextObject(type: .plainText, text: "*this is plain_text text*"),
                    value: "value-0"
                ),
                OptionObject(
                    text: TextObject(type: .plainText, text: "*this is plain_text text*"),
                    value: "value-1"
                ),
                OptionObject(
                    text: TextObject(type: .plainText, text: "*this is plain_text text*"),
                    value: "value-2"
                )
            ]
        )
        testCodableEquality(block: expectedSelectMenu, jsonString: staticSelectMenu)
    }
}
