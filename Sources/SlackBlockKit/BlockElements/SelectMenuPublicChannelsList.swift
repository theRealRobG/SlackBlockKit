/// This select menu will populate its options with a list of public channels
/// visible to the current user in the active workspace.
///
/// Works with block types:
///   - `Section`
///   - `Actions`
///   - `Input`
public struct SelectMenuPublicChannelsList: BlockElement, ActionsBlockElement, InputBlockElement, SectionBlockElement {
    public static let type = BlockElementType.channelsSelect
    /// The type of element. In this case `type` is always `channels_select.
    public let type: String
    /// A `plain_text` only text object that defines the placeholder text shown
    /// on the menu. Maximum length for the `text` in this field is 150 characters.
    public let placeholder: TextObject
    /// An identifier for the action triggered when a menu option is selected. You can
    /// use this when you receive an interaction payload to identify the source of the
    /// action. Should be unique among all other `action_id`s in the containing block.
    /// Maximum length for this field is 255 characters.
    public let actionId: String
    /// The ID of any valid public channel to be pre-selected when the menu loads.
    public let initialChannel: String?
    /// A confirm object that defines an optional confirmation dialog that appears
    /// after a menu item is selected.
    public let confirm: ConfirmationDialogObject?
    /// **This field only works with menus in input blocks in modals.**
    ///
    /// When set to `true`, the `view_submission` payload from the menu's parent view
    /// will contain a `response_url`. This `response_url` can be used for message
    /// responses. The target channel for the message will be determined by the value
    /// of this select menu.
    public let responseUrlEnabled: Bool?
    
    public init(
        placeholder: TextObject,
        actionId: String,
        initialChannel: String?,
        confirm: ConfirmationDialogObject?,
        responseUrlEnabled: Bool?
    ) {
        self.type = Self.type.rawValue
        self.placeholder = placeholder
        self.actionId = actionId
        self.initialChannel = initialChannel
        self.confirm = confirm
        self.responseUrlEnabled = responseUrlEnabled
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case placeholder
        case actionId = "action_id"
        case initialChannel = "initial_channel"
        case confirm
        case responseUrlEnabled = "response_url_enabled"
    }
}
