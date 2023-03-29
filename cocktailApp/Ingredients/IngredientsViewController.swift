//
//  IngredientsController.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-23.
//

import UIKit

class IngredientsViewController: UIViewController {
    
    var myIngredients = [Ingredients]()
    
    var mainView: IngredientsView {
        return self.view as! IngredientsView
    }
    
    override func loadView() {
        self.view = IngredientsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let addButton = UIBarButtonItem(title: "Ajouter", style: .plain, target: self, action: #selector(self.addButttonTapped(_:)))
        navigationItem.leftBarButtonItem = addButton
        navigationItem.rightBarButtonItem = self.editButtonItem
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(IngredientCell.self, forCellReuseIdentifier: IngredientCell.defaultReuseIdentifier)
    }
    
    @objc func addButttonTapped(_ sender:UIBarButtonItem!) {
        let controller = UIAlertController(
            title: "Nouveauté!",
            message: "Vous pouvez désormais ajouter un ingrédient à votre liste.",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Ajouter",
            style: .default) { [self] action in
                let vc = AjouterViewController()
                show(vc, sender: mainView.self.action)
            }
        let second = UIAlertAction(
            title: "Plus tard",
            style: .cancel)
        
        controller.addAction(action)
        controller.addAction(second)
        present(controller, animated: true, completion: nil)
    }
}

extension IngredientsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Datas.get.myIngredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.defaultReuseIdentifier, for: indexPath) as! IngredientCell
        
        cell.imageIng.image = UIImage(named: Datas.get.myIngredients[indexPath.row].imageString)
        cell.ingName.text = Datas.get.myIngredients[indexPath.row].name
        cell.ingDesc.text = Datas.get.myIngredients[indexPath.row].desc
        
//        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//        var config = cell.defaultContentConfiguration()
//        let item = Datas.get.myIngredients[indexPath.row]
//        config.text = item.name
//        config.textProperties.font = UIFont(name: "Menlo-regular", size: 18)!
//        config.textProperties.color = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
//        config.secondaryText = item.desc
//        config.secondaryTextProperties.font = UIFont(name: "Helvetica", size: 14)!
//        config.secondaryTextProperties.numberOfLines = 2
//        config.image = UIImage(named: item.imageString)
//        config.imageProperties.maximumSize = CGSize(width: 50, height: 50)
//        config.imageToTextPadding = CGFloat(20)
//        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = IngredientDetailViewController(ingredient: Datas.get.myIngredients[indexPath.item])
        show(vc, sender: self)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            self.myIngredients.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {

    }

    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let item = Datas.get.myIngredients[fromIndexPath.row]
        myIngredients.remove(at: fromIndexPath.row)
        myIngredients.insert(item, at: to.row)
    }

    // Override to support conditional rearranging of the table view.
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
}

extension UITableViewCell {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
