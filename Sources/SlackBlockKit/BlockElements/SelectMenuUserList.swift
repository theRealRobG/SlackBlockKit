/// This select menu will populate its options with a list of Slack users
/// visible to the current user in the active workspace.
///
/// Works with block types:
///   - `Section`
///   - `Actions`
///   - `Input`
struct SelectMenuUserList: BlockElement, ActionsBlock {
    public static let type = BlockElementType.usersSelect
    /// The type of element. In this case `type` is always `users_select`.
    public let type: String
    /// A `plain_text` only text object that defines the placeholder text
    /// shown on the menu. Maximum length for the `text` in this field is
    /// 150 characters.
    public let placeholder: TextObject
    /// An identifier for the action triggered when a menu option is selected.
    /// You can use this when you receive an interaction payload to identify
    /// the source of the action. Should be unique among all other `action_id`s
    /// in the containing block. Maximum length for this field is 255 characters.
    public let actionId: String
    /// The user ID of any valid user to be pre-selected when the menu loads.
    public let initialUser: String?
    /// A confirm object that defines an optional confirmation dialog that appears
    /// after a menu item is selected.
    public let confirm: ConfirmationDialogObject?
    
    public init(
        placeholder: TextObject,
        actionId: String,
        initialUser: String? = nil,
        confirm: ConfirmationDialogObject? = nil
    ) {
        self.type = Self.type.rawValue
        self.placeholder = placeholder
        self.actionId = actionId
        self.initialUser = initialUser
        self.confirm = confirm
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case placeholder
        case actionId = "action_id"
        case initialUser = "initial_user"
        case confirm
    }
}
