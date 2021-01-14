import SlackBlockKit
import XCTest

let appHomeOpened = """
{
  "type": "app_home_opened",
  "user": "U061F7AUR",
  "event_ts": "1515449522000016",
  "tab": "home",
  "view": {
    "type": "home",
    "blocks": [
      {
        "accessory": {
          "action_id": "home-action-1234",
          "type": "plain_text_input"
        },
        "block_id": "home-1234",
        "text": {
          "text": "test-text",
          "type": "plain_text"
        },
        "type": "section"
      }
    ],
    "private_metadata": "",
    "callback_id": "",
    "state": {
      "values": {
        "home-1234": {
          "home-action-1234": {
            "type": "plain_text_input",
            "value": "test-input"
          }
        }
      }
    },
    "external_id": ""
  }
}
"""

class AppHomeOpenedEventTests: BlockTestCase {
    func test_appHomeOpened() throws {
        var homeTabView = HomeTabView(
            blocks: [
                SectionBlock(
                    text: TextObject(type: .plainText, text: "test-text"),
                    blockId: "home-1234",
                    accessory: PlainTextInputElement(actionId: "home-action-1234")
                )
            ],
            privateMetadata: "",
            callbackId: "",
            externalId: ""
        )
        homeTabView.state = ViewState(
            values: [
                "home-1234": [
                    "home-action-1234": PlainTextInputStateValue(value: "test-input")
                ]
            ]
        )
        let appHomeOpenedEvent = AppHomeOpenedEvent(
            user: "U061F7AUR",
            eventTs: "1515449522000016",
            tab: "home",
            view: homeTabView
        )
        testCodableEquality(event: appHomeOpenedEvent, jsonString: appHomeOpened)
    }
}
