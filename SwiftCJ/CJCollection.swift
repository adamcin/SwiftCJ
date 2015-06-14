import Foundation

class CJCollection {
    let href: NSURL
    let httpCode: Int?
    let version: String
    let links: CJLinks?
    let error: CJError?
    let queries: CJQueries?
    let template: CJTemplate?
    let items: [CJItem]
    
    init(href: NSURL, version: String?, links: CJLinks?, error: CJError?, queries: CJQueries?, template: CJTemplate?, items: [CJItem], httpCode: Int? = nil) {
        self.href = href
        self.version = version ?? "1.0"
        self.links = links
        self.error = error
        self.queries = queries
        self.template = template
        self.items = items
        self.httpCode = httpCode
    }
    
    class func collectionForDictionary(dict: [NSObject: AnyObject], httpCode: Int? = nil) -> CJCollection? {
        if let collectionDict = dict["collection"] as? [NSObject: AnyObject] {
            if let hrefString = collectionDict["href"] as? String {
                if let href = NSURL(string: hrefString) {
                    let version = collectionDict["version"] as? String
                    let links = CJLinks.linksForDictionary(collectionDict)
                    let error = CJError.errorForDictionary(collectionDict)
                    let queries = CJQueries.queriesForDictionary(collectionDict)
                    let template = CJTemplate.templateForDictionary(collectionDict)
                    let items = CJItem.itemsForDictionary(collectionDict)
                    return CJCollection(href: href, version: version, links: links, error: error, queries: queries, template: template, items: items, httpCode: httpCode)
                }
            }
        }
        return nil
    }
    
    class func collectionForNSData(data: NSData!, error: NSErrorPointer, httpCode: Int? = nil) -> CJCollection? {
        var internalError: NSError?
        var jsonObj: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: &internalError)
        if let json = jsonObj as? [NSObject: AnyObject] {
            return collectionForDictionary(json, httpCode: httpCode)
        }
        return nil
    }
}
