import SlackBlockKit

// https://api.slack.com/reference/block-kit/block-elements#overflow__example
private let overflowMenu = """
{
    "type": "overflow",
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
        },
        {
            "text": {
                "type": "plain_text",
                "text": "*this is plain_text text*"
            },
            "value": "value-3"
        },
        {
            "text": {
                "type": "plain_text",
                "text": "*this is plain_text text*"
            },
            "value": "value-4"
        }
    ],
    "action_id": "overflow"
}
"""

class OverflowMenuElementTests: BlockTestCase {
    func test_overflowMenu() {
        let expectedOverflowMenu = OverflowMenuElement(
            actionId: "overflow",
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
                ),
                OptionObject(
                    text: TextObject(type: .plainText, text: "*this is plain_text text*"),
                    value: "value-3"
                ),
                OptionObject(
                    text: TextObject(type: .plainText, text: "*this is plain_text text*"),
                    value: "value-4"
                )
            ]
        )
        testCodableEquality(block: expectedOverflowMenu, jsonString: overflowMenu)
    }
}
