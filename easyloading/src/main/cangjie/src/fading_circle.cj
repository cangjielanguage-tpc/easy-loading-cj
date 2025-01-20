/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class FadingCircleModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var colors: Array<Color> = [Color.BLACK]

    @Publish
    var duration: Int32 = 1200
    public func setSize(size: Float64): FadingCircleModel {
        this.size = size
        return this
    }
    public func setColors(colors: Array<Color>): FadingCircleModel {
        this.colors = colors
        return this
    }
    public func setDuration(duration: Int32): FadingCircleModel {
        this.duration = duration
        return this
    }
}

@Component
public class FadingCircle {
    @State
    var model: FadingCircleModel = FadingCircleModel()
    let delays: Array<Float64> = [0.0, -1.1, -1.0, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1]

    var shapeType: ShowShapeType = ShowShapeType.Circle
    @State
    var fadeValueArr: ObservedArrayList<Float64> = ObservedArrayList<Float64>(1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
        1.0, 1.0, 1.0, 1.0)

    var animatorResult: ?AnimatorResult = None

    protected override func aboutToAppear(): Unit {
        for (index in 0..12) {
            animatorResult = AnimatorResult(setAnimatorOption(Int32(index)))
            animatorResult().onframe = {
                value: Float64 => this.fadeValueArr[index] = value
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
            easing: "linear",
            delay: 100 * idx,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: -1,
            begin: 0.0,
            end: 1.0
        )
        return option
    }

    func build() {
            Stack(Alignment.Center) {
                ForEach(
                    Array<Int64>(12, {i => i + 1}),
                    itemGeneratorFunc: {
                        _: Int64, idx: Int64 => if (shapeType == ShowShapeType.Rect) {
                            Rect(width: this.model.size * 0.2, height: this.model.size * 0.2).fill(
                                this.model.colors[idx % this.model.colors.size]).rotate(x: 0.0, y: 0.0, z: 1.0,
                                centerX: (this.model.size / 2.0).vp, centerY: (this.model.size / 2.0).vp, angle: Float32(idx * 30)).
                                opacity(this.fadeValueArr[idx])
                        } else {
                            Circle(width: this.model.size * 0.2, height: this.model.size * 0.2).fill(
                                this.model.colors[idx % this.model.colors.size]).rotate(x: 0.0, y: 0.0, z: 1.0,
                                centerX: (this.model.size / 2.0).vp, centerY: (this.model.size / 2.0).vp, angle: Float32(idx * 30)).
                                opacity(this.fadeValueArr[idx])
                        }
                    }
                )
            }.align(Alignment.Center)
//        .width(this.size).height(this.size)

    }
}
