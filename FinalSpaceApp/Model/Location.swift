//
//  Location.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 02/01/2024.
//

import Foundation

struct Location: Identifiable, Codable{
    let id: Int
    let name, type, img_url: String
    let inhabitants: [String]
}
