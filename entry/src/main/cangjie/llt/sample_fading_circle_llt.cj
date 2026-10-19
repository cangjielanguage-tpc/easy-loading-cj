/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleFadingCircleLLT {
    @State
    var model: FadingCircleModel = FadingCircleModel()
    var model2: FadingCircleModel = FadingCircleModel()
    var model3: FadingCircleModel = FadingCircleModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(80.0).setDuration(600).setColors([Color.WHITE])
        this.model2.setSize(50.0).setDuration(300).setColors([Color.WHITE, Color.RED, Color.GRAY])
        this.model3.setSize(100.0).setDuration(1000).setColors([Color.WHITE, Color.RED])
    }

    func build() {
        Column {
                            Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {
                FadingCircle(model: this.model)
            }.width(100.0).height(100.0).backgroundColor(Color.GRAY)
            Stack(Alignment.Center) {
                FadingCircle(model: this.model2)
            }.width(100.0).height(100.0).backgroundColor(Color.GREEN)
            Stack(Alignment.Center) {
                FadingCircle(model: this.model3)
            }.width(100.0).height(100.0).backgroundColor(Color.GRAY)
        }
    }
}
