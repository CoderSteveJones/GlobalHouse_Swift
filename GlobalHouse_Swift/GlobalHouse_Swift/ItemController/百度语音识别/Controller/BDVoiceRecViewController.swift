//
//  BDVoiceRecViewController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/17.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class BDVoiceRecViewController: BaseViewController,BDSClientASRDelegate {

    fileprivate var asrEventManager: BDSEventManager?
    fileprivate var touchUpFlag: Bool?
    
    @IBOutlet weak fileprivate var contentTxf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupVoiceRec()
    }

   
    @IBAction func testClick(_ sender: Any) {
        
    }
    
    
    
    fileprivate func setupVoiceRec() {
        
        asrEventManager = BDSEventManager.createEventManager(withName: BDS_ASR_NAME)
        asrEventManager?.setDelegate(self)
        //配置API_KEY 和 SECRET_KEY 和 APP_ID
        asrEventManager?.setParameter([BDVoiceApiKey,BDVoiceSecretKey], forKey: BDS_ASR_API_SECRET_KEYS)
        asrEventManager?.setParameter(BDVoiceAppID, forKey: BDS_ASR_OFFLINE_APP_CODE)
         //配置端点检测
        let modelVAD_filepath = Bundle.main.path(forResource: "bds_easr_basic_model", ofType: "dat")
        asrEventManager?.setParameter(modelVAD_filepath, forKey: BDS_ASR_MODEL_VAD_DAT_FILE)
        asrEventManager?.setParameter(true, forKey: BDS_ASR_ENABLE_MODEL_VAD)
    }
    
    @IBAction func voiceTouchUpClick(_ sender: Any) {
        
        SVProgressHUD.doAnything(withHUDMessage: "聆听中")
        asrEventManager?.sendCommand(BDS_ASR_CMD_START)
    }
    
    func voiceRecognitionClientWorkStatus(_ workStatus: Int32, obj aObj: Any!) {
        
        switch TBDVoiceRecognitionClientWorkStatus.init(UInt32(workStatus)) {
        
        case EVoiceRecognitionClientWorkStatusStartWorkIng:
            print("识别工作开始，开始采集及处理数据")
        case EVoiceRecognitionClientWorkStatusStart:
            print("检测到用户开始说话")
        case EVoiceRecognitionClientWorkStatusEnd:
            print("本地声音采集结束，等待识别结果返回并结束录音")
            
        case EVoiceRecognitionClientWorkStatusFinish:
            
            SVProgressHUD.dismiss()
            if let getObj = aObj {
                let result = getObj as! [String: Any]
                let results = result["results_recognition"] as! [String]
                
                debugPrint(result)
                contentTxf.text = results[0]
            }
            
        default:
            break
        }
    }
    
    
    
}



