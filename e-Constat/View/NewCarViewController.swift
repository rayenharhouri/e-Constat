//
//  NewCarViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 25/11/2022.
//

import UIKit

class NewCarViewController: UIViewController , UISearchBarDelegate{
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Select Brand"
        self.tableView.separatorStyle = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
        searchBar.delegate = self
        configuration()
    }
    var list : [String] = [String]()
    let Cars : [String] = ["Alfa Romeo","Audi","Bentley","BMW","Brabus","Chery","Chevrolet","Chrysler","Citroen","Corvette","Dacia","Fiat","Ford","Geely","Genesis","GMC","Haval","Honda","Hummer","Hyundai","Infiniti","Isuzu","Iveco","Jaguar","Jeep","Kia","Lamborghini","Land Rover","Lexus","Mahindra","MAN","Maserati","Maybach","Mazda","Mercedes Benz","MG","Mini","Mitsubishi","Nissan","Opel","Peugeot","Porsche","Renault","SEAT","Skoda","SsangYong","Suzuki","Triumph","Volkswagen"]

    func configuration() {
        for brand in Cars{
                
                list.append(brand)
            
        }
        self.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        list = []
        
        if searchText == ""
        {
            list = Cars
        }
        
        for word in Cars {
            if word.uppercased().contains(searchText.uppercased()){
                list.append(word)
            }
        }
        tableView.reloadData()
    }
}

extension NewCarViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = list[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "FormCarViewController") as? FormCarViewController {
            vc.brand = list[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

