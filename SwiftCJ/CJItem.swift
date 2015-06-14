import Foundation

struct CJItem {
    
    let href: NSURL?
    let links: CJLinks?
    let data: CJData?
    let other: [NSObject: AnyObject]
    
    init(href: NSURL?, links: CJLinks?, data: CJData?, other: [NSObject: AnyObject]) {
        self.href = href
        self.links = links
        self.data = data
        self.other = other
    }
    
    static func itemForDictionary(dict: [NSObject: AnyObject]) -> CJItem {
        var mDict = dict
        var href: NSURL?
        if let hrefString = mDict.removeValueForKey("href") as? String {
            href = NSURL(string: hrefString)
        }
        let links = CJLinks.linksForDictionary(dict)
        mDict.removeValueForKey("links")
        let data = CJData.dataForDictionary(dict)
        mDict.removeValueForKey("data")
        return CJItem(href: href, links: links, data: data, other: mDict)
    }
    
    static func itemsForDictionary(dict: [NSObject: AnyObject]) -> [CJItem] {
        var items = [CJItem]()
        if let itemsArray = dict["items"] as? [AnyObject] {
            for i in 0..<itemsArray.count {
                if let itemDict = itemsArray[i] as? [NSObject: AnyObject] {
                    let href: AnyObject? = itemDict["href"]
                    println("-- item href: \(href)")
                    items.append(itemForDictionary(itemDict))
                }
            }
        }
        return items
    }

}
