/// Views are app-customized visual areas within modals and Home tabs.
///
/// To define these views, apps create **view objects** — packages of information that
/// describe layout, interactivity, and other useful metadata.
public protocol SlackView: Codable {
    static var type: SlackViewType { get }
    var type: String { get }
    var blocks: [LayoutBlock] { get }
    var hash: String? { get set }
}
