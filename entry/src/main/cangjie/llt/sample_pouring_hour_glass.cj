/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SamplePouringHourGlass {
    @State
    var model: PouringHourGlassModel = PouringHourGlassModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(60.0).setDuration(1200).setColor(Color.RED)
    }

    func build() {
        Column {
                Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {
                PouringHourGlass(model: this.model)
            }.width(300.0).height(300.0).padding(top: 20.0).backgroundColor(Color.GRAY)
        }
    }
}
