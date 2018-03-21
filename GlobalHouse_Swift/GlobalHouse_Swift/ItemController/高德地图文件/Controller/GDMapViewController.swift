//
//  GDMapViewController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/21.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class GDMapViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "定位"
    }

    @IBAction func locationAction(_ sender: UIButton) {
        
        switch sender.tag {
        case 10:
            let vc = SingleLocationViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 11:
            let vc = SerialLocationViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 12:
            let vc = BackgroundLocationController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
