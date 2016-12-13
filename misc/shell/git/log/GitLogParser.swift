import Foundation

class GitLogParser {
    /**
     * Returns an NSDate instance for a date that is derived from a commit log item with pretty format and %ci
     * PARAM: date: "2015-12-03 16:59:09 +0100"
     * EXAMPLE: GitLogParser.date("2015-12-03 16:59:09 +0100").shortDate//Output: "03/12/2016"
     */
    static func date(date:String)->NSDate{
        let dateParts:[String] = date.split(" ")
        let yearMonthDayParts:[String] = dateParts[0].split("-")
        Swift.print("yearMonthDayParts: " + "\(yearMonthDayParts)")
        let year:String = yearMonthDayParts[0]
        
        
        let month:String = yearMonthDayParts[1]
        let day:String = yearMonthDayParts[2]
        Swift.print("year.int: " + "\(year.int)")
        Swift.print("month.int: " + "\(month.int)")
        Swift.print("day.int: " + "\(day.int)")
        let hourMinSecParts:[String] = dateParts[1].split(":")
        Swift.print("hourMinSecParts: " + "\(hourMinSecParts)")
        let hour:String = hourMinSecParts[0]
        let min:String = hourMinSecParts[1]
        let sec:String = hourMinSecParts[2]
        //let timeZone:String = dateParts[2]
        let date:NSDate = NSDate.createDate(year.int, month.int, day.int, hour.int, min.int, sec.int)!
        return date
    }
    typealias CommitData = (hash:String,author:String,date:String,subject:String,body:String)/*convenience*/
    /**
     * Returns a ComitData instance that is populated with auther, date, subject, body
     * EXAMPLE: GitLogParser.commitData("Hash:4caecd \n Author:Eonist \n Date:2015-12-03 16:59:09 +0100 \n Subject:'abc' \n Body:'123'")//Output: a CommitData instance
     * NOTE: the log data is formated using --pretty=format
     */
    static func commitData(input:String) -> CommitData{
        let firstIdx:Int = input.indexOf("\n")
        Swift.print("firstIdx: " + "\(firstIdx)")
        let firstPart:String = input.subString(0,firstIdx)
        Swift.print("firstPart: " + "\(firstPart)")
        //Swift.print("firstPart: " + "\(firstPart)")
        
        let secondIdx:Int = firstIdx+1 + input.subString(firstIdx+1,input.count).indexOf("\n")
        Swift.print("secondIdx: " + "\(secondIdx)")
        
        let secondPart:String = input.subString(firstIdx+1,secondIdx)
        Swift.print("secondPart: " + "\(secondPart)")
        
        let thirdIdx:Int = secondIdx+1 + input.subString(secondIdx+1,input.count).indexOf("\n")
        Swift.print("thirdIdx: " + "\(thirdIdx)")
        
        let thirdPart:String = input.subString(secondIdx+1,thirdIdx)
        Swift.print("thirdPart: " + "\(thirdPart)")
        
        let fourthIdx:Int = thirdIdx+1 + input.subString(thirdIdx+1,input.count).indexOf("\n")
        Swift.print("fourthIdx: " + "\(fourthIdx)")
        
        let fourthPart:String = input.subString(thirdIdx+1,fourthIdx)
        Swift.print("fourthPart: " + "\(fourthPart)")
        
        let fifthPart:String = input.subString(fourthIdx+1,input.count)
        Swift.print("fifthPart: " + "\(fifthPart)")
        
        var commitData:CommitData = (firstPart,secondPart,thirdPart,fourthPart,fifthPart)
        commitData.hash = commitData.hash.subString("Hash:".count, commitData.hash.count)
        commitData.author = commitData.author.subString("Author:".count, commitData.author.count)
        commitData.date = commitData.date.subString("Date:".count, commitData.date.count)
        commitData.subject = commitData.subject.subString("Subject:".count, commitData.subject.count)
        commitData.body = commitData.body.subString("Body:".count, commitData.body.count)
        Swift.print("commitData.hash: " + "\(commitData.hash)")
        Swift.print("commitData.author: " + "\(commitData.author)")
        Swift.print("commitData.date: " + "\(commitData.date)")
        Swift.print("commitData.subject: " + "\(commitData.subject)")
        Swift.print("commitData.body: " + "\(commitData.body)")
        return commitData
    }
}