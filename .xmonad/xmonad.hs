import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
     xmproc <- spawnPipe "xmobar"
     xmonad $ defaultConfig
    	{ manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
	, logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
			, ppVisible = wrap "(" ")"
                        }
	, modMask = mod4Mask
	, terminal = "urxvt"
        } `additionalKeys`
        [ ((0, 0x1008ff11), spawn "amixer -q set PCM 3- unmute")
	, ((0, 0x1008ff13), spawn "amixer -q set PCM 3+ unmute")
	, ((0, 0x1008ff12), spawn "amixer -q set Master toggle")
	, ((0, 0x1008ff17), spawn "ncmpcpp next")
	, ((0, 0x1008ff16), spawn "ncmpcpp prev")
	, ((0, 0x1008ff14), spawn "ncmpcpp toggle")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        ]

