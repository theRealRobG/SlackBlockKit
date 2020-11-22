public protocol InputBlockElement: BlockElement {}

/// A block that collects information from users - it can hold a plain-text input element,
/// a checkbox element, a radio button element, a select menu element, a multi-select menu
/// element, or a datepicker.
///
/// Available in surfaces:
///   - `Modals`
///   - `Home tabs`
public struct InputBlock: LayoutBlock {
    public static let type = LayoutBlockType.input
    /// The type of block. For an input block, `type` is always `input`.
    public let type: String
    /// A label that appears above an input element in the form of a text object that must
    /// have `type` of `plain_text`. Maximum length for the `text` in this field is 2000
    /// characters.
    public let label: TextObject
    /// A plain-text input element, a checkbox element, a radio button element, a select
    /// menu element, a multi-select menu element, or a datepicker.
    public let element: InputBlockElement
    /// A boolean that indicates whether or not the use of elements in this block should
    /// dispatch a `block_actions` payload. Defaults to `false`.
    public let dispatchAction: Bool?
    /// A string acting as a unique identifier for a block. If not specified, one will be
    /// generated. Maximum length for this field is 255 characters. `block_id` should be
    /// unique for each message and each iteration of a message. If a message is updated,
    /// use a new `block_id`.
    public let blockId: String?
    /// An optional hint that appears below an input element in a lighter grey. It must be
    /// a text object with a `type` of `plain_text`. Maximum length for the `text` in this
    /// field is 2000 characters.
    public let hint: TextObject?
    /// A boolean that indicates whether the input element may be empty when a user submits
    /// the modal. Defaults to `false`.
    public let optional: Bool?
    
    public init(
        label: TextObject,
        element: InputBlockElement,
        dispatchAction: Bool? = false,
        blockId: String? = nil,
        hint: TextObject? = nil,
        optional: Bool? = false
    ) {
        self.type = Self.type.rawValue
        self.label = label
        self.element = element
        self.dispatchAction = dispatchAction
        self.blockId = blockId
        self.hint = hint
        self.optional = optional
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.label = try container.decode(TextObject.self, forKey: .label)
        self.dispatchAction = try container.decodeIfPresent(Bool.self, forKey: .dispatchAction)
        self.blockId = try container.decodeIfPresent(String.self, forKey: .blockId)
        self.hint = try container.decodeIfPresent(TextObject.self, forKey: .hint)
        self.optional = try container.decodeIfPresent(Bool.self, forKey: .optional)
        
        let anyElement = try container.decode(AnyBlockElement.self, forKey: .element)
        guard let element = anyElement.element as? InputBlockElement else {
            throw UnexpectedBlockType(
                expectedBlockType: InputBlockElement.self,
                actualBlockType: Swift.type(of: anyElement.element).self
            )
        }
        self.element = element
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(label, forKey: .label)
        try container.encode(AnyBlockElement(element), forKey: .element)
        try container.encodeIfPresent(dispatchAction, forKey: .dispatchAction)
        try container.encodeIfPresent(blockId, forKey: .blockId)
        try container.encodeIfPresent(hint, forKey: .hint)
        try container.encodeIfPresent(optional, forKey: .optional)
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case label
        case element
        case dispatchAction = "dispatch_action"
        case blockId = "block_id"
        case hint
        case optional
    }
}
