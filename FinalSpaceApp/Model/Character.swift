//
//  Character.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 02/01/2024.
//

import SwiftUI

struct Character: Identifiable, Codable{
    let id: Int
    let name, img_url: String
    let status, species, gender, hair, origin: String?
    let alias, abilities: [String]
}
