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
}
