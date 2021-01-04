import SlackBlockKit

// https://api.slack.com/events-api#the-events-api__subscribing-to-event-types__events-api-request-urls__request-url-configuration--verification__url-verification-handshake
private let urlVerification = """
{
    "token": "Jhj5dZrVaK7ZwHHjRyZWjbDl",
    "challenge": "3eZbrw1aBm2rZgRNFdxV2595E9CY3gmdALWMmHkvFXO7tYXAYM8P",
    "type": "url_verification"
}
"""

class URLVerificationEventTests: BlockTestCase {
    func test_urlVerificationEvent() {
        let urlVerificationEvent = URLVerificationEvent(
            token: "Jhj5dZrVaK7ZwHHjRyZWjbDl",
            challenge: "3eZbrw1aBm2rZgRNFdxV2595E9CY3gmdALWMmHkvFXO7tYXAYM8P"
        )
        testCodableEquality(event: urlVerificationEvent, jsonString: urlVerification)
    }
}
