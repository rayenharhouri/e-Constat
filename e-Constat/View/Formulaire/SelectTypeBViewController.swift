//
//  SelectTypeBViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 11/12/2022.
//

import UIKit

class SelectTypeBViewController: UIViewController {
    var list : [String] = ["car","motour","kamyoun"]
    var type : String = ""
    var carBid : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TableView.backgroundColor = UIColor.clear
        print(carBid!)
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var TableView: UITableView!
    
}
extension SelectTypeBViewController : UITableViewDelegate,UITableViewDataSource {
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
        if segue.identifier == "SelectTypeBSegue" {
            let destination = segue.destination as! SelecVehicleBViewController
            destination.type = type
            destination.carId = carBid!
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        type = list[indexPath.row]
        self.performSegue(withIdentifier: "SelectTypeBSegue", sender: type)
        self.performSegue(withIdentifier: "SelectTypeBSegue", sender: carBid!)
    }
}

