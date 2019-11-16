-- windows manipulation
hs.hotkey.bind({"cmd", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x
  f.w = max.w / 2
  if f.h-max.h/2 > 1 
  then 
    f.h = max.h
    f.y = max.y
  end
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x + max.w / 2
  f.w = max.w/2 
  if f.h-max.h/2 > 1 
  then 
    f.h = max.h
    f.y = max.y
  end
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.h = max.h/2
  f.y = max.y
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.h = max.h/2
  f.y = max.y + max.h/2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "f", function()
  local win = hs.window.focusedWindow()
  win:toggleFullScreen()
end)

hs.hotkey.bind({"cmd", "ctrl"}, "m", function()
  local win = hs.window.focusedWindow()
  win:maximize()
end)

-- GRID
hs.grid.setGrid('2x2')
hs.grid.setMargins('1x1')
hs.hotkey.bind({'cmd'}, 'g', hs.grid.show)

-- window hints
hs.hints.showTitleThresh = 10
-- hs.hotkey.bind({'cmd', 'alt'}, 'p', hs.hints.windowHints)
hs.hotkey.bind({'cmd'}, 'h', hs.hints.windowHints)

-- Expose
expose = hs.expose.new(nil,{showThumbnails=false}) -- default windowfilter, no thumbnails
expose_app = hs.expose.new(nil,{onlyActiveApplication=true}) -- show windows for the current application
expose_space = hs.expose.new(nil,{includeOtherSpaces=false}) -- only windows in the current Mission Control Space
--expose_browsers = hs.expose.new{'Safari','Google Chrome'} -- specialized expose using a custom windowfilter
hs.expose.ui.maxHintLetters = 1
hs.hotkey.bind('ctrl-cmd','e','Expose',function()expose:toggleShow()end)
hs.hotkey.bind('ctrl-cmd-shift','e','App Expose',function()expose_app:toggleShow()end)
--hs.hotkey.bind('cmd','e','Expose',function()expose:toggleShow()end)

-- quick launch
hs.hotkey.bind({"cmd","ctrl"},"1",function() 
  hs.application.launchOrFocus("Finder")
end) 
hs.hotkey.bind({"cmd","ctrl"},"2",function() 
  hs.application.launchOrFocus("Google Chrome")
end) 
hs.hotkey.bind({"cmd","ctrl"},"3",function() 
  hs.application.launchOrFocus("Visual Studio Code")
end) 
hs.hotkey.bind({"cmd","ctrl"},"4",function() 
  hs.application.launchOrFocus("Hyper")
end) 
hs.hotkey.bind({"cmd","ctrl"},"5",function() 
  hs.application.launchOrFocus("WeChat")
end) 

-- config auto reload
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- caffeine
hs.loadSpoon("Caffeine")
spoon.Caffeine:start()