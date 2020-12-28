/// The Events API is a streamlined, easy way to build apps and bots that respond to activities in Slack.
/// Your Request URL will receive JSON-based payloads containing wrapped event types.
public protocol SlackEventWrapper: Codable {
    static var type: SlackEventWrapperType { get }
    var type: String { get }
}
