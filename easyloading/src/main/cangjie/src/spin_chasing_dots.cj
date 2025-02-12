/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class SpinChasingDotsModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var colors: Array<Color> = [Color.BLACK]
    @Publish
    var shapeStyle: ShapeStyle = ShapeStyle.CIRCLE

    @Publish
    var duration: Int32 = 2000
    public func setSize(size: Float64): SpinChasingDotsModel {
        this.size = size
        return this
    }
    public func setColors(colors: Array<Color>): SpinChasingDotsModel {
        this.colors = colors
        return this
    }

    public func setDuration(duration: Int32): SpinChasingDotsModel {
        this.duration = duration
        return this
    }

    public func setShapeStyle(shapeStyle: ShapeStyle): SpinChasingDotsModel {
        this.shapeStyle = shapeStyle
        return this
    }
}

@Component
public class SpinChasingDots {
    @State
    var model: SpinChasingDotsModel = SpinChasingDotsModel()

    @State
    var size: Float64 = 50.0

    @State
    var rotateValue: Float64 = 0.0

    @State
    var scaleValue: Float64 = 1.0

    var animatorResult1: ?AnimatorResult = None

    var animatorResult2: ?AnimatorResult = None

    protected override func aboutToAppear() {
        size = this.model.size
        animatorResult1 = AnimatorResult(setAnimatorOption1())
        animatorResult1().onframe = {
            value: Float64 => this.rotateValue = value
        }
        animatorResult1().play()

        animatorResult2 = AnimatorResult(setAnimatorOption2())
        animatorResult2().onframe = {
            value: Float64 => this.scaleValue = value
        }
        animatorResult2().play()
    }
    protected override func aboutToDisappear() {
        if (let Some(animator1) <- animatorResult1) {
            animator1.finish()
        }
        if (let Some(animator2) <- animatorResult2) {
            animator2.finish()
        }
    }
    func setAnimatorOption1(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "linear",
            delay: 0,
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.Normal,
            iterations: -1,
            begin: 0.0,
            end: 360.0
        )
        return option
    }
    func setAnimatorOption2(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration / 2,
            easing: "ease-in-out",
            delay: 0,
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.Alternate,
            iterations: -1,
            begin: 1.0,
            end: 0.0
        )
        return option
    }

    func build() {
        Stack(Alignment.TopStart) {
            Stack() {
                if (this.model.shapeStyle == ShapeStyle.RECT) {
                    Column() {
                        Rect(width: this.size * 0.6, height: this.size * 0.6).fill(
                            this.model.colors[0]).scale(Float32(abs(1.0 - this.scaleValue)))
                    }.justifyContent(FlexAlign.Start).width(100.percent).height(100.percent).alignItems(
                        HorizontalAlign.Start)

                    Column() {
                        Rect(width: this.size * 0.6, height: this.size * 0.6).fill(
                            this.model.colors[1 % this.model.colors.size]).scale(Float32(abs(this.scaleValue)))
                    }.justifyContent(FlexAlign.End).width(100.percent).height(100.percent).alignItems(
                        HorizontalAlign.Start)
                } else {
                    Column() {
                        Circle(width: this.size * 0.6, height: this.size * 0.6).fill(
                            this.model.colors[0]).scale(Float32(abs(1.0 - this.scaleValue)))
                    }.justifyContent(FlexAlign.Start).width(100.percent).height(100.percent).alignItems(
                        HorizontalAlign.Start)

                    Column() {
                        Circle(width: this.size * 0.6, height: this.size * 0.6).fill(
                            this.model.colors[1 % this.model.colors.size]).scale(Float32(abs(this.scaleValue)))
                    }.justifyContent(FlexAlign.End).width(100.percent).height(100.percent).alignItems(
                        HorizontalAlign.Start)
                }
            }.rotate(x: 0.0, y: 0.0, z: 1.0, centerX: (this.size / 2.0).vp, centerY: (this.size / 2.0).vp,
                angle: Float32(this.rotateValue))
        }.width(this.size).height(this.size)
    }
}
