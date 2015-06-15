import Foundation

struct CJQueries {

    let firstByRel: [String: CJQuery]
    let allByRel: [String: [CJQuery]]
    
    init(firstByRel: [String: CJQuery], allByRel: [String: [CJQuery]]) {
        self.firstByRel = firstByRel
        self.allByRel = allByRel
    }
    
    static func queriesForDictionary(dict: [NSObject: AnyObject]) -> CJQueries? {
        if let queriesArray = dict["queries"] as? [AnyObject] {
            var firstByRel = [String: CJQuery]()
            var allByRel = [String: [CJQuery]]()
            for i in 0..<queriesArray.count {
                if let queryDict = queriesArray[i] as? [NSObject: AnyObject] {
                    if let query = CJQuery.queryFromDictionary(queryDict) {
                        firstByRel[query.rel] = query
                        var all = allByRel[query.rel] ?? [CJQuery]()
                        all.append(query)
                        allByRel[query.rel] = all
                    }
                }
            }
            return CJQueries(firstByRel: firstByRel, allByRel: allByRel)
        }
        return nil
    }
}
