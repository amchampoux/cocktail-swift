//
//  FirstViewController.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-01.
//

import UIKit

class AccueilViewController: UIViewController {
    
    var myCocktails = [Cocktail]()
    
    var mainView: AccueilView {
        view as! AccueilView
    }
    
    override func loadView() {
        self.view = AccueilView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.accueilCaroussel.cocktailCollectionView.delegate = self
        mainView.accueilHero.decouvrirButton.addTarget(self, action: #selector(didTapDecouvrirButton), for: .touchUpInside)
        mainView.accueilHero.voirIngredientsButton.addTarget(self, action: #selector(didTapIngredientsButton), for: .touchUpInside)
        mainView.accueilCaroussel.viewAllButton.addTarget(self, action: #selector(didTapDecouvrirButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc private func didTapDecouvrirButton() {
        let vc = CocktailViewController()
        show(vc, sender: self)
    }
        
    @objc private func didTapIngredientsButton() {
        let vc = IngredientsViewController()
        show(vc, sender: self)
    }
}

extension AccueilViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CocktailDetailViewController(cocktail: Datas.get.myCocktails[indexPath.item])
        vc.modalPresentationStyle = .formSheet
        vc.preferredContentSize = .init(width: 500, height: 800)
        present(vc, animated: true)
    }
}
