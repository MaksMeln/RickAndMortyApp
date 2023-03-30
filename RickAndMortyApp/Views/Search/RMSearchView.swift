//
//  RMSearchView.swift
//  RickAndMortyApp
//
//  Created by Максим Мельничук on 30.03.23.
//

import UIKit

protocol RMSearchViewDelegate: AnyObject {
    func rmsearchView(_ searchView: RMSearchView, didSelectOption option: RMSearchInputViewViewModel.DynamicOptions)
}

final class RMSearchView : UIView {
    
    weak var delegate: RMSearchViewDelegate?
    
    private let viewModel : RMSearchViewViewModel
    
    //MARK: - Subviews
    
    
    private let searchInputView = RMSearchInputView()
    
    private let noResultsView = RMNoSearchResiltsView()
    // No results view
    
    
    //Results CollectionView
    
    
    
    //MARK: - Init
     init(frame: CGRect, viewModel: RMSearchViewViewModel) {
         self.viewModel = viewModel
         super.init(frame: frame)
         backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
         
         addSubviews(noResultsView, searchInputView)
         addConstraints()
         
         searchInputView.configure(with: RMSearchInputViewViewModel(type: viewModel.config.type))
         searchInputView.delegate = self
         
         viewModel.registrOptionChangeBlock { tuple in
             self.searchInputView.update(option: tuple.0, value: tuple.1)
         }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            // Search input view
            searchInputView.topAnchor.constraint(equalTo: topAnchor),
            searchInputView.leftAnchor.constraint(equalTo: leftAnchor),
            searchInputView.rightAnchor.constraint(equalTo: rightAnchor),
            searchInputView.heightAnchor.constraint(equalToConstant: viewModel.config.type == .episode ? 55 : 110),
            
            // No results
            noResultsView.widthAnchor.constraint(equalToConstant: 150),
            noResultsView.heightAnchor.constraint(equalToConstant: 150),
            noResultsView.centerXAnchor.constraint(equalTo: centerXAnchor),
            noResultsView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    public func presentKeyboard() {
        searchInputView.presentKeyboard()
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

//MARK: - RMSearchInputViewDelegate
extension RMSearchView: RMSearchInputViewDelegate {
    func rmSearchInputView(_ inputView: RMSearchInputView, didSelectOption option: RMSearchInputViewViewModel.DynamicOptions) {
        delegate?.rmsearchView(self, didSelectOption: option)
    }
}
