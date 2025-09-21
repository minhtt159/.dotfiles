-- Create icon map table based on the shell script
local icon_map = {
  ["Alacritty"] = ":alacritty:",
  ["Android Studio"] = ":android_studio:",
  ["Anytype"] = ":anytype:",
  ["App Eraser"] = ":app_eraser:",
  ["App Store"] = ":app_store:",
  ["Arc"] = ":arc:",
  ["Arduino"] = ":arduino:",
  ["Arduino IDE"] = ":arduino:",
  ["Atom"] = ":atom:",
  ["Audacity"] = ":audacity:",
  ["Bambu Studio"] = ":bambu_studio:",
  ["Battle.net"] = ":battle_net:",
  ["Bear"] = ":bear:",
  ["BetterTouchTool"] = ":bettertouchtool:",
  ["Bitwarden"] = ":bit_warden:",
  ["Calibre"] = ":book:",
  ["Brave Browser"] = ":brave_browser:",
  ["BusyCal"] = ":busycal:",
  ["Calculator"] = ":calculator:",
  ["Calculette"] = ":calculator:",
  ["Calendar"] = ":calendar:",
  ["日历"] = ":calendar:",
  ["Fantastical"] = ":calendar:",
  ["Cron"] = ":calendar:",
  ["Amie"] = ":calendar:",
  ["Calendrier"] = ":calendar:",
  ["Notion Calendar"] = ":calendar:",
  ["Citrix Workspace"] = ":citrix:",
  ["Citrix Viewer"] = ":citrix:",
  ["Claude"] = ":claude:",
  ["ClickUp"] = ":click_up:",
  ["Code"] = ":code:",
  ["Code - Insiders"] = ":code:",
  ["Color Picker"] = ":color_picker:",
  ["数码测色计"] = ":color_picker:",
  ["GitHub Copilot"] = ":copilot:",
  ["Copilot"] = ":copilot:",
  ["Cursor"] = ":cursor:",
  ["Cypress"] = ":cypress:",
  ["DataGrip"] = ":datagrip:",
  ["DataSpell"] = ":dataspell:",
  ["Default"] = ":default:",
  ["CleanMyMac X"] = ":desktop:",
  ["Discord"] = ":discord:",
  ["Discord Canary"] = ":discord:",
  ["Discord PTB"] = ":discord:",
  ["Docker"] = ":docker:",
  ["Docker Desktop"] = ":docker:",
  ["Drafts"] = ":drafts:",
  ["draw.io"] = ":draw_io:",
  ["Dropbox"] = ":dropbox:",
  ["Element"] = ":element:",
  ["Emacs"] = ":emacs:",
  ["FaceTime"] = ":facetime:",
  ["FaceTime 通话"] = ":facetime:",
  ["Firefox"] = ":firefox:",
  ["Google Chrome"] = ":google_chrome:",
  ["Safari"] = ":safari:",
  ["Terminal"] = ":terminal:",
  ["iTerm"] = ":terminal:",
  ["Visual Studio Code"] = ":code:",
  ["Xcode"] = ":xcode:",
  ["Zoom"] = ":zoom:",
}

-- Function to get icon for app name
local function get_app_icon(app_name)
  return icon_map[app_name] or ":default:"
end

local front_app = sbar.add("item", "front_app", {
  position = "left",
  icon = {
    font = {
      family = "sketchybar-app-font",
      style = "Regular",
      size = 16.0
    }
  },
  label = {
    drawing = true
  }
})

front_app:subscribe("front_app_switched", function(env)
  local app_name = env.INFO
  local app_icon = get_app_icon(app_name)
  
  front_app:set({
    label = { string = app_name },
    icon = { string = app_icon }
  })
end)