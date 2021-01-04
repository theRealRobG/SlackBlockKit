/// The Events API is a streamlined, easy way to build apps and bots that respond to activities in Slack.
public protocol SlackEvent: Codable {
    static var type: SlackEventType { get }
    var type: String { get }
}

public extension SlackEvent {
    func isEqual(to rhs: SlackEvent?) -> Bool {
        let lhs = self
        guard let rhs = rhs else { return false }
        switch Swift.type(of: lhs).type {
        case .appHomeOpened:
            guard let lhs = lhs as? AppHomeOpenedEvent, let rhs = rhs as? AppHomeOpenedEvent else { return false }
            return lhs == rhs
        }
    }
}
