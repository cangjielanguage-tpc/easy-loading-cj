/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry
import ohos.state_macro_manage.*
@Entry
@Component
class  PumpHeartTest {
    @State
    var model: PumpingHeartModel = PumpingHeartModel()
    protected override func aboutToAppear(): Unit {
        this.model
        .setSize(80.0)
        .setDuration(600)

    }
    func build() {
        Column() {
                Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {
                PumpingHeart(model: this.model)
            }
            .width(300.0)
            .height(300.0)
            .padding(top: 70.0)
            .backgroundColor(Color.WHITE)
        }.width(100.percent).height(100.percent).backgroundColor(Color.BLACK)

    }
}