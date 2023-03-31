//
//  RMSearchResultViewModel.swift
//  RickAndMortyApp
//
//  Created by Максим Мельничук on 31.03.23.
//

import Foundation

enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
