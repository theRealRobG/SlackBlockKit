/// Modals provide focused spaces ideal for requesting and collecting data from users,
/// or temporarily displaying dynamic and interactive information.
///
/// For users, modals are prominent and pervasive — taking center stage in Slack ahead
/// of any other interface element.
///
/// If you're using any input blocks, **you must include the** `submit` **field when**
/// **defining your view.**
public struct ModalView: SlackView, Equatable {
    public static let type = SlackViewType.modal
    /// The type of view. Set to `modal` for modals and `home` for Home tabs.
    public let type: String
    /// The title that appears in the top-left of the modal. Must be a `plain_text` text
    /// element with a max length of 24 characters.
    public let title: TextObject
    /// An array of blocks that defines the content of the view. Max of 100 blocks.
    public let blocks: [LayoutBlock]
    /// An optional `plain_text` element that defines the text displayed in the close
    /// button at the bottom-right of the view. Max length of 24 characters.
    public let close: TextObject?
    /// An optional `plain_text` element that defines the text displayed in the submit
    /// button at the bottom-right of the view. `submit` is required when an input block is
    /// within the `blocks` array. Max length of 24 characters.
    public let submit: TextObject?
    /// An optional string that will be sent to your app in `view_submission` and `block_actions`
    /// events. Max length of 3000 characters.
    public let privateMetadata: String?
    /// An identifier to recognize interactions and submissions of this particular view. Don't
    /// use this to store sensitive information (use `private_metadata` instead). Max length of
    /// 255 characters.
    public let callbackId: String?
    /// When set to `true`, clicking on the `close` button will clear all views in a modal and close
    /// it. Defaults to `false`.
    public let clearOnClose: Bool?
    /// Indicates whether Slack will send your request URL a `view_closed` event when a user clicks
    /// the `close` button. Defaults to `false`.
    public let notifyOnClose: Bool?
    /// A custom identifier that must be unique for all views on a per-team basis.
    public let externalId: String?
    
    public init(
        title: TextObject,
        blocks: [LayoutBlock],
        close: TextObject? = nil,
        submit: TextObject? = nil,
        privateMetadata: String? = nil,
        callbackId: String? = nil,
        clearOnClose: Bool? = nil,
        notifyOnClose: Bool? = nil,
        externalId: String? = nil
    ) {
        if blocks.count > 100 {
            assertionFailure("There is a maximum of 100 blocks.")
        }
        
        self.type = Self.type.rawValue
        self.title = title
        self.blocks = blocks
        self.close = close
        self.submit = submit
        self.privateMetadata = privateMetadata
        self.callbackId = callbackId
        self.clearOnClose = clearOnClose
        self.notifyOnClose = notifyOnClose
        self.externalId = externalId
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.title = try container.decode(TextObject.self, forKey: .title)
        self.blocks = try container.decode([AnyLayoutBlock].self, forKey: .blocks).map { $0.block }
        self.close = try container.decodeIfPresent(TextObject.self, forKey: .close)
        self.submit = try container.decodeIfPresent(TextObject.self, forKey: .submit)
        self.privateMetadata = try container.decodeIfPresent(String.self, forKey: .privateMetadata)
        self.callbackId = try container.decodeIfPresent(String.self, forKey: .callbackId)
        self.clearOnClose = try container.decodeIfPresent(Bool.self, forKey: .clearOnClose)
        self.notifyOnClose = try container.decodeIfPresent(Bool.self, forKey: .notifyOnClose)
        self.externalId = try container.decodeIfPresent(String.self, forKey: .externalId)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(title, forKey: .title)
        try container.encode(blocks.map(AnyLayoutBlock.init), forKey: .blocks)
        try container.encodeIfPresent(close, forKey: .close)
        try container.encodeIfPresent(submit, forKey: .submit)
        try container.encodeIfPresent(privateMetadata, forKey: .privateMetadata)
        try container.encodeIfPresent(callbackId, forKey: .callbackId)
        try container.encodeIfPresent(clearOnClose, forKey: .clearOnClose)
        try container.encodeIfPresent(notifyOnClose, forKey: .notifyOnClose)
        try container.encodeIfPresent(externalId, forKey: .externalId)
    }
    
    public static func == (lhs: ModalView, rhs: ModalView) -> Bool {
        guard lhs.blocks.count == rhs.blocks.count else { return false }
        for (index, block) in lhs.blocks.enumerated() {
            guard block.isEqual(to: rhs.blocks[index]) else { return false }
        }
        return
            lhs.type == rhs.type &&
            lhs.title == rhs.title &&
            lhs.close == rhs.close &&
            lhs.submit == rhs.submit &&
            lhs.privateMetadata == rhs.privateMetadata &&
            lhs.callbackId == rhs.callbackId &&
            lhs.clearOnClose == rhs.clearOnClose &&
            lhs.notifyOnClose == rhs.notifyOnClose &&
            lhs.externalId == rhs.externalId
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case title
        case blocks
        case close
        case submit
        case privateMetadata = "private_metadata"
        case callbackId = "callback_id"
        case clearOnClose = "clear_on_close"
        case notifyOnClose = "notify_on_close"
        case externalId = "external_id"
    }
}
