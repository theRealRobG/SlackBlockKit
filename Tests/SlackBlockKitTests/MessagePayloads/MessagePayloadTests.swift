import SlackBlockKit

// https://api.slack.com/reference/messaging/attachments#example
private let messageWithAttachment = """
{
    "channel": "ABCDEBF1",
    "attachments": [
        {
            "mrkdwn_in": ["text"],
            "color": "#36a64f",
            "pretext": "Optional pre-text that appears above the attachment block",
            "author_name": "author_name",
            "author_link": "http://flickr.com/bobby/",
            "author_icon": "https://placeimg.com/16/16/people",
            "title": "title",
            "title_link": "https://api.slack.com/",
            "text": "Optional `text` that appears within the attachment",
            "fields": [
                {
                    "title": "A field's title",
                    "value": "This field's value",
                    "short": false
                },
                {
                    "title": "A short field's title",
                    "value": "A short field's value",
                    "short": true
                },
                {
                    "title": "A second short field's title",
                    "value": "A second short field's value",
                    "short": true
                }
            ],
            "thumb_url": "http://placekitten.com/g/200/200",
            "footer": "footer",
            "footer_icon": "https://platform.slack-edge.com/img/default_application_icon.png",
            "ts": 123456789
        }
    ]
}
"""

class MessagePayloadTests: BlockTestCase {
    func test_messageWithAttachment() {
        let expectedMessage = MessagePayload(
            attachments: [
                SecondaryMessageAttachment(
                    text: "Optional `text` that appears within the attachment",
                    color: .custom(hexColorCode: "#36a64f"),
                    authorIcon: "https://placeimg.com/16/16/people",
                    authorLink: "http://flickr.com/bobby/",
                    authorName: "author_name",
                    fields: [
                        FieldObject(
                            title: "A field's title",
                            value: "This field's value",
                            short: false
                        ),
                        FieldObject(
                            title: "A short field's title",
                            value: "A short field's value",
                            short: true
                        ),
                        FieldObject(
                            title: "A second short field's title",
                            value: "A second short field's value",
                            short: true
                        )
                    ],
                    footer: "footer",
                    footerIcon: "https://platform.slack-edge.com/img/default_application_icon.png",
                    mrkdwnIn: ["text"],
                    pretext: "Optional pre-text that appears above the attachment block",
                    thumbUrl: "http://placekitten.com/g/200/200",
                    title: "title",
                    titleLink: "https://api.slack.com/",
                    ts: 123456789
                )
            ],
            channel: "ABCDEBF1"
        )
        testCodableEquality(message: expectedMessage, jsonString: messageWithAttachment)
    }
}
