/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*
import ohos.distributed_kv_store.Entry

@Entry
@Component
public class SampleTT {
    @State
    var loadingModel: EasyLoadingModel = EasyLoadingModel()

    protected override func aboutToAppear(): Unit {
        this.loadingModel.setIndicatorType(EasyLoadingIndicatorType.CIRCLE)
        this.loadingModel.setCircleModel(CircleModel())
        loadingModel.setVisibility(Visibility.Visible)
    }

    func build() {
        Column {
                Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {
                EasyLoading(model: this.loadingModel)
            }.width(300.0).height(300.0).padding(top: 20.0).backgroundColor(Color.WHITE)
        }
    }
}
