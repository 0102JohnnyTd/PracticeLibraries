//
//  KingfisherViewController.swift
//  PracticeLibraries
//
//  Created by 戸田　龍馬 on 2021/12/01.
//

import UIKit
import Kingfisher

// 他のファイルで継承させないように修飾子finalを設定
final class KingfisherViewController: UIViewController {
    // IBOutletでStoryboard上のオブジェクトImageViewをSwiftファイルに接続する
    @IBOutlet weak var imageView1: UIImageView! {
        didSet {
            imageView1.image = defImage
        }
    }
    
    @IBOutlet weak var imageView2: UIImageView! {
        didSet {
            imageView2.image = defImage
        }
    }
    
    @IBOutlet weak var imageView3: UIImageView! {
        didSet {
            imageView3.image = defImage
        }
    }
    
    @IBOutlet weak var imageVIew4: UIImageView! {
        didSet {
            imageVIew4.image = defImage
        }
    }
    
    @IBOutlet weak var imageView5: UIImageView! {
        didSet {
            imageView5.image = defImage
        }
    }
    
    @IBOutlet weak var imageView6: UIImageView! {
        didSet {
            imageView6.image = defImage
        }
    }
    
    // DefImageの名前がついたUIImageクラスを定数defImageに渡す
    private let defImage = UIImage(named: " DefImage")
    
    
    // ⚠️※画像はpushする前に著作権的にOKなやつに変更する
    // 画像urlじゃないとだめっぽいっすね.
    private let urls = [
        URL(string: "https://tirimenj5.com/wp-content/uploads/2017/10/8707670598_cdcfde7569_z.jpg"),
        URL(string: "https://i2.wp.com/c7.staticflickr.com/8/7289/12104271926_d9fc61d4a9.jpg?resize=500%2C331&ssl=1"),
        URL(string: "https://global.canon/ja/environment/bird-branch/photo-gallery/kawasemi/img/gallery-kawasemi-thumb.jpg"),
        URL(string: "https://p.potaufeu.asahi.com/a9d2-p/picture/25828275/35079a96516800b23a861d88a2f21a7e.jpg"),
        URL(string: "https://online-hoshujuku.info/wp-content/uploads/2019/10/%E9%B3%A5_1572327608.jpg"),
        URL(string: "https://dvrs04bx77b2x.cloudfront.net/animaroll/item/image/normal/e1db0201-b309-4171-928e-1ae84a600621.jpeg")
    ]
    
    // IBOutletで接続したimageViewの配列を変数imageViewsに渡す
    // 🥦なぜここをlazyプロパティにしたんだろうか。
    private lazy var imageViews = [imageView1,imageView2,imageView3,imageVIew4,imageView5,imageView6]
    
    // IBOutletでStoryboard上のオブジェクトUIButtonをSwiftファイルに接続する
    @IBOutlet weak var loadButton: UIButton! {
        didSet {
            loadButton.addTarget(self, action: #selector(tapLoadButton(_:)), for: .touchUpInside)
        }
    }
    
    // IBActionの場合も書いとく？練習がてら。いや、いろんな画面遷移っていうPracticeProjectでも作ろう
    
    // addTargetno#selectorに指定したtapLoadButtonメソッド
    @objc func tapLoadButton(_ sender:UIButton) {
        // ここから下2行まあぁじで意味わからん。
        // .enumerated()で要素とインデックスのタプルを返し
        //  .mapで配列urls、配列imageViewsの全ての要素にアクセスし
        // .forEach{ }で--　の処理を繰り返すと。
        urls.enumerated().map{( $0.element,imageViews[$0.offset])}.forEach {
            guard let url = $0.0, let imageView = $0.1 else { return }
            // urls,imageViewがnilでなかった場合に実行される処理
            // サーバーから画像の読み込み中にindicatorを表示させる
            imageView.kf.indicatorType = .activity
            // URLから画像を引用して表示させる
            imageView.kf.setImage(
                with: url,
                // サーバーから読み込む前の表示画面
                placeholder: defImage
            )
        }
    }
}


//.enumerated().map { ($0.element, imageViews[$0.offset])}
