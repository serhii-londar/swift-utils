import Foundation
class NumberAsserter{
    /**
     * @Note: In most cases you will want to write if(someNumber < 0)
     */
    class func negative(number:CGFloat)->Bool {
        return number < 0;
    }
    /**
     * @Note: In most cases you will want to write if(someNumber >
     */
    class func positive(number:CGFloat)->Bool {
        return number > 0;
    }
}