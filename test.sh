#!/usr/bin/env bash

_DISPLAY=:99

Xte() {
	xte -x $_DISPLAY "$@"
}

_PROTON_SIGNUP='https://account.proton.me/signup'

function NewPrivateWindow () {
    Xte "keydown Control_L" "keydown Shift_L"
    Xte "key P"
    Xte "keyup Control_L" "keyup Shift_L"
}


function OpenURL () {
	Xte "keydown Control_L" "key L"
	sleep 1; 
	Xte "keyup Control_L"

	Xte "str $1"
	Xte "key Return"
}

function Test () {
    NewPrivateWindow
    sleep 1
    OpenURL $_PROTON_SIGNUP
}

EnterCreds() {
    _USERNAME='Idontknow455356'
    _PASSWORD='IdontPass34647647'
    Xte "str $_USERNAME"
    sleep 1
    Xte "key Tab"
    sleep 1
    Xte "key Tab"
    sleep 1
    Xte "str $_PASSWORD"
    sleep 1
    Xte "key Tab"
    sleep 1
    Xte "str $_PASSWORD"
    sleep 1
    Xte "key Tab"
    sleep 1
    Xte "key Return"
    sleep 4
    
    Xte "key Tab"
    sleep 1
    Xte "key Tab"
    sleep 1
    Xte "key Return"
    sleep 4

    Xte "key Tab"
    sleep 1
    Xte "key Tab"
    sleep 1
    Xte "key Tab"
    sleep 1
    Xte "key Tab"
    sleep 1
    Xte "key Tab"
    sleep 1
    Xte "key Tab"
    sleep 1
    Xte "key Tab"
    sleep 1
    Xte "key Return"
    sleep 1

}


#Test