import Foundation

struct FlexBoxContainer{
    var rect:CGRect
    var flexibles:[Flexible]
    var justifyContent:FlexBoxType.Justify
    var alignItems:FlexBoxType.AlignItems
    //var wrapType:FlexWrapType
    //var flexDir:FlowFlexDirType,row,collumn,reverseRow,collumnReverse
    init(_ rect:CGRect, _ flexibles:[Flexible] = [], _ justifyContent:FlexBoxType.Justify = .flexStart, _ alignItems:FlexBoxType.AlignItems = .flexStart){
        self.rect = rect
        self.flexibles = flexibles
        self.justifyContent = justifyContent
        self.alignItems = alignItems
    }
}
