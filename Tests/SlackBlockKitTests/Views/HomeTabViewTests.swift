import SlackBlockKit

// https://api.slack.com/reference/surfaces/views#reference-guide-defining-view-objects__examples
private let homeTabView = """
{
   "type":"home",
   "blocks":[
      {
         "type":"section",
         "text":{
            "type":"mrkdwn",
            "text":"A simple stack of blocks for the simple sample Block Kit Home tab."
         }
      },
      {
         "type":"actions",
         "elements":[
            {
               "type":"button",
               "text":{
                  "type":"plain_text",
                  "text":"Action A",
                  "emoji":true
               }
            },
            {
               "type":"button",
               "text":{
                  "type":"plain_text",
                  "text":"Action B",
                  "emoji":true
               }
            }
         ]
      }
   ]
}
"""

private let homeTabViewWithState = """
{
  "type": "home",
  "blocks": [
    {
      "type": "section",
      "text": {
        "type": "mrkdwn",
        "text": "Example built using `app.slack.com/block-kit-builder`"
      }
    },
    {
      "type": "section",
      "text": {
        "type": "mrkdwn",
        "text": "This is a section block with checkboxes."
      },
      "accessory": {
        "type": "checkboxes",
        "options": [
          {
            "text": {
              "type": "mrkdwn",
              "text": "*this is mrkdwn text*"
            },
            "description": {
              "type": "mrkdwn",
              "text": "*this is mrkdwn text*"
            },
            "value": "value-0"
          },
          {
            "text": {
              "type": "mrkdwn",
              "text": "*this is mrkdwn text*"
            },
            "description": {
              "type": "mrkdwn",
              "text": "*this is mrkdwn text*"
            },
            "value": "value-1"
          }
        ],
        "action_id": "checkboxes-action"
      }
    },
    {
      "type": "input",
      "element": {
        "type": "multi_users_select",
        "placeholder": {
          "type": "plain_text",
          "text": "Select users"
        },
        "action_id": "multi_users_select-action"
      },
      "label": {
        "type": "plain_text",
        "text": "Label"
      }
    }
  ],
  "state": {
    "values": {
      "5GC": {
        "multi_users_select-action": {
          "type": "multi_users_select",
          "selected_users": [
            "U01ERACBV43"
          ]
        }
      },
      "zS3q": {
        "checkboxes-action": {
          "type": "checkboxes",
          "selected_options": [
            {
              "text": {
                "type": "mrkdwn",
                "text": "*this is mrkdwn text*",
                "verbatim": false
              },
              "value": "value-0",
              "description": {
                "type": "mrkdwn",
                "text": "*this is mrkdwn text*",
                "verbatim": false
              }
            }
          ]
        }
      }
    }
  }
}
"""

class HomeTabViewTests: BlockTestCase {
    func test_homeTabView() {
        let expectedHomeTab = HomeTabView(
            blocks: [
                SectionBlock(
                    text: TextObject(
                        type: .mrkdwn,
                        text: "A simple stack of blocks for the simple sample Block Kit Home tab."
                    )
                ),
                ActionsBlock(
                    elements: [
                        ButtonElement(
                            text: TextObject(
                                type: .plainText,
                                text: "Action A",
                                emoji: true
                            )
                        ),
                        ButtonElement(
                            text: TextObject(
                                type: .plainText,
                                text: "Action B",
                                emoji: true
                            )
                        )
                    ]
                )
            ]
        )
        testCodableEquality(view: expectedHomeTab, jsonString: homeTabView)
    }
    
    func test_homeTabViewWithState() {
        var expectedHomeTab = HomeTabView(
            blocks: [
                SectionBlock(
                    text: TextObject(
                        type: .mrkdwn,
                        text: "Example built using `app.slack.com/block-kit-builder`"
                    )
                ),
                SectionBlock(
                    text: TextObject(
                        type: .mrkdwn,
                        text: "This is a section block with checkboxes."
                    ),
                    accessory: CheckboxGroups(
                        actionId: "checkboxes-action",
                        options: [
                            OptionObject(
                                text: TextObject(type: .mrkdwn, text: "*this is mrkdwn text*"),
                                value: "value-0",
                                description: TextObject(type: .mrkdwn, text: "*this is mrkdwn text*")
                            ),
                            OptionObject(
                                text: TextObject(type: .mrkdwn, text: "*this is mrkdwn text*"),
                                value: "value-1",
                                description: TextObject(type: .mrkdwn, text: "*this is mrkdwn text*")
                            )
                        ]
                    )
                ),
                InputBlock(
                    label: TextObject(type: .plainText, text: "Label"),
                    element: MultiSelectMenuUserList(
                        placeholder: TextObject(type: .plainText, text: "Select users"),
                        actionId: "multi_users_select-action"
                    )
                )
            ]
        )
        expectedHomeTab.state = ViewState(
            values: [
                "5GC": [
                    "multi_users_select-action": MultiSelectMenuUserListStateValue(
                        selectedUsers: ["U01ERACBV43"]
                    )
                ],
                "zS3q": [
                    "checkboxes-action": CheckboxGroupsStateValue(
                        selectedOptions: [
                            StateValueSelectedOption(
                                text: TextObject(type: .mrkdwn, text: "*this is mrkdwn text*", verbatim: false),
                                value: "value-0",
                                description: TextObject(type: .mrkdwn, text: "*this is mrkdwn text*", verbatim: false)
                            )
                        ]
                    )
                ]
            ]
        )
        testCodableEquality(view: expectedHomeTab, jsonString: homeTabViewWithState)
    }
}
