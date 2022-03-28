//
//  TabBarController.swift
//  Navigation
//
//  Created by  Юлия Григорьева on 19.02.2022.
//

import UIKit

class TabBarController:  UITabBarController {
    private enum TabBarItem {
        case feed
        case profile
        case gestures

        var title: String {
            switch self {
            case .feed:
                return "Лента"
            case .profile:
                return "Профиль"
            case .gestures:
                return "Жесты"
            }
        }

        var image: UIImage? {
            switch self {
            case .feed:
                return UIImage(systemName: "house.circle")
            case .profile:
                return UIImage(systemName: "person.circle")
            case .gestures:
                return UIImage(systemName: "hand.raised.circle")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
    }

    func setupTabBar() {
        let items: [TabBarItem] = [.feed, .profile, .gestures]
        self.viewControllers = items.map({ tabBarItem in
            switch tabBarItem {
            case .feed:
                return UINavigationController(rootViewController: FeedViewController())
            case .profile:
                return UINavigationController(rootViewController: LogInViewController())
            case .gestures:
                return UINavigationController(rootViewController: GesturesViewController())
            }
        })

        self.viewControllers?.enumerated().forEach({ (index, vc) in
            vc.tabBarItem.title = items[index].title
            vc.tabBarItem.image = items[index].image
        })
    }
}
