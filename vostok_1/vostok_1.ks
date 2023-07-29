// Intro
clearscreen.
print "File: vostok_1.ks".
print "Auth: Paul Cobbaut".
print "Date: 2023-07-29".
print "Ship: Vostok 1".
wait 2.

// Launch countdown
print "Counting down for launch...".
from {local countdown is 10.} until countdown = 0 step {set countdown to countdown - 1.} do {
    print "..." + countdown.
    wait 1.
}

// Set heading and throttle
lock steering to heading(0,90).
lock throttle to 0.9.
//don't combine sas and lock steering
//sas on.

// Launch
stage.

// At +500m: turn and do science
wait until ship:altitude > 500.
lock steering to HEADING(0,90) + R(0,-30,0).

// Do some science
PRINT "Doing Science... Goo.".
SET P TO SHIP:PARTSNAMED("GooExperiment")[0].
SET M TO P:GETMODULE("ModuleScienceExperiment").
M:DEPLOY.
WAIT UNTIL M:HASDATA.
M:TRANSMIT.
PRINT "Science Goo done...".


// Do some science
PRINT "Doing Science... Pressure".
SET P TO SHIP:PARTSNAMED("sensorBarometer")[0].
SET M TO P:GETMODULE("ModuleScienceExperiment").
M:DEPLOY.
WAIT UNTIL M:HASDATA.
M:TRANSMIT.
PRINT "Science Pressure done...".


// Do some science
PRINT "Doing Science... 2HOT".
SET P TO SHIP:PARTSNAMED("sensorThermometer")[0].
SET M TO P:GETMODULE("ModuleScienceExperiment").
M:DEPLOY.
WAIT UNTIL M:HASDATA.
M:TRANSMIT.
PRINT "Science 2HOT done...".


// At +500m: turn some more
wait until ship:altitude > 7000.
lock steering to HEADING(0,90) + R(0,-45,0).

// First stage empty
wait until stage:liquidfuel < 0.1.
stage.


// At +10000m: turn and do science
wait until ship:altitude > 30000.
lock steering to HEADING(0,90) + R(0,-90,0).


// Does not take the second set of science devices :(

// Do some science
PRINT "Doing Science... Goo.".
SET P TO SHIP:PARTSNAMED("GooExperiment")[0].
SET M TO P:GETMODULE("ModuleScienceExperiment").
M:DEPLOY.
WAIT UNTIL M:HASDATA.
M:TRANSMIT.
PRINT "Science Goo done...".


// Do some science
PRINT "Doing Science... Pressure".
SET P TO SHIP:PARTSNAMED("sensorBarometer")[0].
SET M TO P:GETMODULE("ModuleScienceExperiment").
M:DEPLOY.
WAIT UNTIL M:HASDATA.
M:TRANSMIT.
PRINT "Science Pressure done...".


// Do some science
PRINT "Doing Science... 2HOT".
SET P TO SHIP:PARTSNAMED("sensorThermometer")[0].
SET M TO P:GETMODULE("ModuleScienceExperiment").
M:DEPLOY.
WAIT UNTIL M:HASDATA.
M:TRANSMIT.
PRINT "Science 2HOT done...".


// Second stage empty
wait until stage:liquidfuel < 0.1.
stage.

// Now what :)
// 1. Don't burn up
// 2. Open chutes when appropriate
// 3. Land or splash down
// 4. Recover vessel

print "Program end. Please recover vessel.".
