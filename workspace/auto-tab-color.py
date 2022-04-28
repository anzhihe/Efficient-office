#!/usr/bin/env python3

import iterm2
import random

async def SetPresetInSession(connection, session, preset_name): 
    preset = await iterm2.ColorPreset.async_get(connection, preset_name)
    if not preset:
        return
    profile = await session.async_get_profile()
    if not profile:
        return
    await profile.async_set_color_preset(preset)


async def set_tab_colors(connection):
    red = random.randint(1, 255)
    green = random.randint(1, 255)
    blue = random.randint(1, 255)
    app=await iterm2.async_get_app(connection)
    session=app.current_terminal_window.current_tab.current_session
    change = iterm2.LocalWriteOnlyProfile()
    color = iterm2.Color(red, green, blue)
    change.set_tab_color(color)
    change.set_use_tab_color(True)
    await session.async_set_profile_properties(change)

async def main(connection):
    app = await iterm2.async_get_app(connection)
    color_preset_names = await iterm2.ColorPreset.async_get_list(connection)
    async with iterm2.NewSessionMonitor(connection) as mon:
        while True:
            session_id = await mon.async_get()
            session = app.get_session_by_id(session_id)
            if session:
              	# 注释这个函数，不再使用新的profile
              	#  await SetPresetInSession(connection, session, random.choice(color_preset_names))
				# 添加一下代码，在新创建的tab上改变tab颜色
                red = random.randint(1, 255)
                green = random.randint(1, 255)
                blue = random.randint(1, 255)
                app=await iterm2.async_get_app(connection)
                session=app.current_terminal_window.current_tab.current_session
                change = iterm2.LocalWriteOnlyProfile()
                color = iterm2.Color(red, green, blue)
                change.set_tab_color(color)
                change.set_use_tab_color(True)
                await session.async_set_profile_properties(change)

iterm2.run_forever(main)
