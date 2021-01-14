/// This app event notifies your app when a user has entered the App Home.
public struct AppHomeOpenedEvent: SlackEvent, Equatable {
    public static let type: SlackEventType = .appHomeOpened
    /// The type of event. In this case `type` is always `app_home_opened`.
    public let type: String
    /// The user ID belonging to the user that incited this action. Not included in all events
    /// as not all events are controlled by users. See the top-level callback object's
    /// `authed_users` if you need to calculate event visibility by user.
    public let user: String
    /// The timestamp of the event. The combination of `event_ts`, `team_id`,
    /// `user_id`, or `channel_id` is intended to be unique. This field is included
    /// with every inner event type.
    public let eventTs: String
    /// If the user opens a tab within the App Home, the event payload for this event
    /// will reference that in the `tab` field.
    public let tab: String?
    /// If they opened a Home tab and that tab has had a `view` published at least
    /// once before, a `view` field will also be included. That `view` field will
    /// contain the current state of the Home tab, including the list of `blocks`,
    /// and various pieces of metadata.
    public let view: HomeTabView?
    
    public init(
        user: String,
        eventTs: String,
        tab: String? = nil,
        view: HomeTabView? = nil
    ) {
        self.type = Self.type.rawValue
        self.user = user
        self.eventTs = eventTs
        self.tab = tab
        self.view = view
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case user
        case eventTs = "event_ts"
        case tab
        case view
    }
}
