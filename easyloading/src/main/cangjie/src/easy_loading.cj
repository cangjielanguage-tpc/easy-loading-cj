/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.concurrency.*
import ohos.hilog.*

@Component
public class EasyLoading {
    @State
    var model: EasyLoadingModel = EasyLoadingModel()

    protected override func aboutToAppear(): Unit {

    }

    func build() {
        Stack(this.model.alignment) {
            //--------mask--------
            if(this.model.isMask) {
                Stack() {}
                .width(100.percent)
                .height(100.percent)
                .backgroundColor(this.model.maskBgColor)
                .opacity(if(this.model.isMaskDisplayAnimator) {
                     this.model.maskOpacityFrom
                }else {
                    this.model.maskOpacityNormal
                })
            }
            if(this.model.getIndicatorType().isSome()) {
                Stack(Alignment.Center) {
                if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.FADINGGRID && this.model.getIndicatorModel().isSome()) {
                    SpinKitFadingGrid(model: this.model.getIndicatorModel()())
                } else if(this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.TOAST && this.model.getToastModel().isSome()) {
                    ToastIndicator(model: this.model.getToastModel()())
                }

                Text(this.model.text)
                .fontColor(this.model.fontColor)
                .fontSize(this.model.fontSize)
                .margin(top: if(this.model.getIndicatorType()() == EasyLoadingIndicatorType.TOAST && this.model.getToastModel().isNone()) {
                    0.0
                } else {
                    this.model.textMarginTop
                })
                .fontWeight(this.model.fontWeight)
            }
                .width(this.model.width)
                .height(this.model.height)
                .backgroundColor(this.model.background)
                .align(Alignment.Center)
                .borderRadius(this.model.borderRadius)
                .padding(top:if(this.model.getIndicatorType()() == EasyLoadingIndicatorType.TOAST && this.model.getToastModel().isNone()) {
                    0.0
                }else {
                    this.model.paddingTop
                })
                .scale(if(this.model.isScale) {
                    this.model.scaleFrom
                } else {
                    1.0
                })
                .rotate(if(this.model.isRotate) {
                    this.model.rotateFrom
                }else {
                    0.0
                })
                .translate(x: this.model.offsetXFrom, y: this.model.offsetYFrom)
                .opacity(if(this.model.isOpacity) {
                     this.model.opacityFrom
                } else {
                     1.0
                })
            }



        }.width(100.percent).height(100.percent)
        .visibility(this.model.visibility)

        //todo
        .onClick ({ event => this.model.hide()})

    }
}
