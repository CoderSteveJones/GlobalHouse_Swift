//
//  ProtocolTestViewController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/17.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

struct Point {
    var x: Int
    var y: Int
}

extension Point: CustomStringConvertible {
    var description: String {
        return "x == \(self.x),y == \(self.y)"
    }
}


class ProtocolTestViewController: BaseViewController,MyTestProtocol {
    
    var name: String = ""
    
    func getName() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let p = Point(x: 10, y: 20)
        
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
