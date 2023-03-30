//
//  RMSearchViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Максим Мельничук on 30.03.23.
//

import Foundation

// Responsibilities
// - show search results
// - show no results view
// - kick off API requests
final class RMSearchViewViewModel {
    let config: RMSearchViewController.Config

    init(config: RMSearchViewController.Config) {
        self.config = config
    }
}
