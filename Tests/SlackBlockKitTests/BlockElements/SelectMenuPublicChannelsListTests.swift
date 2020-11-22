import SlackBlockKit

// https://api.slack.com/reference/block-kit/block-elements#channel_select__example
private let channelsSelect = """
{
    "action_id": "text1234",
    "type": "channels_select",
    "placeholder": {
        "type": "plain_text",
        "text": "Select an item"
    }
}
"""

class SelectMenuPublicChannelsListTests: BlockElementTestCase {
    func test_channelsSelect() {
        let expectedSelect = SelectMenuPublicChannelsList(
            placeholder: TextObject(
                type: .plainText,
                text: "Select an item"
            ),
            actionId: "text1234"
        )
        testCodableEquality(block: expectedSelect, jsonString: channelsSelect)
    }
}
