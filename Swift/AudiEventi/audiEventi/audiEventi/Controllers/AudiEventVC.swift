//
//  AudiEventiVC.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 6.7.21..
//

import UIKit

class AudiEventVC: UIViewController{
    
    var isUserAuthenticated: Bool = true
    var hasNotification: Bool = true
    
    var experienceOrTerritoryToShow: Int?
    
    func prepareNavigationBar(){
        navigationController?.navigationBar.isHidden = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "...", style: .done, target: self, action: #selector(self.showBurgerVC))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem?.image = UIImage(named: "menu")
        
        navigationItem.rightBarButtonItem = notificationBar()
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "audi_logo")
        navigationItem.titleView = imageView
    }
    
    func notificationBar() -> UIBarButtonItem?{
        if isUserAuthenticated{
            let notification = hasNotification ? "notification_badge" : "notification_no_badge"
            let rightButton = UIButton(type: .custom)
            rightButton.setImage(UIImage(named: notification), for: .normal)
            rightButton.frame = CGRect(x: 20, y: 0, width: 10, height: 10)
            rightButton.addTarget(self, action: #selector(showNotificationVC), for: .touchUpInside)
            
            let menuBarItem = UIBarButtonItem(customView: rightButton)
            menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 20).isActive = true
            menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 20).isActive = true
            return menuBarItem
        }
       return nil
    }
    
    @objc func showNotificationVC(){
        showViewController(identifier: ConfigData.notificationViewController, driveTeritory: 0)
    }
        
    @objc func showBurgerVC(sender: UIBarItem){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: ConfigData.burgerViewController)
        presentDetail(vc)
    }
    
    func presentDetail(_ vc: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.5
        view.window?.layer.add(transition, forKey: kCATransition)
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: false, completion: nil)
    }
    
    func activateGestureDissmisForBurgerVC(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(BurgerVC.tappedOnScreen(_:)))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func tappedOnScreen(_ sender: UIGestureRecognizer) {
        let tapped = sender.location(in: view)
        let screenWidth = UIScreen.main.bounds.width
        if  tapped.x > screenWidth - 80 && tapped.y > 0 {
            dismissBurgerVC()
        }
    }
    
    func dismissBurgerVC(){
        let transition = CATransition()
        transition.duration = 0.5
        view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
    
    @objc func showAlertForCoupon() {
        let alert = UIAlertController(title: "", message: "Inserisci qui sotto il tuo Coupon Evento Audi e premi il pulsante procedi per accedere a tutti i contenuti relativi all'evento a cui sei iscritto. ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Conferma", style: .cancel))
        alert.addTextField { (textField) in
            textField.placeholder = "AUDI2345678"
        }
        self.present(alert, animated: true)
    }
    
    @objc func showViewController(identifier: String, driveTeritory: Int) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc: AudiEventVC
        
        if driveTeritory > 0{
            vc = storyBoard.instantiateViewController(withIdentifier: identifier) as! DriveExperienceTerritoryVC
            vc.experienceOrTerritoryToShow = driveTeritory
        }else{
            vc = storyBoard.instantiateViewController(withIdentifier: identifier) as! AudiEventVC
        }
            
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        
        self.present(nc, animated:false)
    }
    
}

