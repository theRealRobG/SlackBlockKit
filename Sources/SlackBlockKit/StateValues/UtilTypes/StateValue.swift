/// This final child object will contain the type and value of the action block element.
/// If the call originates from a Home tab or modal view it will be in `view.state.values`
/// and if it originates from a message it will be in `state.values`.
public protocol StateValue: Codable {
    static var type: StateValueType { get }
    var type: String { get }
}
