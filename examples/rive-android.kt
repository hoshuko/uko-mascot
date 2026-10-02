// build.gradle : implementation("app.rive:rive-android:<dernière version>") — copie uko.riv dans res/raw/
import app.rive.runtime.kotlin.RiveAnimationView

fun setupUko(riveView: RiveAnimationView) {
    riveView.setRiveResource(R.raw.uko, stateMachineName = "Uko")
}

fun startLoading(riveView: RiveAnimationView) = riveView.setNumberState("Uko", "state", 2f)

fun celebrate(riveView: RiveAnimationView) {
    riveView.setNumberState("Uko", "state", 0f)
    riveView.fireState("Uko", "success")
}
