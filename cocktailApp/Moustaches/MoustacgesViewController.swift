//
//  IngredientsController2.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-24.
//

import UIKit

class MoustachesViewController: UIViewController {
    
    var myMoustaches = [Moustache]()
    
//    private var collectionView: UICollectionView?
    
    override func loadView() {
        let view = MoustacheView()
        self.view = view

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}
