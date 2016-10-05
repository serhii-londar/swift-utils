import Cocoa

class RGBAParser {
    /**
     * EXAMPLE: rgba(NSColor.redColor()).r//Outputs //1.0
     * IMPORTANT: does this return 0-1.0 values
     */
    static func rgba(nsColor:NSColor)->RGBA{//<--was: (r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)
        let ciColor:CIColor = CIColor(color: nsColor)!
        return RGBA(ciColor.red,ciColor.green,ciColor.blue,ciColor.alpha)//<--you could just do: color.redComponent.uint etc
    }
    /**
     * Returns values like: 00FF00FF
     */
    static func hex(color:NSColor)->String{
        let r:UInt = color.redComponent.uint*255
        Swift.print("r: " + "\(r)")
        let g:UInt = color.greenComponent.uint*255
        Swift.print("g: " + "\(g)")
        let b:UInt = color.blueComponent.uint*255
        Swift.print("b: " + "\(b)")
        let a:UInt = color.alphaComponent.uint*255
        Swift.print("a: " + "\(a)")
        let hex:String = HexParser.hexString(a,r,g,b)
        return hex
    }
    /**
     * Converts a 32-bit ARGB color value into an ARGB object.
     * @param color: The 32-bit ARGB color value.
     * @return Returns an object with the properties a, r, g, and b defined.
     * @example
     * var rgb:RGB = rgba(0xFF00FFCC)
     * print("Alpha = " + myRGB.a)
     * print("Red = " + myRGB.r)
     * print("Green = " + myRGB.g)
     * print("Blue = " + myRGB.b)
     */
    static func rgba32(color:UInt) -> RGBA{
        let r = color >> 16 & 0xFF
        Swift.print("r: " + "\(r)")
        let g = color >> 8 & 0xFF
        Swift.print("g: " + "\(g)")
        let b = color & 0xFF
        Swift.print("b: " + "\(b)")
        let a = color >> 24 & 0xFF
        Swift.print("a: " + "\(a)")
        return RGBA(r,g,b,a)
    }
}