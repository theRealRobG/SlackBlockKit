/// Verifies ownership of an Events API Request URL.
///
/// This event does not require a specific OAuth scope or subscription. You'll automatically
/// receive it whenever configuring an Events API Request URL.
///
/// Once you receive the event, verify the request's authenticity and then respond with the
/// challenge attribute value.
public struct URLVerificationEvent: SlackEventWrapper, Equatable {
    public static let type: SlackEventWrapperType = .urlVerification
    /// This payload is similarly formatted to other event types you'll encounter in the Events
    /// API. To help you differentiate url verification requests form other event types, we
    /// inform you that this is of the `url_verification` variety.
    public let type: String
    /// This deprecated verification token is proof that the request is coming from Slack on
    /// behalf of your application. You'll find this value in the "App Credentials" section of
    /// your app's application management interface. Verifying this value is more important
    /// when working with real events after this verification sequence has been completed.
    /// When responding to real events, always use the more secure signing secret process to
    /// verify Slack requests' authenticity.
    public let token: String
    /// A randomly generated string produced by Slack. The point of this little game of cat and
    /// mouse is that you're going to respond to this request with a response body containing
    /// this value.
    public let challenge: String
    
    // The following may also appear
    public var apiAppId: String?
    public var isEnterpriseInstall: Bool?
    public var responseUrls: [String]?
    public var triggerId: String?
    
    public init(token: String, challenge: String) {
        self.type = Self.type.rawValue
        self.token = token
        self.challenge = challenge
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case token
        case challenge
        case apiAppId = "api_app_id"
        case isEnterpriseInstall = "is_enterprise_install"
        case responseUrls = "response_urls"
        case triggerId = "trigger_id"
    }
}
