//
//  CarViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 19/11/2022.
//

import UIKit

class CarViewController: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource{
    
    var list : [Car] = []
    var selectedCar : Car?

    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    
    
    @IBOutlet weak var cvOutlet: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let cv = cell.contentView
        let image = cv.viewWithTag(1) as! UIImageView
        //image.image = UIImage(named: test[indexPath.row])
        
        image.load(url: list[indexPath.row].carIcon)
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "carSegue" {
            let destination = segue.destination as! CarDetailsViewController
            destination.currentCar = selectedCar
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCar = list[indexPath.row]
        self.performSegue(withIdentifier: "carSegue", sender: selectedCar)
    }
    
    private let collectionView = UICollectionView(frame: .zero,collectionViewLayout: UICollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
      getAllCars()
        
        if list.isEmpty {
            print("lsit empty")
        } else {
            cvOutlet.reloadData()
        }
    }
    func getAllCars() {
        CarViewModel.sharedInstance.recupererTout {success, carFromRep in
            if success {
                self.list = carFromRep!
                if self.list.isEmpty {
                    print("lsit empty")
                } else {
                    self.cvOutlet.reloadData()
                }
                print("&&&&&&&&&")
                print(self.list)
                print("&&&&&&&&&")
            } else {
                self.present(Alert.makeAlert(titre: "Error", message: "Could not load cars "),animated: true)
            }
        }
    }
}
    
extension UIImageView {
    func load(url : String) {
        guard let url = URL(string: url)else{
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
