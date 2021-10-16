//
//  HedefOlusturVC.swift
//  HayatiYakala
//
//  Created by Oktay Tanrıkulu on 21.09.2020.
//

import UIKit

class HedefOlusturVC: UIViewController {

    @IBOutlet weak var btnHedefOlustur: UIButton!
    @IBOutlet weak var hedefSayiField: UITextField!
    
    var hedefAciklama : String!
    var hedefTipi : HedefTipleri!
    
    func hedefAtama(aciklama: String, tip: HedefTipleri) {
        self.hedefAciklama = aciklama
        self.hedefTipi = tip
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnHedefOlustur.klavyeTasimasi()
    }

    @IBAction func btnHedefOlusturClicked(_ sender: UIButton) {
        
        if hedefSayiField.text != "" && Int(hedefSayiField.text!)! > 0 {
            self.save { (success) in
                if success {
                   dismiss(animated: true, completion: nil)
                }
            }
        }
        
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let context = appDelegate?.persistentContainer.viewContext else { return }
        let hedef = Hedef(context: context)
        
        hedef.hedefAciklama = hedefAciklama
        hedef.hedefTipi = hedefTipi.rawValue
        hedef.hedefTamamlamaSayisi = Int32(hedefSayiField.text!)!
        hedef.hedefGecerliSayi = Int32(0)
        
        do {
            try context.save()
            print("Kayıt başarılı bir şekilde gerçekleşti.")
            completion(true)
        } catch let error {
            debugPrint("Kayıt işlemi başarısız oldu. - \(error.localizedDescription)")
            completion(false)
        }
    }
    
    
    @IBAction func btnBackClicked(_ sender: UIButton) {
        dissmisNew()
    }
}
