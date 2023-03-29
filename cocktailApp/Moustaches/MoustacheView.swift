//
//  MoustacheView.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-03-06.
//

import UIKit
import PinLayout

class MoustacheView: UIView {
    
    var myMoustaches: [Moustache] = Datas.get.allMoustaches
    var currentMoustacheIndex = 0 {
        didSet {
            let cell = moustacheCollectionView.cellForItem(at: IndexPath(item: oldValue, section: 0)) as? MoustacheCell
            cell?.selection = false
        }
    }
    
    let moustacheTitle: UILabel = {
        let label = UILabel()
        label.text = "Moustache.title"
        label.textAlignment = .center
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.font = UIFont(name: "Menlo-regular", size: 32)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    let moustacheImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Dali")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let moustacheDescription: UILabel = {
        let label = UILabel()
        label.text = "Les moustaches de ce style sont généralement petites, minces et étroites comme si elles avaient été tracées au crayon. En fait, celles-ci suivent la ligne de la lèvre supérieure sans jamais y toucher. Ces moustaches ne doivent jamais non plus toucher le nez. Elles devraient être bien centrées de façon à ce que les deux régions de part et d'autre de la moustache soient symétriques. Ce style de moustache peut prendre plusieurs variations. Par exemple, plutôt que d'être qu'en un seul trait, la moustache peut avoir une petite séparation au niveau du philtrum (petites fossettes au milieu de la lèvre supérieure). Sinon, l'angle de la moustache elle-même peut être également modifiée. "
        label.textColor = UIColor(red: 80/256, green: 107/256, blue: 91/256, alpha: 1)
        label.font = UIFont(name: "Helvetica-Light", size: 18)
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private lazy var moustacheCollectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.itemSize = CGSize(width: 100, height: 100)
        flow.minimumLineSpacing = 20
        flow.minimumInteritemSpacing = 15
        flow.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MoustacheCell.self, forCellWithReuseIdentifier: MoustacheCell.identifier)
        collectionView.backgroundColor = UIColor(red: 216/256, green: 226/256, blue: 220/256, alpha: 1)
        collectionView.layer.cornerRadius = 8
        return collectionView
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupView()
        setupMoustache()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(moustacheTitle)
        addSubview(moustacheImage)
        addSubview(moustacheDescription)
        addSubview(moustacheCollectionView)
    }
    
    func setupMoustache(){
        let moustache = myMoustaches[currentMoustacheIndex]
        moustacheTitle.text = moustache.title
        moustacheDescription.text = moustache.desc
        moustacheImage.image = moustache.image
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        moustacheTitle.pin.topCenter(100).width(80%).sizeToFit(.width)
        moustacheImage.pin.below(of: moustacheTitle).marginTop(20).hCenter().width(150).height(150)
        moustacheDescription.pin.below(of: moustacheImage).marginTop(10).left(30).right(30).sizeToFit(.width)
        moustacheCollectionView.pin.bottom(pin.safeArea).marginBottom(10).hCenter().width(94%).height(140)
    }
}

extension MoustacheView: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Datas.get.allMoustaches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoustacheCell.identifier, for: indexPath) as! MoustacheCell
        cell.myImageView.image = UIImage(named: Datas.get.allMoustaches[indexPath.item].name)
        cell.selection = currentMoustacheIndex == indexPath.item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentMoustacheIndex = indexPath.item
        setupMoustache()
    }

}
