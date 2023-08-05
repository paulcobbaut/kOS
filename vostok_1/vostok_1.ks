function WriteIntro {
  clearscreen.
  print "File: vostok_1.ks".
  print "Auth: Paul Cobbaut".
  print "Date: 2023-07-29".
  print "Ship: Vostok 1".
  wait 1.
}

function WriteCountdown {
  print "Counting down for launch...".
  from {local countdown is 10.} until countdown = 0 step {set countdown to countdown - 1.} do {
    print "..." + countdown.
    wait 1.
  }
}

function Launch {
  // Set heading and throttle
  lock steering to heading(0,90).
  lock throttle to 0.9.
  // Launch
  print "Launching rocket...".
  stage.
}

function DoScience {
  Parameter ScienceDevice.
  Parameter ScienceDescription.

print "Doing Science:" + ScienceDescription.
set P to SHIP:PARTSNAMED(ScienceDevice)[0].
set M to P:GETMODULE("ModuleScienceExperiment").
M:DEPLOY.
wait until M:HASDATA.
print "Transmitting:" + ScienceDescription.
M:TRANSMIT.
wait 2.
print "Done Science:" + ScienceDescription.
}

// Program Start
WriteIntro().
WriteCountdown().
Launch().

// At +500m: turn and do science
wait until ship:altitude > 500.
lock steering to HEADING(0,90) + R(0,-20,0).
DoScience("GooExperiment","Observe Mystery Goo").
DoScience("sensorBarometer","Measure Atmospheric Pressure").
DoScience("sensorThermometer","Measure 2HOT Temperature").

// At +3000m: turn some more
wait until ship:altitude > 3000.
lock steering to HEADING(0,90) + R(0,-30,0).

// At +7000m: turn some more
wait until ship:altitude > 7000.
lock steering to HEADING(0,90) + R(0,-40,0).

// First stage empty
wait until stage:liquidfuel < 0.1.
// stage decoupler
print "Staging decoupler...".
stage.
wait 1.
// fire second stage
lock throttle to 0.5.
print "Firing second stage...".
stage.

// At +12000m: turn some more
wait until ship:altitude > 12000.
lock steering to HEADING(0,90) + R(0,-60,0).

// Second stage empty
wait until stage:liquidfuel < 0.1.
stage.

wait until ship:altitude > 36000.
lock steering to SHIP:RETROGRADE.

wait until ship:altitude < 2500.
print "chutesafe on...".
chutessafe on.

wait until ship:altitude < 10.
print "Program end. Please recover vessel.".
