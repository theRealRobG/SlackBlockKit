/// Provides a way to filter the list of options in a conversations
/// select menu or conversations multi-select menu.
public struct ConversationListsFilterObject: Codable, Equatable {
    /// Indicates which type of conversations should be *included* in the list.
    /// When this field is provided, any conversations that do not match will be excluded
    ///
    /// You should provide an array of strings from the following options: `im`, `mpim`,
    /// `private`, and `public`. The array cannot be empty.
    public let include: [ConversationType]?
    /// Indicates whether to exclude external shared channels from conversation lists.
    /// Defaults to `false`.
    public let excludeExternalSharedChannels: Bool?
    /// Indicates whether to exclude bot users from conversation lists. Defaults to `false`.
    public let excludeBotUsers: Bool?
    
    public init(
        include: [ConversationType]? = nil,
        excludeExternalSharedChannels: Bool? = nil,
        excludeBotUsers: Bool? = nil
    ) {
        self.include = include
        self.excludeExternalSharedChannels = excludeExternalSharedChannels
        self.excludeBotUsers = excludeBotUsers
    }
    
    public enum CodingKeys: String, CodingKey {
        case include
        case excludeExternalSharedChannels = "exclude_external_shared_channels"
        case excludeBotUsers = "exclude_bot_users"
    }
}

public extension ConversationListsFilterObject {
    enum ConversationType: String, Codable {
        case im
        case mpim
        case privateMessage = "private"
        case publicMessage = "public"
    }
}
