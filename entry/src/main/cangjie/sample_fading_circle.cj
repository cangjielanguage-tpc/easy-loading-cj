/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleFadingCircle {
    @State
    var model: FadingCircleModel = FadingCircleModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(80.0).setDuration(600).setColors([Color.WHITE])
    }

    func build() {
        Column {
            Stack(Alignment.Center) {
                FadingCircle(model: this.model)
            }.width(300.0).height(300.0).backgroundColor(Color.GRAY)
        }
    }
}
