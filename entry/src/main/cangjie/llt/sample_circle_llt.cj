/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleCircleLLT {
    @State
    var model: CircleModel = CircleModel()
    var model2: CircleModel = CircleModel()
    var model3: CircleModel = CircleModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(50.0).setDuration(600).setColors([Color.RED])
        this.model2.setSize(100.0).setDuration(1000).setColors([Color.RED, Color.GREEN])
        this.model3.setSize(30.0).setDuration(400).setColors([Color.RED, Color.GREEN, Color.BLACK])
    }

    func build() {
        Column {
                                        Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {
                CircleComponent(model: this.model)
            }.width(100.0).height(100.0).backgroundColor(Color.GRAY)
            Stack(Alignment.Center) {
                CircleComponent(model: this.model2)
            }.width(100.0).height(100.0).backgroundColor(Color.BLACK)
            Stack(Alignment.Center) {
                CircleComponent(model: this.model3)
            }.width(100.0).height(100.0).backgroundColor(Color.WHITE)
        }
    }
}
