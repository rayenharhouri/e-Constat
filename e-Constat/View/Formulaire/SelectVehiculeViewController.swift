//
//  SelectVehiculeViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 5/12/2022.
//

import UIKit


class SelectVehiculeViewController: UIViewController {
    var list : [String] = ["car","motour","kamyoun"]
    var type : String = "" 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.clear
    }
    


    @IBOutlet weak var tableView: UITableView!
    
}
extension SelectVehiculeViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let cv = cell?.contentView
        let image = cv?.viewWithTag(1) as! UIImageView
        image.image = UIImage(named: list[indexPath.row])
        cell?.backgroundColor = UIColor.clear
        return cell!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectedTypeSegue" {
            let destination = segue.destination as! SelectedTypeViewController
            destination.type = type
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        type = list[indexPath.row]
        self.performSegue(withIdentifier: "SelectedTypeSegue", sender: type)
        
    }
}
