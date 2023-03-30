//
//  RMLocationsViewController.swift
//  RickAndMortyApp
//
//  Created by Максим Мельничук on 30.03.23.
//

import UIKit

final class RMLocationViewController: UIViewController, RMLocationViewViewModelDelegate {

    private let primaryView = RMLocationView()

       private let viewModel = RMLocationViewViewModel()

       // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(primaryView)
        view.backgroundColor = .systemBackground
        title = "Locations"
        
        viewModel.delegate = self
               viewModel.fetchLocations()
        
        addSearchButton()
        addConstraints()
       }

       private func addSearchButton() {
           navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
       }
    
    private func addConstraints() {
            NSLayoutConstraint.activate([
                primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                primaryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                primaryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
                primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
        }


       @objc private func didTapSearch() {

    }
    
    // MARK: - LocationViewModel Delegate
      func didFetchInitialLocations() {
          primaryView.configure(with: viewModel)
      }
}
