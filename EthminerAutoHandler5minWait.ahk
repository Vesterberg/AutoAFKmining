; Made by Jakob Vesterberg, Jakob.f.Vesterberg@gmail.com

﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTimer, HaltEthminerAtUserInput, 250
SetTimer, StartEthminerAtUserInactivity, 250

StartEthminerAtUserInactivity:
	IfGreaterOrEqual, A_TimeIdlePhysical, 30000
	{
		Process, Exist, ethminer.exe
		If ErrorLevel = 0
		{
			Run, EthminerPoolMining.bat
		}
	}
return

HaltEthminerAtUserInput:
	IfLess, A_TimeIdlePhysical, 29000
	{
		Process, Exist, ethminer.exe
		If ErrorLevel <> 0
		{
			Process, Close, ethminer.exe
		}
	}
return

^F2::Pause

^F1:: Process, Close, ethminer.exe

; Made by Jakob Vesterberg, Jakob.f.Vesterberg@gmail.com
