import Foundation
import Result

/// Network activity change notification type.
public enum NetworkActivityChangeType {
    case began, ended
}

/// Notify a request's network activity changes (request begins or ends).
public final class NetworkActivityPlugin: PluginType {

<<<<<<< HEAD
    public typealias NetworkActivityClosure = (change: NetworkActivityChangeType) -> ()
    let networkActivityClosure: NetworkActivityClosure

    public init(networkActivityClosure: NetworkActivityClosure) {
=======
    public typealias NetworkActivityClosure = (_ change: NetworkActivityChangeType) -> ()
    let networkActivityClosure: NetworkActivityClosure

    public init(networkActivityClosure: @escaping NetworkActivityClosure) {
>>>>>>> b18bd8c21aabb1c63e51708b735d2a09f40b6baf
        self.networkActivityClosure = networkActivityClosure
    }

    // MARK: Plugin

    /// Called by the provider as soon as the request is about to start
    public func willSendRequest(_ request: RequestType, target: TargetType) {
        networkActivityClosure(.began)
    }

    /// Called by the provider as soon as a response arrives, even the request is cancelled.
    public func didReceiveResponse(_ result: Result<Moya.Response, Moya.Error>, target: TargetType) {
        networkActivityClosure(.ended)
    }
}
