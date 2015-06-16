import Foundation

public struct CJLink {
    
    let href: NSURL
    let rel: String
    let render: CJRender
    let prompt: String?
    let other: [String: String]
    
    public init(href: NSURL, rel: String, render: CJRender, prompt: String?, other: [String: String]?) {
        self.href = href
        self.rel = rel
        self.render = render
        self.prompt = prompt
        self.other = other ?? [String: String]()
    }
    
    static func linkForDictionary(dict: [NSObject: AnyObject]) -> CJLink? {
        var mDict = dict
        if let hrefStr = mDict.removeValueForKey("href") as? String {
            if let href = NSURL(string: hrefStr) {
                if let rel = mDict.removeValueForKey("rel") as? String {
                    let render = CJRender(rawValue: (mDict.removeValueForKey("render") as? String) ?? "link")
                    let prompt = mDict.removeValueForKey("prompt") as? String
                    var other = [String: String]()
                    for (keyObj, valueObj) in mDict {
                        if let key = keyObj as? String {
                            if let value = valueObj as? String {
                                other[key] = value
                            }
                        }
                    }
                    
                    return CJLink(href: href, rel: rel, render: render!, prompt: prompt, other: other)
                }
            }
        }
        return nil
    }
    
    
}
