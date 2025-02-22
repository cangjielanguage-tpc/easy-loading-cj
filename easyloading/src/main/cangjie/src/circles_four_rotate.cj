/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class RotateFourCirclesModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var colors: Array<Color> = [Color.RED]

    @Publish
    var duration: Int32 = 1200

    public func setSize(size: Float64): RotateFourCirclesModel {
        this.size = size
        return this
    }

    public func setColors(colors: Array<Color>): RotateFourCirclesModel {
        this.colors = colors
        return this
    }
    public func setDuration(duration: Int32): RotateFourCirclesModel {
        this.duration = duration
        return this
    }
}

@Component
public class RotateFourCirclesComponent {
    @State
    var model: RotateFourCirclesModel = RotateFourCirclesModel()

    let radian = 30.0 * Float64.PI / 180.0

    @State
    var rotateValue1: Float64 = 0.0

    func build() {
        Stack(Alignment.TopStart) {
            Circle(width: this.model.size * 0.3, height: this.model.size * 0.3).fill(this.model.colors[0]).position(
                x: this.model.size * 0.35, y: 0.0)

            Circle(width: this.model.size * 0.3, height: this.model.size * 0.3).fill(
                this.model.colors[3 % this.model.colors.size]).position(x: this.model.size * 0.7,
                y: this.model.size * 0.35)

            Circle(width: this.model.size * 0.3, height: this.model.size * 0.3).fill(
                this.model.colors[6 % this.model.colors.size]).position(x: this.model.size * 0.35,
                y: this.model.size * 0.7)

            Circle(width: this.model.size * 0.3, height: this.model.size * 0.3).fill(
                this.model.colors[9 % this.model.colors.size]).position(x: 0.0, y: this.model.size * 0.35)
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
