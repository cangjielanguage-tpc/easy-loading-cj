/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class CircleModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var colors: Array<Color> = [Color.RED]

    @Publish
    var duration: Int32 = 600

    public func setSize(size: Float64): CircleModel {
        this.size = size
        return this
    }

    public func setColors(colors: Array<Color>): CircleModel {
        if (colors.size > 0) {
            this.colors = colors
        }

        return this
    }
    public func setDuration(duration: Int32): CircleModel {
        this.duration = duration
        return this
    }
}

@Component
public class CircleComponent {
    @State
    var model: CircleModel = CircleModel()

    let radian = 30.0 * Float64.getPI() / 180.0

    @State
    var fadeValueArr: ObservedArrayList<Float64> = ObservedArrayList<Float64>(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
        0.0, 0.0, 0.0, 0.0)

    public func setAnimator(delay: Int64): Unit {
        animateTo(
            AnimateParam(
                duration: this.model.duration,
                delay: this.model.duration / 6 * Int32(delay),
                curve: Curve.EaseInOut,
                iterations: -1,
                playMode: PlayMode.Alternate,
                onFinish: {=>}
            ),
            {
                => this.fadeValueArr[delay] = 1.0
            }
        )
    }
    func build() {
        Stack(Alignment.TopStart) {
            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[0]).position(x: this.model.size * 0.425, y: 0.0).scale(
                Float32(this.fadeValueArr[0]))

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[1 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(
                x: this.model.size * 0.2125,
                y: -this.model.size * 0.425 * cos(radian)
            ).scale(Float32(this.fadeValueArr[1]))

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[2 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(x: this.model.size * 0.425 * cos(radian),
                y: -this.model.size * 0.2125).scale(Float32(this.fadeValueArr[2]))

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[3 % this.model.colors.size]).position(x: this.model.size * 0.85,
                y: this.model.size * 0.425).scale(Float32(this.fadeValueArr[3]))

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[4 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(x: this.model.size * 0.425 * cos(radian), y: this.model.size * 0.2125
            ).scale(Float32(this.fadeValueArr[4]))

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[5 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(
                x: this.model.size * 0.2125,
                y: this.model.size * 0.425 * cos(radian)
            ).scale(Float32(this.fadeValueArr[5]))

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[6 % this.model.colors.size]).position(x: this.model.size * 0.425,
                y: this.model.size * 0.85).scale(Float32(this.fadeValueArr[6]))
            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[7 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(
                x: -this.model.size * 0.2125,
                y: this.model.size * 0.425 * cos(radian)
            ).scale(Float32(this.fadeValueArr[7]))
            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[8 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(x: -this.model.size * 0.425 * cos(radian),
                y: this.model.size * 0.2125).scale(Float32(this.fadeValueArr[8]))

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[9 % this.model.colors.size]).position(x: 0.0, y: this.model.size * 0.425).scale(
                Float32(this.fadeValueArr[9]))
            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[10 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(x: -this.model.size * 0.425 * cos(radian),
                y: -this.model.size * 0.2125).scale(Float32(this.fadeValueArr[10]))

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[11 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(x: -this.model.size * 0.2125,
                y: -this.model.size * 0.425 * cos(radian)).scale(Float32(this.fadeValueArr[11]))
        }.width(this.model.size).height(this.model.size).onAppear({
            => for (i in 0..12) {
                setAnimator(i)
            }
        })
    }
}
