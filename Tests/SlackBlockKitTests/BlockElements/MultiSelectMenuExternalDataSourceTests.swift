import SlackBlockKit
import XCTest

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

class MultiSelectMenuExternalDataSourceTests: BlockElementTestCase {
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
