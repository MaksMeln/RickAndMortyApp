//
//  RMSearchInputViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Максим Мельничук on 30.03.23.
//

import Foundation

final class RMSearchInputViewViewModel {
    
    private let type: RMSearchViewController.Config.`Type`
    
    enum DynamicOptions: String {
        case status = "Status"
        case gender = "Gender"
        case locationType = "Location Type"
        
        var choices: [String] {
            switch self {
            case .status:
                return ["alve", "dead", "unknown"]
            case .gender:
                return ["male", "female", "genderless", "unknown"]
            case .locationType:
                return ["cluster", "planet", "microverse"]
            }
        }
    }
    
    init(type: RMSearchViewController.Config.`Type`) {
        self.type = type
    }
    
    //MARK: - Public
    
    public var hasDynamicOptions: Bool {
        switch self.type {
        case .character, .location :
            return true
        case .episode :
            return false
            
        }
    }
    
    public var options: [DynamicOptions] {
        switch self.type {
        case .character:
            return [.status, .gender]
        case .location:
            return [.locationType]
        case .episode :
            return []
        }
    }
    
    public func executeSearch() {
            // Create Request based on filters
        
            // Send API Call
        
            // Notify view of results, no results, or error
        }
    
    public var searchPlacecholderText: String {
        switch self.type {
        case .character:
            return "Character Name"
        case .location:
            return "Location Name"
        case .episode :
            return "Episode Title"
        }
    }
    
}
