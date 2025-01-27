/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class ThreeBounceModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var colors: Array<Color> = [Color.BLACK]
    @Publish
    var shapeStyle: ShapeStyle = ShapeStyle.RECT

    @Publish
    var duration: Int32 = 700
    public func setSize(size: Float64): ThreeBounceModel {
        this.size = size
        return this
    }
    public func setColors(colors: Array<Color>): ThreeBounceModel {
        this.colors = colors
        return this
    }

    public func setDuration(duration: Int32): ThreeBounceModel {
        this.duration = duration
        return this
    }
    public func setShapeStyle(shapeStyle: ShapeStyle): ThreeBounceModel {
        this.shapeStyle = shapeStyle
        return this
    }
}

@Component
public class ThreeBounce {
    @State
    var model: ThreeBounceModel = ThreeBounceModel()

    @State
    var scaleValueArr: ObservedArrayList<Float64> = ObservedArrayList<Float64>(0.0, 0.0, 0.0)

    var animatorResult: ?AnimatorResult = None

    protected override func aboutToAppear() {
        for (index in 0..3) {
            animatorResult = AnimatorResult(setAnimatorOption(Int32(index)))
            animatorResult().onframe = {
                value: Float64 => this.scaleValueArr[index] = value
            }
            animatorResult().play()
        }
    }
    protected override func aboutToDisappear() {
        if (let Some(animator) <- animatorResult) {
            animator.finish()
        }
    }
    func setAnimatorOption(idx: Int32): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "ease-in-out",
            delay: idx * 200,
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.Alternate,
            iterations: -1,
            begin: 0.0,
            end: 1.0
        )
        return option
    }
    func build() {
        Row() {
            ForEach(
                Array<Int64>(3, {i => i + 1}),
                itemGeneratorFunc: {
                    _: Int64, idx: Int64 => if (this.model.shapeStyle == ShapeStyle.RECT) {
                        Rect(width: this.model.size * 0.5, height: this.model.size * 0.5).fill(
                            this.model.colors[idx % this.model.colors.size]).scale(Float32(this.scaleValueArr[idx]))
                    } else {
                        Circle(width: this.model.size * 0.5, height: this.model.size * 0.5).fill(
                            this.model.colors[idx % this.model.colors.size]).scale(Float32(this.scaleValueArr[idx]))
                    }
                }
            )
        }.width(this.model.size * 2.0).height(this.model.size).align(Alignment.Center).justifyContent(
            FlexAlign.SpaceEvenly)
    }
}
