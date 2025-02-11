/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
class WanderingCubesTestLLT {
    var model: WanderingCubesModel = WanderingCubesModel()
    var model2: WanderingCubesModel = WanderingCubesModel()
    var model3: WanderingCubesModel = WanderingCubesModel()
    protected override func aboutToAppear(): Unit {
        this.model.setSize(50.0).setDuration(400).setColor([Color.WHITE])
        this.model2.setSize(80.0).setDuration(800).setColor([Color.BLACK])
        this.model3.setSize(30.0).setDuration(200).setColor([Color.BLUE, Color.GRAY])
    }
    func build() {
        Column() {
            Stack(Alignment.Center) {
                WanderingCubes(model: this.model)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.BLACK)
            Stack(Alignment.Center) {
                WanderingCubes(model: this.model2)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.BLUE)
            Stack(Alignment.Center) {
                WanderingCubes(model: this.model3)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.GREEN)
        }.width(100.percent).height(100.percent).backgroundColor(Color.BLACK)
    }
}
