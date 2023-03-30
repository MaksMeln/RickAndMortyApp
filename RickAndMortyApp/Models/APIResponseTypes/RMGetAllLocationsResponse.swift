//
//  RMGetAllLocationsResponse.swift
//  RickAndMortyApp
//
//  Created by Максим Мельничук on 30.03.23.
//

import Foundation

struct RMGetAllLocationsResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [RMLocation]
}
