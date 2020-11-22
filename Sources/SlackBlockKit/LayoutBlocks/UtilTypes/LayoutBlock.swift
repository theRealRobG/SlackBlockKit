/// Blocks are a series of components that can be combined to create visually
/// rich and compellingly interactive messages.
public protocol LayoutBlock: Codable {
    static var type: LayoutBlockType { get }
    var type: String { get }
}
