import Foundation

public struct CJData {
    let elems: [CJDataElem]
    let dict: [String: AnyObject]
    let prompts: [String: String]
    
    public init(elems: [CJDataElem]) {
        self.elems = elems
        var dict = [String: AnyObject]()
        var prompts = [String: String]()
        for i in 0..<elems.count {
            if let value: AnyObject = elems[i].value {
                dict[elems[i].name] = value
            }
            if let prompt = elems[i].prompt {
                prompts[elems[i].name] = prompt
            }
        }
        self.dict = dict
        self.prompts = prompts
    }
    
    static func fromDict(dict: [NSObject: AnyObject]) -> CJData {
        var elems = [CJDataElem]()
        for (key, value) in dict {
            if let k = key as? String {
                elems.append(CJDataElem(name: k, prompt: nil, value: value))
            }
        }
        return CJData(elems: elems)
    }
    
    func toSeri() -> [String: [[String: AnyObject]]] {
        var elemArray = [[String: AnyObject]]()
        for elem in self.elems {
            elemArray.append(elem.toSeri())
        }
        
        return [
            "data": elemArray
        ]
    }
    
    func promptFor(name: String) -> String {
        return prompts[name] ?? name
    }
    
    func copyAndSetAll(dict: [String: AnyObject]) -> CJData {
        let newElems = elems.map { (elem: CJDataElem) -> CJDataElem in
            return elem.copyAndSet(dict[elem.name])
        }
        return CJData(elems: newElems)
    }
    
    static func dataForArray(arr: [AnyObject]) -> CJData {
        var elems = [CJDataElem]()
        
        for i in 0..<arr.count {
            if let propDict = arr[i] as? [NSObject: AnyObject] {
                if let elem = CJDataElem.elementFromDictionary(propDict) {
                    elems.append(elem)
                }
            }
        }
        return CJData(elems: elems)
    }
    
    static func dataForDictionary(dict: [NSObject: AnyObject]) -> CJData? {
        if let dataArray = dict["data"] as? [AnyObject] {
            return dataForArray(dataArray)
        }
        return nil
    }
}
