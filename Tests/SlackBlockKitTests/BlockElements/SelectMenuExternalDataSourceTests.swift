import SlackBlockKit

// https://api.slack.com/reference/block-kit/block-elements#external_select__example
private let externalSourceSelect = """
{
    "action_id": "text1234",
    "type": "external_select",
    "placeholder": {
        "type": "plain_text",
        "text": "Select an item"
    },
    "min_query_length": 3
}
"""

class SelectMenuExternalDataSourceTests: BlockTestCase {
    func test_externalSourceSelect() {
        let expectedSelect = SelectMenuExternalDataSource(
            placeholder: TextObject(
                type: .plainText,
                text: "Select an item"
            ),
            actionId: "text1234",
            minQueryLength: 3
        )
        testCodableEquality(block: expectedSelect, jsonString: externalSourceSelect)
    }
}
