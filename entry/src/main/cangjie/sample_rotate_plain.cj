/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleRotatePlain {
    @State
    var model: RotatePlainModel = RotatePlainModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(50.0).setDuration(1200).setColor(Color.WHITE)
    }

    func build() {
        Column {
            Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {

                RotatePlain(model: this.model)
            }.width(300.0).height(300.0).padding(top: 20.0).backgroundColor(Color.RED)
        }
    }
}
