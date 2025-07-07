/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class RotateEightCirclesModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var colors: Array<Color> = [Color.RED]

    @Publish
    var duration: Int32 = 1200

    public func setSize(size: Float64): RotateEightCirclesModel {
        this.size = size
        return this
    }

    public func setColors(colors: Array<Color>): RotateEightCirclesModel {
        this.colors = colors
        return this
    }
    public func setDuration(duration: Int32): RotateEightCirclesModel {
        this.duration = duration
        return this
    }
}

@Component
public class RotateEightCirclesComponent {
    @State
    var model: RotateEightCirclesModel = RotateEightCirclesModel()

    let radian = 30.0 * Float64.getPI() / 180.0

    @State
    var rotateValue1: Float64 = 0.0

    func build() {
        Stack(Alignment.TopStart) {
            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(this.model.colors[0]).position(
                x: this.model.size * 0.425, y: 0.0).opacity(0.125)

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[1 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(
                x: this.model.size * 0.2125,
                y: -this.model.size * 0.425 * cos(radian)
            ).opacity(0.25)

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[2 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(x: this.model.size * 0.425 * cos(radian),
                y: -this.model.size * 0.2125).opacity(0.375)

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[3 % this.model.colors.size]).position(x: this.model.size * 0.85,
                y: this.model.size * 0.425).opacity(0.5)

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[4 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(x: this.model.size * 0.425 * cos(radian), y: this.model.size * 0.2125
            ).opacity(0.625)

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[5 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(
                x: this.model.size * 0.2125,
                y: this.model.size * 0.425 * cos(radian)
            ).opacity(0.75)

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[6 % this.model.colors.size]).position(x: this.model.size * 0.425,
                y: this.model.size * 0.85).opacity(0.875)
            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[7 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(
                x: -this.model.size * 0.2125,
                y: this.model.size * 0.425 * cos(radian)
            ).opacity(1.0)
        }.width(this.model.size).height(this.model.size).rotate(Float32(this.rotateValue1)).onAppear(
            {
            => animateTo(
                AnimateParam(
                    duration: this.model.duration,
                    delay: 0,
                    curve: Curve.Linear,
                    iterations: -1,
                    playMode: PlayMode.Normal,
                    onFinish: {=>}
                ),
                {
                    => this.rotateValue1 = 360.0
                }
            )
        })
    }
}
