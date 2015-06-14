import Foundation

struct CJError {
    let title: String?
    let code: String?
    let message: String?

    init(title: String?, code: String?, message: String?) {
        self.title = title
        self.code = code
        self.message = message
    }

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
