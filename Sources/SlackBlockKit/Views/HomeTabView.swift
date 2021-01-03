/// The Home tab is a persistent, yet dynamic interface for apps.
///
/// Present each of your users with a unique Home tab just for them, always found in the exact
/// same place.
public struct HomeTabView: SlackView, Equatable {
    public static let type = SlackViewType.home
    /// /// The type of view. Set to `modal` for modals and `home` for Home tabs.
    public let type: String
    /// An array of blocks that defines the content of the view. Max of 100 blocks.
    public let blocks: [LayoutBlock]
    /// An optional string that will be sent to your app in `view_submission` and `block_actions`
    /// events. Max length of 3000 characters.
    public let privateMetadata: String?
    /// An identifier to recognize interactions and submissions of this particular view. Don't
    /// use this to store sensitive information (use `private_metadata` instead). Max length of
    /// 255 characters.
    public let callbackId: String?
    /// A custom identifier that must be unique for all views on a per-team basis.
    public let externalId: String?
    /// A dictionary of objects. Each object represents a block in the source view that contained
    /// stateful, interactive components. Objects are keyed by the `block_id` of those blocks.
    /// These objects each contain a child object. The child object is keyed by the `action_id` of
    /// the interactive element in the block. This final child object will contain the `type` and
    /// submitted `value` of the input block element.
    ///
    /// This is primarily defined when decoding an event coming from Slack.
    public var state: ViewState?
    /// A unique value which is optionally accepted in views.update and views.publish API calls.
    /// When provided to those APIs, the `hash` is validated such that only the most recent view can
    /// be updated. This should be used to ensure the correct view is being updated when updates
    /// are happening asynchronously.
    public var hash: String?
    
    public init(
        blocks: [LayoutBlock],
        privateMetadata: String? = nil,
        callbackId: String? = nil,
        externalId: String? = nil
    ) {
        if blocks.count > 100 {
            assertionFailure("There is a maximum of 100 blocks.")
        }
        
        self.type = Self.type.rawValue
        self.blocks = blocks
        self.privateMetadata = privateMetadata
        self.callbackId = callbackId
        self.externalId = externalId
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.blocks = try container.decode([AnyLayoutBlock].self, forKey: .blocks).map { $0.block }
        self.privateMetadata = try container.decodeIfPresent(String.self, forKey: .privateMetadata)
        self.callbackId = try container.decodeIfPresent(String.self, forKey: .callbackId)
        self.externalId = try container.decodeIfPresent(String.self, forKey: .externalId)
        self.state = try container.decodeIfPresent(ViewState.self, forKey: .state)
        self.hash = try container.decodeIfPresent(String.self, forKey: .hash)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(blocks.map(AnyLayoutBlock.init), forKey: .blocks)
        try container.encodeIfPresent(privateMetadata, forKey: .privateMetadata)
        try container.encodeIfPresent(callbackId, forKey: .callbackId)
        try container.encodeIfPresent(externalId, forKey: .externalId)
        try container.encodeIfPresent(state, forKey: .state)
        try container.encodeIfPresent(hash, forKey: .hash)
    }
    
    public static func == (lhs: HomeTabView, rhs: HomeTabView) -> Bool {
        guard lhs.blocks.count == rhs.blocks.count else { return false }
        for (index, block) in lhs.blocks.enumerated() {
            guard block.isEqual(to: rhs.blocks[index]) else { return false }
        }
        return
            lhs.type == rhs.type &&
            lhs.privateMetadata == rhs.privateMetadata &&
            lhs.callbackId == rhs.callbackId &&
            lhs.externalId == rhs.externalId &&
            lhs.state == rhs.state &&
            lhs.hash == rhs.hash
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case blocks
        case privateMetadata = "private_metadata"
        case callbackId = "callback_id"
        case externalId = "external_id"
        case state
        case hash
    }
}
