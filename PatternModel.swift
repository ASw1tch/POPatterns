//
//  PatternModel.swift
//  POPatterns
//
//  Created by Anatoliy Petrov on 20.3.24..
//

import Foundation

enum PatternModel {
    case ascendingTriangle
    case cupAndHandle
    case descendingTriangle
    case doubleBottom
    case doubleTop
    case headNShoulders
    case pennantOrFlags
    case roundingBottom
    case symmetricalTriangle
    case wedges
    
    var title: String {
        switch self {
        case .ascendingTriangle: return "ASCENDING TRIANGLE"
        case .cupAndHandle: return "CUP AND HANDLE"
        case .descendingTriangle: return "DESCENDING TRIANGLE"
        case .doubleBottom: return "DOUBLE BOTTOM"
        case .doubleTop: return "DOUBLE TOP"
        case .headNShoulders: return "HEAD AND SHOULDERS"
        case .pennantOrFlags: return "PENNANT OR FLAGS"
        case .roundingBottom: return "ROUNDING BOTTOM"
        case .symmetricalTriangle: return "SYMMETRICAL TRIANGLE"
        case .wedges: return "WEDGES"
        }
    }
    
    var description: String {
        switch self {
        case .ascendingTriangle:
            return """
        The ascending triangle is a bullish continuation pattern which signifies the continuation of an uptrend. Ascending triangles can be drawn onto charts by placing a horizontal line along the swing highs – the resistance – and then drawing an ascending trend line along the swing lows – the support. Ascending triangles often have two or more identical peak highs which allow for the horizontal line to be drawn. The trend line signifies the overall uptrend of the pattern, while the horizontal line indicates the historic level of resistance for that particular asset.
        """
        case .cupAndHandle:
            return """
        The cup and handle pattern is a bullish continuation pattern that is used to show a period of bearish market sentiment before the overall trend finally continues in a bullish motion. The cup appears similar to a rounding bottom chart pattern, and the handle is similar to a wedge pattern. Following the rounding bottom, the price of an asset will likely enter a temporary retracement, which is known as the handle because this retracement is confined to two parallel lines on the price graph. The asset will eventually reverse out of the handle and continue with the overall bullish trend.
        """
        case .descendingTriangle:
            return """
        A descending triangle signifies a bearish continuation of a downtrend. Typically, a trader will enter a short position during a descending triangle in an attempt to profit from a falling market. Descending triangles generally shift lower and break through the support because they are indicative of a market dominated by sellers, meaning that successively lower peaks are likely to be prevalent and unlikely to reverse. Descending triangles can be identified from a horizontal line of support and a downward-sloping line of resistance. Eventually, the trend will break through the support and the downtrend will continue.
        """
        case .doubleBottom:
            return """
        A double bottom chart pattern indicates a period of selling, causing an asset’s price to drop below a level of support. It will then rise to a level of resistance, before dropping again. Finally, the trend will reverse and begin an upward motion as the market becomes more bullish. A double bottom is a bullish reversal pattern, because it signifies the end of a downtrend and a shift towards an uptrend.
        """
        case .doubleTop:
            return """
        A double top is another pattern that traders use to highlight trend reversals. Typically, an asset’s price will experience a peak, before retracing back to a level of support. It will then climb up once more before reversing back more permanently against the prevailing trend.
        """
        case .headNShoulders:
            return """
        Head and shoulders is a chart pattern in which a large peak has a slightly smaller peak on either side of it. Traders look at head and shoulders patterns to predict a bullish-to-bearish reversal. Typically, the first and third peak will be smaller than the second, but they will all fall back to the same level of support, otherwise known as the ‘neckline’. Once the third peak has fallen back to the level of support, it is likely that it will breakout into a bearish downtrend.
        """
        case .pennantOrFlags:
            return """
        Pennant patterns, or flags, are created after an asset experiences a period of upward movement, followed by a consolidation. Generally, there will be a significant increase during the early stages of the trend, before it enters into a series of smaller upward and downward movements. Pennants can be either bullish or bearish, and they can represent a continuation or a reversal. While a pennant may seem similar to a wedge pattern or a triangle pattern – it is important to note that wedges are narrower than pennants or triangles. Also, wedges differ from pennants because a wedge is always ascending or descending, while a pennant is always horizontal.
        """
        case .roundingBottom:
            return """
        A rounding bottom chart pattern can signify a continuation or a reversal. For instance, during an uptrend an asset’s price may fall back slightly before rising once more. This would be a bullish continuation. An example of a bullish reversal rounding bottom – shown below – would be if an asset’s price was in a downward trend and a rounding bottom formed before the trend reversed and entered a bullish uptrend. Traders will seek to capitalize on this pattern by buying halfway around the bottom, at the low point, and capitalizing on the continuation once it breaks above a level of resistance.
        """
        case .symmetricalTriangle:
            return """
        The symmetrical triangle pattern can be either bullish or bearish, depending on the market. In either case, it is normally a continuation pattern, which means the market will usually continue in the same direction as the overall trend once the pattern has formed. Symmetrical triangles form when the price converges with a series of lower peaks and higher troughs. If there is no clear trend before the triangle pattern forms, the market could break out in either direction. This makes symmetrical triangles a bilateral pattern – meaning they are best used in volatile markets where there is no clear indication of which way an asset’s price might move.
        """
        case .wedges:
            return """
        Wedges form as an asset’s price movements tighten between two sloping trend lines. There are two types of wedge: rising and falling. A rising wedge is represented by a trend line caught between two upwardly slanted lines of support and resistance. A falling wedge occurs between two downwardly sloping levels. Both rising and falling wedges are reversal patterns, with rising wedges representing a bearish market and falling wedges being more typical of a bullish market.
        """
        }
    }


    var imageName: String {
        switch self {
        case .ascendingTriangle: return "ascending-triangle"
        case .cupAndHandle: return "cup-and-handle"
        case .descendingTriangle: return "descending-triangle"
        case .doubleBottom: return "double-bottom"
        case .doubleTop: return "double-top"
        case .headNShoulders: return "head-n-shoulders"
        case .pennantOrFlags: return "pennant-or-flags"
        case .roundingBottom: return "rounding-bottom"
        case .symmetricalTriangle: return "symmetrical-triangle"
        case .wedges: return "wedges"
        }
    }
}


