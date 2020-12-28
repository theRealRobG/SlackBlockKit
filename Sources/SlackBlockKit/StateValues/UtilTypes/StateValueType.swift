public enum StateValueType: String, Codable {
    case checkboxes
    case datepicker
    case plainTextInput = "plain_text_input"
    case radioButtons = "radio_buttons"
    case timepicker
    case conversationsSelect = "conversations_select"
    case usersSelect = "users_select"
    case staticSelect = "static_select"
    case channelsSelect = "channels_select"
    case multiConversationsSelect = "multi_conversations_select"
    case multiStaticSelect = "multi_static_select"
    case multiChannelsSelect = "multi_channels_select"
    case multiUsersSelect = "multi_users_select"
    
    var eventMetaType: StateValue.Type {
        switch self {
        case .checkboxes: return CheckboxGroupsStateValue.self
        case .datepicker: return DatePickerStateValue.self
        case .conversationsSelect: return SelectMenuConversationsListStateValue.self
        case .usersSelect: return SelectMenuUserListStateValue.self
        case .staticSelect: return SelectMenuStaticOptionsStateValue.self
        case .channelsSelect: return SelectMenuPublicChannelsListStateValue.self
        case .multiConversationsSelect: return MultiSelectMenuConversationsListStateValue.self
        case .multiStaticSelect: return MultiSelectMenuStaticOptionsStateValue.self
        case .multiChannelsSelect: return MultiSelectMenuPublicChannelsListStateValue.self
        case .multiUsersSelect: return MultiSelectMenuUserListStateValue.self
        case .plainTextInput: return PlainTextInputStateValue.self
        case .radioButtons: return RadioButtonGroupStateValue.self
        case .timepicker: return TimePickerStateValue.self
        }
    }
}
