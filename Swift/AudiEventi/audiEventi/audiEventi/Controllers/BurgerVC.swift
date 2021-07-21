//
//  BurgerVC.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 1.7.21..
//

import UIKit

class BurgerVC: AudiEventVC, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        activateGestureDissmisForBurgerVC()
        menuTableView.tableFooterView = UIView()
        
    }

    // MARK: When BurgerVC is active, status bar is hidden
    override var prefersStatusBarHidden: Bool {
        return true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if let numberOfElements = FetchedData.sideElementsPremium?.count{
                return numberOfElements
            }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: ConfigData.burgerMenuCell, for: indexPath) as! BurgerTableViewCell
        
        var menuValue: [String]?
        
        if self.isUserAuthenticated{
            if let values = FetchedData.sideElementsPremium?[indexPath.row]{
                menuValue = values
            }
        }else{
                if indexPath.row < 9 && indexPath.row > 2{
                    cell.separatorInset = UIEdgeInsets(top: 0.0, left: cell.bounds.size.width, bottom: 0.0, right: 0.0);
                    return cell
                }else {
                    if indexPath.row == 9{
                        menuValue = FetchedData.sideElementsGuest?[3]
                    }else{
                        menuValue = FetchedData.sideElementsGuest?[indexPath.row]
                    }
                }
        }

        if let menuValue = menuValue{
            
            cell.buttonBurgerMenu.buttonKey = menuValue[0]
            cell.buttonBurgerMenu.setTitle(menuValue[1], for: .normal)
            cell.buttonBurgerMenu.setImage(UIImage(named: menuValue[0]), for: .normal)
            cell.buttonBurgerMenu.tintColor = .black
            cell.buttonBurgerMenu.setTitleColor(UIColor.black, for: .normal)
            cell.buttonBurgerMenu.addTarget(self, action: #selector(namedActionToShow), for: .touchUpInside)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(40)
    }
    

}
