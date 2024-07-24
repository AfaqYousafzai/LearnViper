//
//  AppDIContainer.swift
//  LearnViper
//
//  Created by Afaq Ahmad on 22/07/2024.
//

import Foundation

protocol AppDIContainer {
    func makeHomeDIContainer() -> HomeDIContainer
    func makeDetailDIContainer() -> DetailDIContainer
}

class AppDIContainerImpl: AppDIContainer {
    func makeHomeDIContainer() -> HomeDIContainer {
        return HomeDIContainerImpl(appDIContainer: self)
    }
    
    func makeDetailDIContainer() -> DetailDIContainer {
        return DetailDIContainerImpl(appDIContainer: self)
    }
}
