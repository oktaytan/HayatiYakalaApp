//
//  HedefEkleVC.swift
//  HayatiYakala
//
//  Created by Oktay Tanrıkulu on 20.09.2020.
//

import UIKit

class HedefEkleVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var txtHedefAciklama: UITextView!
    
    @IBOutlet weak var btnUzunVadeli: UIButton!
    @IBOutlet weak var btnOrtaVadeli: UIButton!
    @IBOutlet weak var btnKisaVadeli: UIButton!
    @IBOutlet weak var btnIleri: UIButton!
    
    var hedefTipi : HedefTipleri = .UzunVadeli
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtHedefAciklama.delegate = self
        btnIleri.klavyeTasimasi()
        
        btnUzunVadeli.selectedButtonBackgroundColor()
        btnOrtaVadeli.diselectedButtonBackgroundColor()
        btnKisaVadeli.diselectedButtonBackgroundColor()
    }
    
    @IBAction func vadeClicked(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "UZUN VADELİ":
            hedefTipi = .UzunVadeli
            btnUzunVadeli.selectedButtonBackgroundColor()
            btnOrtaVadeli.diselectedButtonBackgroundColor()
            btnKisaVadeli.diselectedButtonBackgroundColor()
        case "ORTA VADELİ":
            hedefTipi = .OrtaVadeli
            btnUzunVadeli.diselectedButtonBackgroundColor()
            btnOrtaVadeli.selectedButtonBackgroundColor()
            btnKisaVadeli.diselectedButtonBackgroundColor()
        case "KISA VADELİ":
            hedefTipi = .KisaVadeli
            btnUzunVadeli.diselectedButtonBackgroundColor()
            btnOrtaVadeli.diselectedButtonBackgroundColor()
            btnKisaVadeli.selectedButtonBackgroundColor()
        default:
            btnUzunVadeli.selectedButtonBackgroundColor()
            btnOrtaVadeli.diselectedButtonBackgroundColor()
            btnKisaVadeli.diselectedButtonBackgroundColor()
        }
    }
    
    @IBAction func ileriClicked(_ sender: UIButton) {
        
        if txtHedefAciklama.text != "" && txtHedefAciklama.text != "Gerçekleştirmek istediğiniz hedefi açıklayabilirsiniz." {
            
            guard let hedefOlusturVC = storyboard?.instantiateViewController(withIdentifier: "HedefOlusturVC") as? HedefOlusturVC else {
                return
            }
            
            hedefOlusturVC.hedefAtama(aciklama: txtHedefAciklama.text, tip: hedefTipi)
            presentingViewController?.presentSecond(hedefOlusturVC)
            
        }
        
    }
    
    @IBAction func geriClicked(_ sender: UIButton) {
        dissmisNew()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        txtHedefAciklama.text = ""
        txtHedefAciklama.textColor = .black
    }
    
    
}
