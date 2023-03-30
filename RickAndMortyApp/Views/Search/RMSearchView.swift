//
//  RMSearchView.swift
//  RickAndMortyApp
//
//  Created by Максим Мельничук on 30.03.23.
//

import UIKit

final class RMSearchView : UIView {
    
    private let viewModel : RMSearchViewViewModel
    
    //MARK: - Subviews
    
    //MARK: - SearchInputView(bar, selection buttons)
    
    
    // No results view
    
    
    //Results CollectionView
    
    
    
    //MARK: - Init
     init(frame: CGRect, viewModel: RMSearchViewViewModel) {
         self.viewModel = viewModel
         super.init(frame: frame)
        
        backgroundColor = .red
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - CollectionView

extension RMSearchView : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }
    
}
