//
//  ListViewController.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-03-16.
//

import UIKit

class ListViewController: UIViewController {

    var items: [Item] = []
    var mainView: IngredientsView {
        return self.view as! IngredientsView
    }
    
    override func loadView() {
        self.view = IngredientsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let addButton = UIBarButtonItem(title: "Ajouter", style: .plain, target: self, action: #selector(self.didTapAjouter(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.listReuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.items = Helper.share.getString()
        mainView.tableView.reloadData()
    }
    
    @objc private func didTapAjouter(_ sender:UIBarButtonItem!) {
        let vc = AjouterViewController()
        show(vc, sender: self)
    }
    
}
    
extension ListViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.listReuseIdentifier, for: indexPath) as! ListTableViewCell
        cell.ingLabel.text = items[indexPath.row].safeIngredient
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ListDetailViewController(item: Helper.share.getString()[indexPath.item])
        show(vc, sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Helper.share.remove(items[indexPath.row])
            items = Helper.share.getString()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}


extension UITableViewCell {
    static var listReuseIdentifier: String {
        return String(describing: self)
    }
}

