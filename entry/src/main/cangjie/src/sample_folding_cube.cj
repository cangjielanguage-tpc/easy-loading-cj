/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleFoldingCube {
    func build() {
        Stack(Alignment.Center) {
            FoldingCubeComponent(
                width: 300.0,
                height: 300.0,
                colors: [Color.RED, Color.GREEN],
                duration: 1200
            )
        }
    }
}
