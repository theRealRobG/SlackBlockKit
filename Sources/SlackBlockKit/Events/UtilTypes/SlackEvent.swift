/// The Events API is a streamlined, easy way to build apps and bots that respond to activities in Slack.
public protocol SlackEvent: Codable {
    static var type: SlackEventType { get }
    var type: String { get }
}
