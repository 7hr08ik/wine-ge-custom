#!/bin/bash

    #WINE
    cd wine
    git reset --hard HEAD
    git clean -xdf

    echo "plasma systray fix"
    patch -Np1 < ../game-patches-testing/wine-patches/plasma_systray_fix.patch

    #WINE STAGING
    echo "applying staging patches"
    ../wine-staging/patches/patchinstall.sh DESTDIR="." --all \
    -W server-Desktop_Refcount \
    -W ws2_32-TransmitFile \
    -W winex11.drv-mouse-coorrds \
    -W winex11-MWM_Decorations \
    -W winex11-_NET_ACTIVE_WINDOW \
    -W winex11-WM_WINDOWPOSCHANGING \
    -W user32-rawinput-mouse \
    -W user32-rawinput-nolegacy \
    -W user32-rawinput-mouse-experimental \
    -W user32-rawinput-hid \
    -W dinput-SetActionMap-genre \
    -W dinput-axis-recalc \
    -W dinput-joy-mappings \
    -W dinput-reconnect-joystick \
    -W dinput-remap-joystick \
    -W winex11-key_translation 

    #VKD3D-WINE
    #echo "applying WoW vkd3d wine patches
    #patch -Np1 < ../game-patches-testing/wine-patches/D3D12SerializeVersionedRootSignature.patch
    #patch -Np1 < ../game-patches-testing/wine-patches/D3D12CreateVersionedRootSignatureDeserializer.patch

    #WINE VULKAN
    echo "applying winevulkan patches"
    patch -Np1 < ../game-patches-testing/wine-patches/winevulkan-childwindow.patch

    #WINE FAUDIO
    echo "applying faudio patches"
    patch -Np1 < ../game-patches-testing/faudio-patches/faudio-ffmpeg.patch

    #WINE GAME PATCHES

    echo "mech warrior online" - tested OK
    patch -Np1 < ../game-patches-testing/game-patches/mwo.patch

    echo "final fantasy XIV" - tested OK
    patch -Np1 < ../game-patches-testing/game-patches/ffxiv-launcher.patch

    echo "final fantasy XV" - tested OK
    patch -Np1 < ../game-patches-testing/game-patches/ffxv-steam-fix.patch

    echo "assetto corsa"
    patch -Np1 < ../game-patches-testing/game-patches/assettocorsa-hud.patch

    echo "sword art online" - tested OK
    patch -Np1 < ../game-patches-testing/game-patches/sword-art-online-gnutls.patch

    echo "origin downloads fix" - tested OK
    patch -Np1 < ../game-patches-testing/game-patches/origin-downloads_fix.patch

    echo "monster hunter world fix"
    patch -Np1 < ../game-patches-testing/game-patches/mhw_fix.patch

    echo "blackops 2 fix"
    patch -Np1 < ../game-patches-testing/game-patches/blackops_2_fix.patch

    echo "bcrypt fix for honor, steep"
    patch -Np1 < ../game-patches-testing/game-patches/0001-bcrypt-Implement-BCryptSecretAgreement-with-libgcryp.patch
    patch -Np1 < ../game-patches-testing/game-patches/0002-bcrypt-Implement-BCryptSecretAgreement-with-libgcryp.patch

    echo "fix steep and AC Odyssey fullscreen"
    patch -Np1 < ../game-patches-testing/wine-patches/0001-Add-some-semi-stubs-in-user32.patch

    #WINE FSYNC
    echo "applying fsync patches"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-fsync_staging.patch

    #PROTON
    echo "applying proton patches"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-LAA_staging.patch

    echo "mk11 patch"
    patch -Np1 < ../game-patches-testing/game-patches/mk11.patch

    echo "clock monotonic, amd ags, hide prefix update"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-use_clock_monotonic.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-amd_ags.patch

    echo "fullscreen hack"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-FS_bypass_compositor.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/valve_proton_fullscreen_hack-staging.patch

    echo "raw input"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-rawinput.patch

    echo "applying staging patches that need to be applied after proton rawinput and fullscreen hack"

    # staging winex11-key_translation
    patch -Np1 < ../wine-staging/patches/winex11-key_translation/0001-winex11-Match-keyboard-in-Unicode.patch
    patch -Np1 < ../wine-staging/patches/winex11-key_translation/0002-winex11-Fix-more-key-translation.patch
    patch -Np1 < ../wine-staging/patches/winex11-key_translation/0003-winex11.drv-Fix-main-Russian-keyboard-layout.patch

    # staging winex11.drv-mouse-coorrds
    patch -Np1 < ../game-patches-testing/proton-hotfixes/proton-staging_winex11.drv-mouse-coorrds.patch

    # staging winex11-MWM_Decorations
    patch -Np1 < ../game-patches-testing/proton-hotfixes/proton-staging_winex11-MWM_Decorations.patch

    # staging winex11-_NET_ACTIVE_WINDOW
    #patch -Np1 < ../game-patches-testing/proton-hotfixes/proton-staging_winex11-_NET_ACTIVE_WINDOW.patch

    # staging winex11-WM_WINDOWPOSCHANGING
    #patch -Np1 < ../game-patches-testing/proton-hotfixes/proton-staging_winex11-WM_WINDOWPOSCHANGING.patch

    echo "Valve dxgi patches"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-vr.patch

    echo "Valve vulkan patches"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-vk-bits-4.5.patch

    echo "FS Hack integer scaling"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton_fs_hack_integer_scaling.patch

    echo "SDL Joystick"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-sdl_joy.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-sdl_joy_2.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-sdl_joy_3.patch

    echo "proton gamepad additions"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-gamepad-additions.patch

    echo "mf hacks"
    patch -Np1 < ../game-patches-testing/proton-hotfixes/proton-mf_hacks.patch

    #WINE CUSTOM PATCHES
    #add your own custom patch lines below

    ./tools/make_requests
    autoreconf -f

    #end
