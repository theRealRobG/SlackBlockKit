/// Also referred to as the "outer event", or the JSON object containing the event that happened itself.
public struct SlackEventCallback: SlackEventWrapper {
    public static let type: SlackEventWrapperType = .eventCallback
    /// This reflects the type of callback you're receiving. In this scenario it will be
    /// `event_callback`. The `event` fields "inner event" will also contain a `type` field
    /// indicating which event type lurks within.
    public let type: String
    /// The shared-private callback token that authenticates this callback to the application as
    /// having come from Slack. Match this against what you were given when the subscription was
    /// created. If it does not match, do not process the event and discard it.
    /// Example: `JhjZd2rVax7ZwH7jRYyWjbDl`
    public let token: String
    /// The unique identifier for the workspace/team where this event occurred.
    /// Example: `T461EG9ZZ`
    public let teamId: String
    /// The unique identifier for the application this event is intended for. Your application's
    /// ID can be found in the URL of the your application console. If your Request URL manages
    /// multiple applications, use this field along with the `token` field to validate and route
    /// incoming requests.
    /// Example: `A4ZFV49KK`
    public let apiAppId: String
    /// Contains the inner set of fields representing the event that's happening.
    public let event: SlackEvent
    /// A unique identifier for this specific event, globally unique across all workspaces.
    public let eventId: String
    /// The epoch timestamp in seconds indicating when this event was dispatched.
    public let eventTime: Int
    /// An array of string-based User IDs. Each member of the collection represents a user that
    /// has installed your application/bot and indicates the described event would be visible to
    /// those users. You'll receive a single event for a piece of data intended for multiple users
    /// in a workspace, rather than a message per user.
    public let authedUsers: [String]?
    /// An installation of your app. Installations are defined by a combination of the installing
    /// Enterprise Grid org, workspace, and user (represented by `enterprise_id`, `team_id`, and
    /// `user_id` inside this field)—note that installations may only have one or two, not all three,
    /// defined. `authorizations` describes one of the installations that this event is visible to.
    /// You'll receive a single event for a piece of data intended for multiple users in a workspace,
    /// rather than a message per user.
    public let authorizations: SlackAuthorizations?
    /// An identifier for this specific event. This field can be used with the
    /// `apps.event.authorizations.list` method to obtain a full list of installations of your app
    /// that this event is visible to.
    public let eventContext: String?
    
    public init(
        token: String,
        teamId: String,
        apiAppId: String,
        event: SlackEvent,
        eventId: String,
        eventTime: Int,
        authedUsers: [String]?,
        authorizations: SlackAuthorizations?,
        eventContext: String?
    ) {
        self.type = Self.type.rawValue
        self.token = token
        self.teamId = teamId
        self.apiAppId = apiAppId
        self.event = event
        self.eventId = eventId
        self.eventTime = eventTime
        self.authedUsers = authedUsers
        self.authorizations = authorizations
        self.eventContext = eventContext
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.token = try container.decode(String.self, forKey: .token)
        self.teamId = try container.decode(String.self, forKey: .teamId)
        self.apiAppId = try container.decode(String.self, forKey: .apiAppId)
        self.event = try container.decode(AnySlackEvent.self, forKey: .event).event
        self.eventId = try container.decode(String.self, forKey: .eventId)
        self.eventTime = try container.decode(Int.self, forKey: .eventTime)
        self.authedUsers = try container.decodeIfPresent([String].self, forKey: .authedUsers)
        self.authorizations = try container.decodeIfPresent(SlackAuthorizations.self, forKey: .authorizations)
        self.eventContext = try container.decodeIfPresent(String.self, forKey: .eventContext)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(token, forKey: .token)
        try container.encode(teamId, forKey: .teamId)
        try container.encode(apiAppId, forKey: .apiAppId)
        try container.encode(AnySlackEvent(event), forKey: .event)
        try container.encode(eventId, forKey: .eventId)
        try container.encode(eventTime, forKey: .eventTime)
        try container.encodeIfPresent(authedUsers, forKey: .authedUsers)
        try container.encodeIfPresent(authorizations, forKey: .authorizations)
        try container.encodeIfPresent(eventContext, forKey: .eventContext)
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case token
        case teamId = "team_id"
        case apiAppId = "api_app_id"
        case event
        case eventId = "event_id"
        case eventTime = "event_time"
        case authedUsers = "authed_users"
        case authorizations
        case eventContext = "event_context"
    }
}
