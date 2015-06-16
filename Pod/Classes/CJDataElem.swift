import Foundation

public struct CJDataElem {
    let name: String
    let prompt: String?
    let value: AnyObject?
    
    func copyAndSet(value: AnyObject?) -> CJDataElem {
        if value == nil {
            return CJDataElem(name: name, prompt: prompt, value: nil)
        } else if NSJSONSerialization.isValidJSONObject(value!) {
            return CJDataElem(name: name, prompt: prompt, value: value!)
        } else {
            return CJDataElem(name: name, prompt: prompt, value: "\(value!)")
        }
    }
    
    func toSeri() -> [String: AnyObject] {
        var seri = [String: AnyObject]()
        seri["name"] = self.name
        if let prompt = self.prompt {
            seri["prompt"] = self.prompt
        }
        if let value: AnyObject = self.value {
            seri["value"] = self.value
        }
        return seri
    }
    
    static func elementFromDictionary(dict: [NSObject: AnyObject]) -> CJDataElem? {
        if let name = dict["name"] as? String {
            let prompt = dict["prompt"] as? String
            let value: AnyObject? = dict["value"]
            return CJDataElem(name: name, prompt: prompt, value: value)
        }
        return nil
    }
}
