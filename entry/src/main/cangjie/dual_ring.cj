/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry

import ohos.state_macro_manage.*

@Entry
@Component
class DualRingTest {
    @State
    var model: DualRingModel = DualRingModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(100.0).setColor(Color.BLUE).setBorderWidth(10.0).setAngle(120.0)
    }

    func build() {
        Column() {
                Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {
                DualRing(model: this.model)
            }
            .width(300.0)
            .height(300.0)
            .padding(top: 30.0)
            .backgroundColor(Color.GRAY)
        }.width(100.percent).height(100.percent).backgroundColor(Color.BLACK)

    }
}