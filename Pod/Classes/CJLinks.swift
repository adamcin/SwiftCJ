import Foundation

struct CJLinks {
    
    let firstByRel: [String: CJLink]
    let allByRel: [String: [CJLink]]
    
    init(firstByRel: [String: CJLink], allByRel: [String: [CJLink]]) {
        self.firstByRel = firstByRel
        self.allByRel = allByRel
    }
    
    static func linksForDictionary(dict: [NSObject: AnyObject]) -> CJLinks? {
        if let linkObjs = dict["links"] as? [AnyObject] {
            var firstByRel = [String: CJLink]()
            var allByRel = [String: [CJLink]]()
            for i in 0..<linkObjs.count {
                if let linkDict = linkObjs[i] as? [NSObject: AnyObject] {
                    if let link = CJLink.linkForDictionary(linkDict) {
                        firstByRel[link.rel] = link
                        var all = allByRel[link.rel] ?? [CJLink]()
                        all.append(link)
                        allByRel[link.rel] = all
                    }
                }
            }
            return CJLinks(firstByRel: firstByRel, allByRel: allByRel)
        }
        return nil
    }
}
