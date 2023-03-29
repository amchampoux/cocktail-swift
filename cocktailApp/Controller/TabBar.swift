//
//  TabBar.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-01-31.
//

import UIKit

class TabBar: UITabBarController {


    override func viewDidLoad() {
    super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .white
        tabBar.tintColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        setupVCs()
        
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: AccueilViewController(),
                                   title: NSLocalizedString("Accueil", comment: ""), image: UIImage(systemName: "sun.and.horizon")!),
            createNavController(for: CocktailViewController(),
                                   title: NSLocalizedString("Cocktail", comment: ""), image: UIImage(systemName: "list.bullet.rectangle")!),
            createNavController(for: EquipesViewController(),
                                   title: NSLocalizedString("Équipes", comment: ""), image: UIImage(systemName: "sportscourt.fill")!),
            createNavController(for: ListViewController(),
                                   title: NSLocalizedString("Ma liste", comment: ""), image: UIImage(systemName: "takeoutbag.and.cup.and.straw")!),
            createNavController(for: MoustachesViewController(),
                                   title: NSLocalizedString("Moustache", comment: ""), image: UIImage(systemName: "text.magnifyingglass")!),
            createNavController(for: ChaussuresViewController(),
                                   title: NSLocalizedString("Chaussures", comment: ""), image: UIImage(systemName: "tag")!)
            
        ]
    }
        
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                        title: String,
                                                        image: UIImage) -> UIViewController {
            let navController = UINavigationController(rootViewController: rootViewController)
            navController.tabBarItem.title = title
            navController.tabBarItem.image = image
            navController.navigationBar.prefersLargeTitles = true
            rootViewController.navigationItem.title = title
            return navController
        }

         // if #available(iOS 13, *) {
            //    let appearance = self.tabBar.standardAppearance.copy()
            //    appearance.backgroundImage = UIImage()
             //   appearance.shadowImage = UIImage()//
           //     self.tabBar.standardAppearance = appearance
          //  } else {
          //      self.tabBar.shadowImage = UIImage()
          //      self.tabBar.backgroundImage = UIImage()
          //  }

          //  //Change These values according to your requirement. This will work for all iOS versions
          //  self.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
          //  self.tabBar.layer.shadowOpacity = 0.3
          //  self.tabBar.layer.shadowRadius = 5
    }


