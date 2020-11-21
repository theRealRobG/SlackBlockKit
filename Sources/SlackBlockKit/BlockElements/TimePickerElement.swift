/// An element which allows selection of a time of day.
///
/// On desktop clients, this time picker will take the form of a dropdown list
/// with free-text entry for precise choices. On mobile clients, the time picker
/// will use native time picker UIs.
///
/// Works with block types:
///   - `Section`
///   - `Actions`
///   - `Input`
public struct TimePickerElement: BlockElement, ActionsBlockElement {
    public static let type = BlockElementType.timepicker
    /// The type of element. In this case `type` is always `timepicker`.
    public let type: String
    /// An identifier for the action triggered when a time is selected. You can
    /// use this when you receive an interaction payload to identify the source
    /// of the action. Should be unique among all other `action_id`s in the
    /// containing block. Maximum length for this field is 255 characters.
    public let actionId: String
    /// A `plain_text` only text object that defines the placeholder text shown
    /// on the timepicker. Maximum length for the `text` in this field is 150
    /// characters.
    public let placeholder: TextObject?
    /// The initial time that is selected when the element is loaded. This should
    /// be in the format `HH:mm`, where `HH` is the 24-hour format of an hour
    /// (00 to 23) and `mm` is minutes with leading zeros (00 to 59), for example
    /// `22:25` for 10:25pm.
    public let initialTime: String?
    /// A confirm object that defines an optional confirmation dialog that appears
    /// after a time is selected.
    public let confirm: ConfirmationDialogObject?
    
    public init(
        actionId: String,
        placeholder: TextObject? = nil,
        initialTime: String? = nil,
        confirm: ConfirmationDialogObject? = nil
    ) {
        self.type = Self.type.rawValue
        self.actionId = actionId
        self.placeholder = placeholder
        self.initialTime = initialTime
        self.confirm = confirm
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case placeholder
        case initialTime = "initial_time"
        case confirm
    }
}
