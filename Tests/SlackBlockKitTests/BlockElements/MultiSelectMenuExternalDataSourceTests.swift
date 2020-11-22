import SlackBlockKit

// https://api.slack.com/reference/block-kit/block-elements#external_multi_select__example
private let externalDataSourceSelect = """
{
    "action_id": "text1234",
    "type": "multi_external_select",
    "placeholder": {
        "type": "plain_text",
        "text": "Select items"
    },
    "min_query_length": 3
}
"""

class MultiSelectMenuExternalDataSourceTests: BlockTestCase {
    func test_externalDataSourceSelect() {
        let expectedMultiSelect = MultiSelectMenuExternalDataSource(
            placeholder: TextObject(
                type: .plainText,
                text: "Select items"
            ),
            actionId: "text1234",
            minQueryLength: 3
        )
        testCodableEquality(block: expectedMultiSelect, jsonString: externalDataSourceSelect)
    }
}
