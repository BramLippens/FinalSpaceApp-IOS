//
//  Location.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 02/01/2024.
//

import SwiftUI

struct Location: Identifiable, Codable{
    var id: Int
    var name, type, img_url: String
    var inhabitants: [String]
}

