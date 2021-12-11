//
//  LottieViewController.swift
//  PracticeLibraries
//
//  Created by 戸田　龍馬 on 2021/12/06.
//
// エラーの原因となっていたコード
           

import UIKit
import Lottie
import SnapKit

final class LottieViewController: UIViewController {
    
    
    // 🥦これはなぜfalseにする必要があるのか
    private var isPlaying: Bool = false
    // ハードコーディング対策
    private let jsonAnimation = "75779-check"
    // よくわからんBoolの値をfalseに変更する。
    
    
    var animationView = AnimationView()
    
    // IBOutletでStoryboard上のViewとファイルを接続する
    @IBOutlet weak var animationContainerView: UIView! {
        didSet {
            guard let animation = Animation.named(jsonAnimation, subdirectory: nil) else {
                print("\(#line) file not found")
                return
            }
            animationContainerView.addSubview(animationView)
            //アニメーションの位置指定（画面中央）
            animationView.snp.makeConstraints { $0.edges.equalToSuperview() }
            animationView.contentMode = .scaleAspectFit
            animationView.animation = animation
        }
    }
    
    
    var animationView2 = AnimationView()
    @IBOutlet weak var animationContainerView2: UIView! {
        didSet {
            guard let animation2 = Animation.named(jsonAnimation, subdirectory: nil) else {
                print("\(#line) file not found")
                return
            }
            animationContainerView2.addSubview(animationView2)
            //アニメーションの位置指定（画面中央）
            animationView2.snp.makeConstraints { $0.edges.equalToSuperview() }
            animationView2.contentMode = .scaleAspectFit
            animationView2.animation = animation2
        }
    }
    
    
    @IBOutlet weak var startAnimationButton: UIButton! {
        didSet {
            // なんでselfじゃダメなんだろう。
            startAnimationButton.addTarget(self, action: #selector(tapAnimation(_:)), for: .touchUpInside)
        }
    }
}
    
extension LottieViewController {
@objc func tapAnimation(_ sender: UIButton) {
    isPlaying.toggle()
    let animationViews = [animationView,animationView2]
    animationViews.forEach {
        if isPlaying {
            print("playing")
            $0.animationSpeed = 0.5
            $0.play(fromProgress: 0, toProgress: 1, loopMode: .loop)
        } else {
            print("stop")
            $0.stop()
        }
    }
}
}
