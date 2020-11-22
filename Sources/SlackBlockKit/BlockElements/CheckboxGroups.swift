/// A checkbox group that allows a user to choose multiple items from a list of
/// possible options.
///
/// Works with block types:
///   - `Section`
///   - `Actions`
///   - `Input`
///
/// Checkboxes are only supported in the following app surfaces:
///   - `Home tabs`
///   - `Modals`
///   - `Messages`
public struct CheckboxGroups: BlockElement, ActionsBlockElement, InputBlockElement, SectionBlockElement, Equatable {
    public static let type = BlockElementType.checkboxes
    /// The type of element. In this case `type` is always `checkboxes`.
    public let type: String
    /// An identifier for the action triggered when the checkbox group is changed.
    /// You can use this when you receive an interaction payload to identify the
    /// source of the action. Should be unique among all other `action_id`s in the
    /// containing block. Maximum length for this field is 255 characters.
    public let actionId: String
    /// An array of option objects. A maximum of 10 options are allowed.
    public let options: [OptionObject]
    /// An array of option objects that exactly matches one or more of the options
    /// within `options`. These options will be selected when the checkbox group initially
    /// loads.
    public let initialOptions: [OptionObject]?
    /// A confirm object that defines an optional confirmation dialog that appears after
    /// clicking one of the checkboxes in this element.
    public let confirm: ConfirmationDialogObject?
    
    public init(
        actionId: String,
        options: [OptionObject],
        initialOptions: [OptionObject]? = nil,
        confirm: ConfirmationDialogObject? = nil
    ) {
        self.type = Self.type.rawValue
        self.actionId = actionId
        self.options = options
        self.initialOptions = initialOptions
        self.confirm = confirm
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case options
        case initialOptions = "initial_options"
        case confirm
    }
}
