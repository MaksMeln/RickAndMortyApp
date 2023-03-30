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
    private var optionMap : [RMSearchInputViewViewModel.DynamicOptions: String] = [:]
    private var searchText = ""
    
    private var optionMapUpdateBlock: (((RMSearchInputViewViewModel.DynamicOptions, String)) -> Void)?
    
    //MARK: - Init
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
    
    //MARK: - Public
    
    public func executeSearch() {
            // Create Request based on filters
        
            // Send API Call
        
            // Notify view of results, no results, or error
        }
    
    public func set(query text: String) {
        self.searchText = text
    }
    
    public func set(value: String, for option: RMSearchInputViewViewModel.DynamicOptions) {
        optionMap[option] = value
        let tuple = (option, value)
        optionMapUpdateBlock?(tuple)
    }
    
    public func registrOptionChangeBlock(
        _ block: @escaping ((RMSearchInputViewViewModel.DynamicOptions, String)) -> Void) {
            self.optionMapUpdateBlock = block
    }
}
