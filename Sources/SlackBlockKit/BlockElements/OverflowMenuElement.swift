/// This is like a cross between a button and a select menu - when a user clicks
/// on this overflow button, they will be presented with a list of options to choose
/// from. Unlike the select menu, there is no typeahead field, and the button always
/// appears with an ellipsis ("…") rather than customisable text.
/// As such, it is usually used if you want a more compact layout than a select menu,
/// or to supply a list of less visually important actions after a row of buttons.
/// You can also specify simple URL links as overflow menu options, instead of actions.
///
/// Works with block types:
///   - `Section`
///   - `Actions`
public struct OverflowMenuElement: BlockElement, ActionsBlockElement {
    public static let type = BlockElementType.overflow
    /// The type of element. In this case `type` is always `overflow`.
    public let type: String
    /// An identifier for the action triggered when a menu option is selected. You can
    /// use this when you receive an interaction payload to identify the source of the
    /// action. Should be unique among all other `action_id`s in the containing block.
    /// Maximum length for this field is 255 characters.
    public let actionId: String
    /// An array of option objects to display in the menu. Maximum number of options is
    /// 5, minimum is 2.
    public let options: [OptionObject]
    /// A confirm object that defines an optional confirmation dialog that appears after
    /// a menu item is selected.
    public let confirm: ConfirmationDialogObject?
    
    public init(
        actionId: String,
        options: [OptionObject],
        confirm: ConfirmationDialogObject? = nil
    ) {
        self.type = Self.type.rawValue
        self.actionId = actionId
        self.options = options
        self.confirm = confirm
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case options
        case confirm
    }
}
