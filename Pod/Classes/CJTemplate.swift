import Foundation

public class CJTemplate {
    public let data: CJData
    
    public init(data: CJData) {
        self.data = data
    }
    
    class func templateForDictionary(dict: [NSObject: AnyObject]) -> CJTemplate? {
        if let templateDict = dict["template"] as? [NSObject: AnyObject] {
            if let data = CJData.dataForDictionary(templateDict) {
                return CJTemplate(data: data)
            }
        }
        return nil
    }
    
    func toSeri() -> [String: [String: [[String: AnyObject]]]] {
        return [
            "template": self.data.toSeri()
        ]
    }
}
