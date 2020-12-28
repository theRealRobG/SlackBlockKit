/// An installation of your app. Installations are defined by a combination of the installing
/// Enterprise Grid org, workspace, and user (represented by `enterprise_id`, `team_id`, and
/// `user_id` inside this field)—note that installations may only have one or two, not all three,
/// defined. `authorizations` describes one of the installations that this event is visible to.
/// You'll receive a single event for a piece of data intended for multiple users in a workspace,
/// rather than a message per user.
public struct SlackAuthorizations: Codable {
    public let enterpriseId: String?
    public let teamId: String?
    public let userId: String?
    public let isBot: Bool?
    
    public init(
        enterpriseId: String?,
        teamId: String?,
        userId: String?,
        isBot: Bool?
    ) {
        self.enterpriseId = enterpriseId
        self.teamId = teamId
        self.userId = userId
        self.isBot = isBot
    }
    
    public enum CodingKeys: String, CodingKey {
        case enterpriseId = "enterprise_id"
        case teamId = "team_id"
        case userId = "user_id"
        case isBot = "is_bot"
    }
}
