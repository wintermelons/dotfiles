import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.Fullscreen
import XMonad.Util.EZConfig
import XMonad.Util.Run
import Graphics.X11.ExtraTypes.XF86
import System.IO

myWorkspaces = ["1", "2:Web", "3:Code", "4", "5", "6", "7:Chat", "8", "9"]

myManageHook = composeAll
    [ className =? "Firefox" --> doShift "2:Web"
    , isFullscreen           --> doFullFloat ]

-- layout
defaultLayout = tiled ||| Full
  where
    tiled = spacing 2 $ Tall nmaster delta ratio
    nmaster = 1
    ratio = 2/3
    delta = 3/100

-- loghook
myLogHook dest = dynamicLogWithPP $ xmobarPP
    { ppOutput = hPutStrLn dest
    , ppTitle = xmobarColor "green" "" . shorten 50
    }

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar"
  xmonad $ defaultConfig
    { borderWidth          = 1
    , normalBorderColor    = "#343838"
    , focusedBorderColor   = "#008C9E"
    , terminal             = "urxvt"
    , modMask              = mod4Mask
    , workspaces           = myWorkspaces

    -- hooks
    , manageHook           = manageDocks <+> myManageHook
    , layoutHook           = avoidStruts $ smartBorders defaultLayout
    , startupHook          = setWMName "LG3D"
    , logHook              = myLogHook xmproc
    }
    `additionalKeys`

    [ ((0, xK_Print),                     -- print screen
       spawn "scrot")

    , ((0, xK_Mode_switch),               -- launch
       spawn "dmenu_run")

    , ((mod4Mask .|. shiftMask, xK_w),    -- close
       kill)

    , ((mod4Mask .|. shiftMask, xK_c),    -- disable mod-C
       return ())

    , ((0, xF86XK_MonBrightnessUp),       -- brightness up
       spawn "light -A 5") 

    , ((0, xF86XK_MonBrightnessDown),     -- brightness down
       spawn "light -U 5")

    , ((0, xF86XK_AudioRaiseVolume),      -- volume up
       spawn "amixer -D pulse set Master 5%+")

    , ((0, xF86XK_AudioLowerVolume),      -- volume down
       spawn "amixer -D pulse set Master 5%-")

    , ((0, xF86XK_AudioMute),             -- volume mute
       spawn "amixer -D pulse set Master toggle")

    , ((0, 0x1008FFB2),                   -- mic mute
       spawn "amixer -D pulse set Capture toggle")

    ]