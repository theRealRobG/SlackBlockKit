import SlackBlockKit

// https://api.slack.com/reference/interaction-payloads/views#view_closed__example
private let viewSubmission = """
{
  "type": "view_closed",
  "team": {
    "id": "TXXXXXX",
    "domain": "coverbands"
  },
  "user": {
    "id": "UXXXXXX",
    "name": "dreamweaver"
  },
  "token": "Shh_its_a_seekrit",
  "view": {
    "id": "V1234567890",
    "team_id": "T01ER49MBU2",
    "type": "modal",
    "blocks": [
      {
        "type": "input",
        "block_id": "zCB",
        "label": {
          "type": "plain_text",
          "text": "Label",
          "emoji": true
        },
        "optional": false,
        "dispatch_action": false,
        "element": {
          "type": "plain_text_input",
          "action_id": "plain_text_input-action",
          "dispatch_action_config": {
            "trigger_actions_on": [
              "on_enter_pressed"
            ]
          }
        }
      }
    ],
    "private_metadata": "",
    "callback_id": "",
    "state": {
      "values": {
        "zCB": {
          "plain_text_input-action": {
            "type": "plain_text_input",
            "value": "Test input."
          }
        }
      }
    },
    "hash": "1609700657.dL8yRBeO",
    "title": {
      "type": "plain_text",
      "text": "My App",
      "emoji": true
    },
    "clear_on_close": false,
    "notify_on_close": false,
    "close": {
      "type": "plain_text",
      "text": "Cancel",
      "emoji": true
    },
    "submit": {
      "type": "plain_text",
      "text": "Submit",
      "emoji": true
    },
    "root_view_id": "V1234567890",
    "app_id": "A02",
    "external_id": "",
    "app_installed_team_id": "T01ER49MBU2",
    "bot_id": "B00"
  },
  "api_app_id": "AXXXXXX",
  "is_cleared": false
}
"""

class ViewClosedEventTests: BlockTestCase {
    func test_viewClosedEvent() {
        var modalView = ModalView(
            title: TextObject(
                type: .plainText,
                text: "My App",
                emoji: true
            ),
            blocks: [
                InputBlock(
                    label: TextObject(
                        type: .plainText,
                        text: "Label",
                        emoji: true
                    ),
                    element: PlainTextInputElement(
                        actionId: "plain_text_input-action",
                        dispatchActionConfig: DispatchActionConfiguration(
                            triggerActionsOn: [.onEnterPressed]
                        )
                    ),
                    dispatchAction: false,
                    blockId: "zCB",
                    optional: false
                )
            ],
            close: TextObject(
                type: .plainText,
                text: "Cancel",
                emoji: true
            ),
            submit: TextObject(
                type: .plainText,
                text: "Submit",
                emoji: true
            ),
            privateMetadata: "",
            callbackId: "",
            clearOnClose: false,
            notifyOnClose: false,
            externalId: ""
        )
        modalView.state = ViewState(
            values: [
                "zCB": [
                    "plain_text_input-action": PlainTextInputStateValue(value: "Test input.")
                ]
            ]
        )
        modalView.hash = "1609700657.dL8yRBeO"
        modalView.appId = "A02"
        modalView.appInstalledTeamId = "T01ER49MBU2"
        modalView.botId = "B00"
        modalView.id = "V1234567890"
        modalView.rootViewId = "V1234567890"
        modalView.teamId = "T01ER49MBU2"
        var viewSubmissionEvent = ViewClosedEvent(
            token: "Shh_its_a_seekrit",
            team: SlackTeam(id: "TXXXXXX", domain: "coverbands"),
            user: SlackUser(id: "UXXXXXX", name: "dreamweaver"),
            view: modalView,
            isCleared: false
        )
        viewSubmissionEvent.apiAppId = "AXXXXXX"
        testCodableEquality(event: viewSubmissionEvent, jsonString: viewSubmission)
    }
}
