/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*

@Entry
@Component
class WanderingCubesTest {
    @State
    var model: WanderingCubesModel = WanderingCubesModel()
    protected override func aboutToAppear(): Unit {
    }
    func build() {
        Column() {
            Stack(Alignment.Center) {
                WanderingCubes(model: this.model)
            }.width(300.0).height(300.0).padding(top: 20.0).backgroundColor(Color.WHITE)
        }.width(100.percent).height(100.percent).backgroundColor(Color.BLACK)
    }
}
