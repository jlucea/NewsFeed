//
//  DateUtils.swift
//  NewsFeed
//
//  Created by Jaime Lucea on 26/6/22.
//

import Foundation

class DateUtils {
    
    static func formatDate(dateStr: String) -> String {
        let dateFormatterIn = DateFormatter()
        dateFormatterIn.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = dateFormatterIn.date(from: dateStr){
            let dateFormatterOut = DateFormatter()
            dateFormatterOut.locale = Locale(identifier: "en_US")
            dateFormatterOut.dateFormat = "EEEE, MMM d, yyyy"
            return dateFormatterOut.string(from: date)
        }else{
            return ""
        }
    }
    
}
