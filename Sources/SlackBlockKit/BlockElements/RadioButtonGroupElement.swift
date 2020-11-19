/// A radio button group that allows a user to choose one item from a list
/// of possible options.
///
/// Radio buttons are only supported in the following app surfaces:
///   - `Home tabs`
///   - `Modals`
///   - `Messages`
///
/// Works with block types:
///   - `Section`
///   - `Actions`
///   - `Input`
public struct RadioButtonGroupElement: Codable {
    public static let type = "radio_buttons"
    /// The type of element. In this case `type` is always `radio_buttons`.
    public let type: String
    /// An identifier for the action triggered when the radio button group is changed.
    /// You can use this when you receive an interaction payload to identify the source
    /// of the action. Should be unique among all other `action_id`s in the containing
    /// block. Maximum length for this field is 255 characters.
    public let actionId: String
    /// An array of option objects. A maximum of 10 options are allowed.
    public let options: [OptionObject]
    /// An option object that exactly matches one of the options within `options`. This
    /// option will be selected when the radio button group initially loads.
    public let initialOption: OptionObject?
    /// A confirm object that defines an optional confirmation dialog that appears after
    /// clicking one of the radio buttons in this element.
    public let confirm: ConfirmationDialogObject?
    
    public init(
        actionId: String,
        options: [OptionObject],
        initialOption: OptionObject? = nil,
        confirm: ConfirmationDialogObject? = nil
    ) {
        self.type = Self.type
        self.actionId = actionId
        self.options = options
        self.initialOption = initialOption
        self.confirm = confirm
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case options
        case initialOption = "initial_option"
        case confirm
    }
}
