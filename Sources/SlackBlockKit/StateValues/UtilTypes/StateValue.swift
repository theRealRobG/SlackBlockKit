/// This final child object will contain the type and value of the action block element.
/// If the call originates from a Home tab or modal view it will be in `view.state.values`
/// and if it originates from a message it will be in `state.values`.
public protocol StateValue: Codable {
    static var type: StateValueType { get }
    var type: String { get }
}

public typealias StateValues = [String: [String: StateValue]]

public extension StateValue {
    func isEqual(to rhs: StateValue?) -> Bool {
        let lhs = self
        guard let rhs = rhs else { return false }
        
        switch Swift.type(of: lhs).type {
        case .checkboxes:
            guard let lhs = lhs as? CheckboxGroupsStateValue, let rhs = rhs as? CheckboxGroupsStateValue else { return false }
            return lhs == rhs
        case .datepicker:
            guard let lhs = lhs as? DatePickerStateValue, let rhs = rhs as? DatePickerStateValue else { return false }
            return lhs == rhs
        case .plainTextInput:
            guard let lhs = lhs as? PlainTextInputStateValue, let rhs = rhs as? PlainTextInputStateValue else { return false }
            return lhs == rhs
        case .radioButtons:
            guard let lhs = lhs as? RadioButtonGroupStateValue, let rhs = rhs as? RadioButtonGroupStateValue else { return false }
            return lhs == rhs
        case .timepicker:
            guard let lhs = lhs as? TimePickerStateValue, let rhs = rhs as? TimePickerStateValue else { return false }
            return lhs == rhs
        case .conversationsSelect:
            guard let lhs = lhs as? SelectMenuConversationsListStateValue, let rhs = rhs as? SelectMenuConversationsListStateValue else { return false }
            return lhs == rhs
        case .usersSelect:
            guard let lhs = lhs as? SelectMenuUserListStateValue, let rhs = rhs as? SelectMenuUserListStateValue else { return false }
            return lhs == rhs
        case .staticSelect:
            guard let lhs = lhs as? SelectMenuStaticOptionsStateValue, let rhs = rhs as? SelectMenuStaticOptionsStateValue else { return false }
            return lhs == rhs
        case .channelsSelect:
            guard let lhs = lhs as? SelectMenuPublicChannelsListStateValue, let rhs = rhs as? SelectMenuPublicChannelsListStateValue else { return false }
            return lhs == rhs
        case .multiConversationsSelect:
            guard let lhs = lhs as? MultiSelectMenuConversationsListStateValue, let rhs = rhs as? MultiSelectMenuConversationsListStateValue else { return false }
            return lhs == rhs
        case .multiStaticSelect:
            guard let lhs = lhs as? MultiSelectMenuStaticOptionsStateValue, let rhs = rhs as? MultiSelectMenuStaticOptionsStateValue else { return false }
            return lhs == rhs
        case .multiChannelsSelect:
            guard let lhs = lhs as? MultiSelectMenuPublicChannelsListStateValue, let rhs = rhs as? MultiSelectMenuPublicChannelsListStateValue else { return false }
            return lhs == rhs
        case .multiUsersSelect:
            guard let lhs = lhs as? MultiSelectMenuUserListStateValue, let rhs = rhs as? MultiSelectMenuUserListStateValue else { return false }
            return lhs == rhs
        }
    }
}

public extension StateValues {
    func isEqual(to rhs: StateValues?) -> Bool {
        let lhs = self
        guard let rhs = rhs else { return false }
        guard lhs.keys.count == rhs.keys.count else { return false }
        return lhs.allSatisfy { blockId, lhsActionDict in
            guard let rhsActionDict = rhs[blockId] else { return false }
            guard lhsActionDict.keys.count == rhsActionDict.keys.count else { return false }
            return lhsActionDict.allSatisfy { actionId, lhsStateValue in
                guard let rhsStateValue = rhsActionDict[actionId] else { return false }
                return lhsStateValue.isEqual(to: rhsStateValue)
            }
        }
    }
}
