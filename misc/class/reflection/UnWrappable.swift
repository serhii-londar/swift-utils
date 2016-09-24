import Foundation
//Continue here: what you do is that you extend the Types you want to unWrap.
//And use inference similar to the way you made that cast method.
//For more complex types see if they them selfs are UnWrappable. NICE!
/**
 * NOTE: Using init with extension, protocol and classes is a bit troublesome. So a method is used instead of init
 */
protocol UnWrappable {
    func unWrap<T>(xml:XML) -> T?
    func unWrap<T>(xml:XML,_ key:String) -> T?
}
extension UnWrappable{
    /**
     * NOTE: looks at the type and converts that the value into a type
     */
    func unWrap<T>(xml:XML,_ key:String) -> T?{
        if(xml.childCount == 0 || xml.value.count == 0){//return nil if the node has no value and no subNodes
            return nil
        }
        let type:String = xml["type"]!
        let value:String = xml.value
        switch(true) {
        case type == "String":return value as? T
        case type == "CGFloat":return value.cgFloat as? T
        case type == "Double":return value.double as? T
        case type == "Int":return value.int as? T
        case type == "UInt":return value.uint as? T
        case type == "Bool":return value.bool as? T
        case type == "DropShadow":return value as? T
            //if T is UNWrappable then (T as unwrappaple).unwrap(xml)
            //TODO: add the types above to extensions instead
        default : fatalError("TYPE NOT SUPPORTED: " + "\(type)" + " value: " + "\(value)")
        }
    }
}
