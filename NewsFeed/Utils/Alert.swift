//
//  Alert.swift
//  NewsFeed
//
//  Created by Jaime Lucea on 26/6/22.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    var title : Text
    var message : Text
    var dismissButton: Alert.Button?
}


enum AlertContext {
    
    static let invalidData = AlertItem(title: Text("Invalid Data"),
                                       message: Text("The data received from the server is invalid. Please try again"),
                                       dismissButton: .default(Text("Ok")))
    
    static let serverError = AlertItem(title: Text("Server Error"),
                                       message: Text("The data received from the server is invalid. Please try again"),
                                       dismissButton: .default(Text("Ok")))
    
    static let noResponse = AlertItem(title: Text("Server unavailable"),
                                       message: Text("Couldn't reach server. Please try again."),
                                       dismissButton: .default(Text("Ok")))
    
    static let unknownError = AlertItem(title: Text("Error"),
                                       message: Text("An unknown error has happened."),
                                       dismissButton: .default(Text("Ok")))
    
}
