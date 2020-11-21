/// Block elements can be used inside of `section`, `context`, and `actions` layout
/// blocks. Inputs can only be used inside of `input` blocks.
public protocol BlockElement: Codable {
    static var type: BlockElementType { get }
    var type: String { get }
}
