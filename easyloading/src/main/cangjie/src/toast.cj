/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*
import ohos.image.PixelMapFormat
import ohos.image.PixelMap
import ohos.image.createPixelMap

@Observed
public class ToastModel {
    @Publish
    var width: Float64 = 120.0
    @Publish
    var height: Float64 = 120.0
    @Publish
    var icon1: ?CJResource = Option<CJResource>.None
    @Publish
    var icon2: ?String = Option<String>.None
     @Publish
    var icon3: ?PixelMap = Option<PixelMap>.None

    public func setWidth(width: Float64): ToastModel {
        this.width = width
        return this
    }
    public func setHeight(height: Float64): ToastModel {
        this.height = height
        return this
    }

    public func setIcon(icon: CJResource): ToastModel {
        this.icon1 = icon
        return this
    }

    public func setIcon(icon: String): ToastModel {
        this.icon2 = icon
        return this
    }

    public func setIcon(icon: PixelMap): ToastModel {
        this.icon3 = icon
        return this
    }

}


@Component
public class ToastIndicator {
    @State
    var model: ToastModel = ToastModel()

    func build() {
        Column() {
            if(let Some(icon) <- this.model.icon1) {
                Image(icon)
                .width(this.model.width)
                .height(this.model.height)
                .objectFit(ImageFit.Cover)
            }
            if(let Some(icon) <- this.model.icon2) {
                Image(icon)
                .width(this.model.width)
                .height(this.model.height)
                .objectFit(ImageFit.Cover)
            }
            if(let Some(icon) <- this.model.icon3) {
                Image(icon)
                .width(this.model.width)
                .height(this.model.height)
                .objectFit(ImageFit.Cover)
            }
        }.width(100.percent).height(100.percent)
    }
}