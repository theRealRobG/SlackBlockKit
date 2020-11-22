import SlackBlockKit

// https://api.slack.com/reference/block-kit/block-elements#channel_multi_select__example
private let channelsListSelect = """
{
    "action_id": "text1234",
    "type": "multi_channels_select",
    "placeholder": {
        "type": "plain_text",
        "text": "Select channels"
    }
}
"""

class MultiSelectMenuPublicChannelsListTests: BlockElementTestCase {
    func test_channelsListSelect() {
        let expectedMultiSelect = MultiSelectMenuPublicChannelsList(
            placeholder: TextObject(
                type: .plainText,
                text: "Select channels"
            ),
            actionId: "text1234"
        )
        testCodableEquality(block: expectedMultiSelect, jsonString: channelsListSelect)
    }
}
