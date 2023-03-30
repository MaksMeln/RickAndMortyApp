//
//  RMLocationsViewController.swift
//  RickAndMortyApp
//
//  Created by Максим Мельничук on 30.03.23.
//

import UIKit

final class RMLocationViewController: UIViewController, RMLocationViewViewModelDelegate, RMLocationViewDelegate {

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
        primaryView.delegate = self
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
    
    // MARK: - RMLocationViewDelegate
      func rmLocationView(_ locationView: RMLocationView, didSelect location: RMLocation) {
          let vc = RMLocationDetailViewController(location: location)
          vc.navigationItem.largeTitleDisplayMode = .never
          navigationController?.pushViewController(vc, animated: true)
      }
    
    // MARK: - LocationViewModel Delegate
      func didFetchInitialLocations() {
          primaryView.configure(with: viewModel)
      }
}
