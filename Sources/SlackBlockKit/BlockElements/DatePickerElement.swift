/// An element which lets users easily select a date from a calendar style UI.
///
/// Works with block types:
///   - `Section`
///   - `Actions`
///   - `Input`
public struct DatePickerElement: Codable {
    /// The type of element. In this case `type` is always `datepicker`.
    public let type = "datepicker"
    /// An identifier for the action triggered when a menu option is selected.
    /// You can use this when you receive an interaction payload to identify the
    /// source of the action. Should be unique among all other `action_id`s in
    /// the containing block. Maximum length for this field is 255 characters.
    public let actionId: String
    /// A `plain_text` only text object that defines the placeholder text shown on
    /// the datepicker. Maximum length for the `text` in this field is 150 characters.
    public let placeholder: TextObject?
    /// The initial date that is selected when the element is loaded. This should be
    /// in the format `YYYY-MM-DD`.
    public let initialDate: String?
    /// A confirm object that defines an optional confirmation dialog that appears
    /// after a date is selected.
    public let confirm: ConfirmationDialogObject?
    
    public init(
        actionId: String,
        placeholder: TextObject? = nil,
        initialDate: String? = nil,
        confirm: ConfirmationDialogObject? = nil
    ) {
        self.actionId = actionId
        self.placeholder = placeholder
        self.initialDate = initialDate
        self.confirm = confirm
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case placeholder
        case initialDate = "initial_date"
        case confirm
    }
}
