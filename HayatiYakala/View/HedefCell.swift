//
//  HedefCell.swift
//  HayatiYakala
//
//  Created by Oktay Tanrıkulu on 20.09.2020.
//

import UIKit

class HedefCell: UITableViewCell {

    @IBOutlet weak var lblHedefAciklama: UILabel!
    @IBOutlet weak var lblHedefTipi: UILabel!
    @IBOutlet weak var lblHedefSayisi: UILabel!
    @IBOutlet weak var tamamlamaView: UIView!
    
    func gorunumAyarla(hedef: Hedef) {
        self.lblHedefAciklama.text = hedef.hedefAciklama
        self.lblHedefTipi.text = hedef.hedefTipi
        self.lblHedefSayisi.text = String(hedef.hedefGecerliSayi)
        
        if hedef.hedefGecerliSayi == hedef.hedefTamamlamaSayisi {
            tamamlamaView.isHidden = false
        } else {
            tamamlamaView.isHidden = true
        }
    }
}
