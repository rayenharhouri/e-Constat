//
//  HistoryViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 19/11/2022.
//

import UIKit

class HistoryViewController: UIViewController {
    var list : [String] = []
    var idUser : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        if  let data = UserDefaults.standard.data(forKey: "utilisateur")
         {
         do {
             let decoder =  JSONDecoder()
             let user = try decoder.decode(User.self, from: data)
             idUser = user._id!
             
         } catch {
             print("Unable to decode")
              }
        }
        ConstatViewModel().recupererTout(idU: idUser, completed: { (success, reponse) in
            if success {
                self.list = reponse!
                print("ézeaeaze")
                print(self.list)
            } else {
                self.present(Alert.makeAlert(titre: "Warning", message: "Wrong Informations"), animated: true)
            }
        })
        tableView.reloadData()
    }
    @IBOutlet weak var tableView: UITableView!
    
}
extension HistoryViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let cv = cell?.contentView
        let label = cv?.viewWithTag(2) as! UILabel
        label.text = list[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
   
}

