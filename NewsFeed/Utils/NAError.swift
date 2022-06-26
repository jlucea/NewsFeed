//
//  Error.swift
//  NewsFeed
//
//  Created by Jaime Lucea on 26/6/22.
//

import Foundation

enum NAError : Error {
    
    case JSONError
    case serverError
    case noResponseError
    case unknownError
    
}
