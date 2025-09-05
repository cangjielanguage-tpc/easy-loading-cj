package ohos_app_cangjie_entry_test.LLT

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.ui_test.*
@Test
class TestExample {
    @TestCase
    func testLevel0(): Unit {
        let driver = Driver.create()
//        driver.findComponent(On().id("SampleRotatePlain")).click()
//        driver.delayMs(1500)
//        driver.findComponent(On().id("back")).click()
//        driver.delayMs(1500)
//
//        driver.findComponent(On().id("SampleDoubleBounce")).click()
//        driver.delayMs(1500)
//        driver.findComponent(On().id("back")).click()
//        driver.delayMs(1500)
//
//                driver.findComponent(On().id("SampleWave")).click()
//        driver.delayMs(1500)
//        driver.findComponent(On().id("back")).click()
//        driver.delayMs(1500)
//
//                driver.findComponent(On().id("SampleWanderingCubes")).click()
//        driver.delayMs(1500)
//        driver.findComponent(On().id("back")).click()
//        driver.delayMs(1500)
//
//                driver.findComponent(On().id("SampleFadingFour")).click()
//        driver.delayMs(1500)
//        driver.findComponent(On().id("back")).click()
//        driver.delayMs(1500)
//
//                driver.findComponent(On().id("SampleFadingCube")).click()
//        driver.delayMs(1500)
//        driver.findComponent(On().id("back")).click()
//        driver.delayMs(1500)
//
//                driver.findComponent(On().id("SamplePulse")).click()
//        driver.delayMs(1500)
//        driver.findComponent(On().id("back")).click()
//        driver.delayMs(1500)
//
//                driver.findComponent(On().id("SampleSpinChasingDots")).click()
//        driver.delayMs(1500)
//        driver.findComponent(On().id("back")).click()
//        driver.delayMs(1500)
//
//                driver.findComponent(On().id("SampleThreeBounce")).click()
//        driver.delayMs(1500)
//        driver.findComponent(On().id("back")).click()
//        driver.delayMs(1500)
//
//                driver.findComponent(On().id("SampleCircle")).click()
//        driver.delayMs(1500)
//        driver.findComponent(On().id("back")).click()
//        driver.delayMs(1500)

//        driver.findComponent(On().id("other_sample")).click()
//        driver.delayMs(1500)
//
//        for(item in arr_L0) {
//            driver.findComponent(On().id("${item}")).click()
//            driver.delayMs(1500)
//
//            driver.findComponent(On().id("back")).click()
//            driver.delayMs(1500)
//        }
//
//        driver.findComponent(On().id("other_back")).click()
//        driver.delayMs(1500)

        driver.findComponent(On().id("other_sample_llt")).click()
        driver.delayMs(1500)

        for(item in arr_llt) {
            driver.findComponent(On().id("${item}")).click()
            driver.delayMs(1500)

            driver.findComponent(On().id("back")).click()
            driver.delayMs(1500)
        }

        driver.findComponent(On().id("llt_back")).click()
        driver.delayMs(1500)
    }
}
