public enum SlackEventWrapperType: String, Codable {
    case urlVerification = "url_verification"
    case eventCallback = "event_callback"
    case viewSubmission = "view_submission"
    case viewClosed = "view_closed"
}
