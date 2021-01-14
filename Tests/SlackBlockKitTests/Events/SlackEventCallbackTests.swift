import SlackBlockKit

private let eventCallback = """
{
  "token": "XXYYZZ",
  "team_id": "TXXXXXXXX",
  "api_app_id": "AXXXXXXXXX",
  "event": {
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
  },
  "type": "event_callback",
  "authed_users": [
    "UXXXXXXX1"
  ],
  "authed_teams": [
    "TXXXXXXXX"
  ],
  "authorizations": {
    "enterprise_id": "E12345",
    "team_id": "T12345",
    "user_id": "U12345",
    "is_bot": false
  },
  "event_context": "EC12345",
  "event_id": "Ev08MFMKH6",
  "event_time": 1234567890
}
"""

class SlackEventCallbackTests: BlockTestCase {
    func test_slackEventCallback_withAppHomeOpened() {
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
        let slackEventCallback = SlackEventCallback(
            token: "XXYYZZ",
            teamId: "TXXXXXXXX",
            event: appHomeOpenedEvent,
            eventId: "Ev08MFMKH6",
            eventTime: 1234567890,
            apiAppId: "AXXXXXXXXX",
            authedUsers: ["UXXXXXXX1"],
            authedTeams: ["TXXXXXXXX"],
            authorizations: SlackAuthorizations(enterpriseId: "E12345", teamId: "T12345", userId: "U12345", isBot: false),
            eventContext: "EC12345"
        )
        testCodableEquality(event: slackEventCallback, jsonString: eventCallback)
    }
}
