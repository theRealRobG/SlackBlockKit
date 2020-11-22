/// This is the simplest form of select menu, with a static list of options
/// passed in when defining the element.
///
/// Works with block types:
///   - `Section`
///   - `Input`
struct MultiSelectMenuStaticOptions: BlockElement, InputBlockElement {
    public static let type = BlockElementType.multiStaticSelect
    /// The type of element. In this case `type` is always `multi_static_select`.
    public let type: String
    /// A `plain_text` only text object that defines the placeholder text shown
    /// on the menu. Maximum length for the `text` in this field is 150 characters.
    public let placeholder: TextObject
    /// An identifier for the action triggered when a menu option is selected. You
    /// can use this when you receive an interaction payload to identify the source
    /// of the action. Should be unique among all other `action_id`s in the containing
    /// block. Maximum length for this field is 255 characters.
    public let actionId: String
    /// An array of option objects. Maximum number of options is 100. If `option_groups`
    /// is specified, this field should not be.
    public let options: [OptionObject]
    /// An array of option group objects. Maximum number of option groups is 100. If
    /// `options` is specified, this field should not be.
    public let optionGroups: [OptionGroupObject]?
    /// An array of option objects that exactly match one or more of the options within
    /// `options` or `option_groups`. These options will be selected when the menu
    /// initially loads.
    public let initialOptions: [OptionObject]?
    /// A confirm object that defines an optional confirmation dialog that appears before
    /// the multi-select choices are submitted.
    public let confirm: ConfirmationDialogObject?
    /// Specifies the maximum number of items that can be selected in the menu. Minimum
    /// number is `1`.
    public let maxSelectedItems: Int?
    
    public init(
        placeholder: TextObject,
        actionId: String,
        options: [OptionObject],
        optionGroups: [OptionGroupObject]? = nil,
        initialOptions: [OptionObject]? = nil,
        confirm: ConfirmationDialogObject? = nil,
        maxSelectedItems: Int? = 1
    ) {
        self.type = Self.type.rawValue
        self.placeholder = placeholder
        self.actionId = actionId
        self.options = options
        self.optionGroups = optionGroups
        self.initialOptions = initialOptions
        self.confirm = confirm
        self.maxSelectedItems = maxSelectedItems
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case placeholder
        case actionId = "action_id"
        case options
        case optionGroups = "option_groups"
        case initialOptions = "initial_options"
        case confirm
        case maxSelectedItems = "max_selected_items"
    }
}
