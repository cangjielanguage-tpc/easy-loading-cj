/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
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
            if (this.model.isMask) {
                Stack() {}.width(100.percent).height(100.percent).backgroundColor(this.model.maskBgColor).opacity(
                    if (this.model.isMaskDisplayAnimator) {
                    this.model.maskOpacityFrom
                } else {
                    this.model.maskOpacityNormal
                })
            }
            if (this.model.getIndicatorType().isSome()) {
                Stack(Alignment.Center) {
                    if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.FADINGGRID &&
                        this.model.getFadingGridModel().isSome()) {
                        FadingGrid(model: this.model.getFadingGridModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.CUBEGRID &&
                        this.model.getCubeGridModel().isSome()) {
                        CubeGrid(model: this.model.getCubeGridModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.CIRCLE &&
                        this.model.getCircleModel().isSome()) {
                        CircleComponent(model: this.model.getCircleModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.DOUBLEBOUNCE &&
                        this.model.getDoubleBounceModel().isSome()) {
                        DoubleBounce(model: this.model.getDoubleBounceModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.FADINGCIRCLE &&
                        this.model.getFadingCircleModel().isSome()) {
                        FadingCircle(model: this.model.getFadingCircleModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.FADINGCUBE &&
                        this.model.getFadingCubeModel().isSome()) {
                        FadingCube(model: this.model.getFadingCubeModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.FADINGFOUR &&
                        this.model.getFadingFourModel().isSome()) {
                        FadingFour(model: this.model.getFadingFourModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.FOLDINGCUBE &&
                        this.model.getFoldingCubeModel().isSome()) {
                        FoldingCube(model: this.model.getFoldingCubeModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.HOURGLASS &&
                        this.model.getHourGlassModel().isSome()) {
                        HourGlass(model: this.model.getHourGlassModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.POURINGGHOURGLASS &&
                        this.model.getPouringHourGlassModel().isSome()) {
                        PouringHourGlass(model: this.model.getPouringHourGlassModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.PULSE &&
                        this.model.getPulseModel().isSome()) {
                        Pulse(model: this.model.getPulseModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.RING &&
                        this.model.getRingModel().isSome()) {
                        Ring(model: this.model.getRingModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.ROTATINGCIRCLE &&
                        this.model.getRotateCircleModel().isSome()) {
                        RotateCircle(model: this.model.getRotateCircleModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.ROTATINNGPLAIN &&
                        this.model.getRotatePlainModel().isSome()) {
                        RotatePlain(model: this.model.getRotatePlainModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.CHASINGGDOTS &&
                        this.model.getSpinChasingDotsModel().isSome()) {
                        SpinChasingDots(model: this.model.getSpinChasingDotsModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.SPINNINGCIRCLE &&
                        this.model.getSpinningCircleModel().isSome()) {
                        SpinningCircle(model: this.model.getSpinningCircleModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.SQUARECIRCLE &&
                        this.model.getSquareCircleModel().isSome()) {
                        SquareCircle(model: this.model.getSquareCircleModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.THREEBOUNCE &&
                        this.model.getThreeBounceModel().isSome()) {
                        ThreeBounce(model: this.model.getThreeBounceModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.WANDERINGCUBES &&
                        this.model.getWanderingCubesModel().isSome()) {
                        WanderingCubes(model: this.model.getWanderingCubesModel()())
                    } else if (this.model.getIndicatorType().getOrThrow() == EasyLoadingIndicatorType.TOAST &&
                        this.model.getToastModel().isSome()) {
                        ToastIndicator(model: this.model.getToastModel()())
                    }

                    Text(this.model.text).fontColor(this.model.fontColor).fontSize(this.model.fontSize).margin(
                        top: if (this.model.getIndicatorType()() == EasyLoadingIndicatorType.TOAST &&
                        this.model.getToastModel().isNone()) {
                        0.0
                    } else {
                        this.model.textMarginTop
                    }).fontWeight(this.model.fontWeight)
                }.width(this.model.width).height(this.model.height).backgroundColor(this.model.background).align(
                    Alignment.Center).borderRadius(this.model.borderRadius).padding(
                    top: if (this.model.getIndicatorType()() == EasyLoadingIndicatorType.TOAST &&
                    this.model.getToastModel().isNone()) {
                    0.0
                } else {
                    this.model.paddingTop
                }).scale(if (this.model.isScale) {
                    this.model.scaleFrom
                } else {
                    1.0
                }).rotate(if (this.model.isRotate) {
                    this.model.rotateFrom
                } else {
                    0.0
                }).translate(x: this.model.offsetXFrom, y: this.model.offsetYFrom).opacity(
                    if (this.model.isOpacity) {
                    this.model.opacityFrom
                } else {
                    1.0
                })
            }
        }.width(100.percent).height(100.percent).visibility(this.model.visibility).onClick(
            {
            event => if (this.model.isClickAnyHide) {
                this.model.hide()
            }
        })
    }
}
