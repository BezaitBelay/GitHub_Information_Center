//
//  DateExtensions.swift
//  GitHub_Information_Center
//
//  Created by Dynamo Software on 6.03.22.
//

import Foundation

extension String {
    
    func getDateFromString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        let date = dateFormatter.date(from: self)
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: date ?? Date())
    }
}
