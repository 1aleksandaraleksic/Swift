//
//  WorkExpirienceCV.swift
//  AboutMe
//
//  Created by aleksandar.aleksic on 5/25/21.
//

import UIKit

class WorkExpirienceCV: UIViewController, UITableViewDataSource {

    let workExpirience = [
        ["Aurelio","03.2012 - 10.2019", "Menader/Sef Restorana \nneke od dnevih obaveza bile su: kreiranje rasporeda, organizacija posla, porucivanje robe, odrzavanje medju ljudskih odnosa medju zaposlenima, odrzavanje programa i baze za ceo restoran, deo racunovodstva.."],["GOTO Taxi", "05.2017 - 09.2017", "Junior Android Developer Intership \nza ovo kratko vreme imao sam prilike da radim na jednoj maloj aplikaciji koja je sastavi deo celokupnog sistema jednog udruzenja od dispecerskog centra pa do porucivanja vozila i naplate."], ["Engineering Software Lab d.o.o.", "01.2021 - present", "Junior Solution Developer \nprva 3 meseca u kompaniji proveo sam na obuci i usavrsavanju Java programskog jezika u framework-cima Spring, Spring Boot, Hibernate. Takodje naucio sam Vue JS framework. Samostalno uspesno realizovao 1 projekat koji je predstavljao/simulirao rad operative jednog fakulteta. Poslednjih mesec dana poceo sa novom obukom za iOS Development u SWIFT programskom jeziku"]
    ]
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workExpirience.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyCell
        
        cell?.companyName.text = workExpirience[indexPath.row][0]
        cell?.dateStartEnd.text = workExpirience[indexPath.row][1]
        cell?.Description.text = workExpirience[indexPath.row][2]
        
        return cell!
    }
    
    

}
