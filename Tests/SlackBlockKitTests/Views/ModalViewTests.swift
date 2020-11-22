import SlackBlockKit

// https://api.slack.com/reference/surfaces/views#reference-guide-defining-view-objects__examples
private let modalView = """
{
  "type": "modal",
  "title": {
    "type": "plain_text",
    "text": "Modal title"
  },
  "blocks": [
    {
      "type": "section",
      "text": {
        "type": "mrkdwn",
        "text": "It's Block Kit...but _in a modal_"
      },
      "block_id": "section1",
      "accessory": {
        "type": "button",
        "text": {
          "type": "plain_text",
          "text": "Click me"
        },
        "action_id": "button_abc",
        "value": "Button value",
        "style": "danger"
      }
    },
    {
      "type": "input",
      "label": {
        "type": "plain_text",
        "text": "Input label"
      },
      "element": {
        "type": "plain_text_input",
        "action_id": "input1",
        "placeholder": {
          "type": "plain_text",
          "text": "Type in here"
        },
        "multiline": false
      },
      "optional": false
    }
  ],
  "close": {
    "type": "plain_text",
    "text": "Cancel"
  },
  "submit": {
    "type": "plain_text",
    "text": "Save"
  },
  "private_metadata": "Shhhhhhhh",
  "callback_id": "view_identifier_12"
}
"""

class ModalViewTests: BlockTestCase {
    func test_modalView() {
        let expectedModal = ModalView(
            title: TextObject(type: .plainText, text: "Modal title"),
            blocks: [
                SectionBlock(
                    text: TextObject(
                        type: .mrkdwn,
                        text: "It's Block Kit...but _in a modal_"
                    ),
                    blockId: "section1",
                    accessory: ButtonElement(
                        text: TextObject(type: .plainText, text: "Click me"),
                        actionId: "button_abc",
                        value: "Button value",
                        style: .danger
                    )
                ),
                InputBlock(
                    label: TextObject(type: .plainText, text: "Input label"),
                    element: PlainTextInputElement(
                        actionId: "input1",
                        placeholder: TextObject(type: .plainText, text: "Type in here"),
                        multiline: false
                    ),
                    optional: false
                )
            ],
            close: TextObject(type: .plainText, text: "Cancel"),
            submit: TextObject(type: .plainText, text: "Save"),
            privateMetadata: "Shhhhhhhh",
            callbackId: "view_identifier_12"
        )
        testCodableEquality(view: expectedModal, jsonString: modalView)
    }
}
