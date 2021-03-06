import Foundation
/**
 * Makes it easier to work with Year,Month,Day. NDDate is overkill for year and month aritmetic, for day it is used to calc leap years etc
 * NOTE: the drawback of making it hashable is that it's harder to debug the key so don't do it
 */
typealias YMD = YearMonthDay
struct YearMonthDay {
    let year:Int,month:Int,day:Int
}
