import Foundation

public struct CJQuery {
    let href: NSURL
    let rel: String
    let name: String?
    let prompt: String?
    let data: CJData?
    
    func forDict(dict: [String: AnyObject]) -> CJQuery {
        return CJQuery(href: self.href, rel: self.rel, name: self.name, prompt: self.prompt, data: self.data?.copyAndSetAll(dict))
    }
    
    static func queryFromDictionary(dict: [NSObject: AnyObject]) -> CJQuery? {
        if let hrefString = dict["href"] as? String {
            if let href = NSURL(string: hrefString) {
                if let rel = dict["rel"] as? String {
                    let name = dict["name"] as? String
                    let prompt = dict["prompt"] as? String
                    let data = CJData.dataForDictionary(dict)
                    return CJQuery(href: href, rel: rel, name: name, prompt: prompt, data: data)
                }
            }
        }
        return nil
    }
}
