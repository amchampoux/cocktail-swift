//
//  SecondViewController.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-01.
//

import UIKit


class CocktailViewController: UIViewController  {
    

    var myCocktails = [Cocktail]()
    
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    func setupView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: 100, height: 160)



        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(CocktailCell.self,
                                forCellWithReuseIdentifier: CocktailCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        }
    }
}
    
extension CocktailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Datas.get.myCocktails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CocktailCell.identifier, for: indexPath) as! CocktailCell
        
        cell.myImageView.image = UIImage(named: Datas.get.myCocktails[indexPath.row].imageString)
        cell.myLabel.text = Datas.get.myCocktails[indexPath.row].name
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CocktailDetailViewController(cocktail: Datas.get.myCocktails[indexPath.item])
        vc.modalPresentationStyle = .formSheet
        vc.preferredContentSize = .init(width: 500, height: 800)
        present(vc, animated: true)
    }
}

