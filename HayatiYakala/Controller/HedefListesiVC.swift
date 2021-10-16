//
//  HedefListesiVC.swift
//  HayatiYakala
//
//  Created by Oktay Tanrıkulu on 20.09.2020.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class HedefListesiVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var hedefler : [Hedef] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hedefleriYukle()
    }
    
    func hedefleriYukle() {
        self.hedefleriGetir { (success) in
            if hedefler.count >= 1 {
                self.tableView.isHidden = false
                
            } else {
                self.tableView.isHidden = true
            }
        }
        
        self.tableView.reloadData()
    }

    @IBAction func addClicked(_ sender: UIButton) {
        
        guard let hedefEkleVC = storyboard?.instantiateViewController(withIdentifier: "HedefEkleVC") else {
            return
        }
        
        presentNew(hedefEkleVC)
        
    }
    
}

extension HedefListesiVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hedefler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "hedefCell", for: indexPath) as? HedefCell else {
            return UITableViewCell()
        }
        let hedef = hedefler[indexPath.row]
        cell.gorunumAyarla(hedef: hedef)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // Delete ACtion
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Hedefi Sil") { (action, indexPath) in
            self.hedefSil(indexPath: indexPath)
            self.hedefleriYukle()
        }
        deleteAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        // Update Action
        let updateAction = UITableViewRowAction(style: .normal, title: "1 Ekle") { (action, indexPath) in
            self.hedefGüncelle(indexPath: indexPath)
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        updateAction.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        return [deleteAction, updateAction]
    }
    
    
    
}

extension HedefListesiVC {
    
    func hedefleriGetir(completion: (_ complete: Bool) -> ()) {
        
        guard let context = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Hedef>(entityName: "Hedef")
        
        do {
            hedefler = try context.fetch(fetchRequest)
            completion(true)
        } catch let error {
            debugPrint(error.localizedDescription)
            completion(false)
        }
        
    }
    
    func hedefGüncelle(indexPath: IndexPath) {
        
        guard let context = appDelegate?.persistentContainer.viewContext else { return }
        let seciliHedef = hedefler[indexPath.row]
        
        if seciliHedef.hedefGecerliSayi < seciliHedef.hedefTamamlamaSayisi {
            seciliHedef.hedefGecerliSayi += 1
        } else {
            return
        }
        
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func hedefSil(indexPath: IndexPath) {
        
        guard let context = appDelegate?.persistentContainer.viewContext else { return }
        
        context.delete(hedefler[indexPath.row])
        
        do {
            try context.save()
            self.hedefler.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
}
