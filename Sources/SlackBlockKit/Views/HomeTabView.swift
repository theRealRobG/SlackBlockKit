/// The Home tab is a persistent, yet dynamic interface for apps.
///
/// Present each of your users with a unique Home tab just for them, always found in the exact
/// same place.
public struct HomeTabView: SlackView, Equatable {
    public static let type = ViewType.home
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
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(blocks.map(AnyLayoutBlock.init), forKey: .blocks)
        try container.encodeIfPresent(privateMetadata, forKey: .privateMetadata)
        try container.encodeIfPresent(callbackId, forKey: .callbackId)
        try container.encodeIfPresent(externalId, forKey: .externalId)
    }
    
    public static func == (lhs: HomeTabView, rhs: HomeTabView) -> Bool {
        guard lhs.blocks.count == rhs.blocks.count else { return false }
        for (index, block) in lhs.blocks.enumerated() {
            guard isEqual(lhs: block, rhs: rhs.blocks[index]) else { return false }
        }
        return
            lhs.type == rhs.type &&
            lhs.privateMetadata == rhs.privateMetadata &&
            lhs.callbackId == rhs.callbackId &&
            lhs.externalId == rhs.externalId
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case blocks
        case privateMetadata = "private_metadata"
        case callbackId = "callback_id"
        case externalId = "external_id"
    }
}
