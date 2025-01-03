/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class ThreeBounceModel {
    var colors: Array<Color> = []

    let itemCount: Int64 = 3

    var size: Float64 = 50.0

    var duration: Int64 = 700

    @Publish
    var entrys: ArrayList<ThreeBounceEntry> = ArrayList<ThreeBounceEntry>()

    var phaseY: Float64 = 0.0

    public func init_data() {
        for (index in 0..itemCount) {
            var entry = ThreeBounceEntry()
            entry.init_data(this.colors[index % this.colors.size])
            entrys.append(entry)
        }
    }

    public func animateY(time: Int32, easing!: String = "linear") {
        for (index in 0..entrys.size) {
            entrys[index].animateY(time, index, easing: easing)
        }
    }

    public func offAnimateY() {
        for (index in 0..entrys.size) {
            entrys[index].offAnimateY()
        }
    }

    public func getColors(): Array<Color> {
        return this.colors
    }

    public func setColors(colors: Array<Color>): ThreeBounceModel {
        this.colors = colors
        return this
    }

    public func getItemCount(): Int64 {
        return this.itemCount
    }

    public func getSize(): Float64 {
        return this.size
    }

    public func setSize(size: Float64): ThreeBounceModel {
        this.size = size
        return this
    }

    public func getDuration(): Int64 {
        return this.duration
    }

    public func setDuration(duration: Int64): ThreeBounceModel {
        this.duration = duration
        return this
    }
}

@Component
public class ThreeBounceComponent {
    @State
    var threeBounceModel: ThreeBounceModel = ThreeBounceModel()

    let itemCount: Int64 = 3

    var color: Color = Color.WHITE

    var width: Float64 = 300.0

    var height: Float64 = 300.0

    @State
    var size: Float64 = 0.0

    protected override func aboutToAppear() {
        this.size = threeBounceModel.size
    }
    protected override func aboutToDisappear() {
        this.threeBounceModel.offAnimateY()
    }

    func build() {
        RelativeContainer() {
            Row() {
                ForEach(
                    this.threeBounceModel.entrys,
                    itemGeneratorFunc: {
                        item: ThreeBounceEntry, index: Int64 => ScaleXYComponent(size: this.threeBounceModel.getSize(),
                            entry: item)
                    }
                )
            }.width(this.size * 2.0).height(this.size).align(Alignment.Center).justifyContent(FlexAlign.SpaceEvenly).
                alignRules(
                AlignRuleOption(
                    top: VerticalAnchor("__container__", VerticalAlign.Top),
                    bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                    left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                    right: HorizontalAnchor("__container__", HorizontalAlign.End),
                )
            )
        }.width(this.width).height(this.height).backgroundColor(this.color).border(width: 2.vp, color: Color(0x6699ff))
    }
}

@Component
public class ScaleXYComponent {
    @State
    var entry: ThreeBounceEntry = ThreeBounceEntry()

    @State
    var size: Float64 = 0.0

    @State
    var alignment: Alignment = Alignment.Center

    protected override func aboutToAppear() {
    }

    func build() {
        Column {
            Rect(width: this.size * 0.5, height: this.size * 0.5).fill(entry.getColor()).scale(
                Float32(entry.getScaleValue()))
        }
    }
}
