//
//  RMLocationViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Максим Мельничук on 30.03.23.
//

import Foundation

final class RMLocationViewViewModel {

    private var locations: [RMLocation] = []

    // Location response info
    // WIll contain next url, if present
    private var cellViewModels: [String] = []

    init() {}

    public func fetchLocations() {
        RMService.shared.execute(.listLocationsRequest, expecting: String.self) { result in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                break
            }
        }
    }

    private var hasMoreResults: Bool {
        return false
    }
}
