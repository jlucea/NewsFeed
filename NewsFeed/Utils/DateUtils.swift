//
//  DateUtils.swift
//  NewsFeed
//
//  Created by Jaime Lucea on 26/6/22.
//

import Foundation

class DateUtils {
    
    // Expects input format "yyyy-MM-dd'T'HH:mm:ssZ"
    // Returns
    static func formatDate(dateStr: String, showDay: Bool) -> String {
        let dateFormatterIn = DateFormatter()
        dateFormatterIn.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = dateFormatterIn.date(from: dateStr){
            let dateFormatterOut = DateFormatter()
            dateFormatterOut.locale = Locale(identifier: "en_US")
            if showDay {
                dateFormatterOut.dateFormat = "EEEE, MMM d, yyyy"
            } else {
                dateFormatterOut.dateFormat = "MMM d, yyyy"
            }
            return dateFormatterOut.string(from: date)
        }else{
            return ""
        }
    }
    
}
