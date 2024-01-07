//
//  Episode.swift
//  FinalSpaceApp
//
//  Created by Bram Lippens on 03/01/2024.
//

import SwiftUI

struct Episode: Identifiable, Codable{
    let id: Int
    let name, air_date, director, writer, img_url: String
}
