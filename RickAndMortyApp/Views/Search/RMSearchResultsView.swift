//
//  RMSearchResultsView.swift
//  RickAndMortyApp
//
//  Created by Максим Мельничук on 31.03.23.
//

import UIKit

/// Show search results UI (table or collection)
final class RMSearchResultsView: UIView {

    private var viewModel: RMSearchResultViewModel? {
        didSet {
            self.proccessViewModel()
        }
    }
    
    private let tableView: UITableView = {
       let tableView = UITableView ()
        tableView.register(RMLocationTableViewCell.self,
                           forCellReuseIdentifier: RMLocationTableViewCell.cellIdentifier)
        tableView.isHidden = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemRed
        return tableView
    }()
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews(tableView)
        
        addConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func proccessViewModel() {
        guard let viewModel = viewModel else {
            return
        }
        switch viewModel {
        case .characters(let viewModel):
            setUpCollectionView()
        case .episodes(let viewModel):
            setUpCollectionView()
        case .locations(let viewModel):
            setUpTableView()
           
        }
    }
    
    private func setUpCollectionView() {
        
    }
    
    private func setUpTableView() {
        tableView.isHidden = false
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        tableView.backgroundColor = .systemRed
    }
    
    public func configure(with viewModel: RMSearchResultViewModel) {
        self.viewModel = viewModel
    }
    
}
