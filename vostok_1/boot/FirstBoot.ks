core:part:getmodule("kOSProcessor"):doevent("Open Terminal").
CLEARSCREEN.
wait 1.
print "kOS kernel loaded...".
wait 1.
print "Running vostok_1.ks".
wait 1.
runpath("0:/vostok_1.ks").
