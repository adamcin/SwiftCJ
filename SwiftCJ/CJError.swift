import Foundation

public struct CJError {
    public let title: String?
    public let code: String?
    public let message: String?

    static func errorForDictionary(dict: [NSObject: AnyObject]) -> CJError? {
        if let errorDict = dict["error"] as? [NSObject: AnyObject] {
            let title = errorDict["title"] as? String
            let code = errorDict["code"] as? String
            let message = errorDict["message"] as? String
            return CJError(title: title, code: code, message: message)
        }
        return nil
    }
}
