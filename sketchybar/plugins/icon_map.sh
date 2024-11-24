#!/usr/bin/env sh

### START-OF-ICON-MAP
function icon_map() {
	case "$1" in
	"Alacritty")
		icon_result=":alacritty:"
		;;
	"Android Studio")
		icon_result=":android_studio:"
		;;
	"Anytype")
		icon_result=":anytype:"
		;;
	"App Eraser")
		icon_result=":app_eraser:"
		;;
	"App Store")
		icon_result=":app_store:"
		;;
	"Arc")
		icon_result=":arc:"
		;;
	"Arduino" | "Arduino IDE")
		icon_result=":arduino:"
		;;
	"Atom")
		icon_result=":atom:"
		;;
	"Audacity")
		icon_result=":audacity:"
		;;
	"Bambu Studio")
		icon_result=":bambu_studio:"
		;;
	"Battle.net")
		icon_result=":battle_net:"
		;;
	"Bear")
		icon_result=":bear:"
		;;
	"BetterTouchTool")
		icon_result=":bettertouchtool:"
		;;
	"Bitwarden")
		icon_result=":bit_warden:"
		;;
	"Calibre")
		icon_result=":book:"
		;;
	"Brave Browser")
		icon_result=":brave_browser:"
		;;
	"BusyCal")
		icon_result=":busycal:"
		;;
	"Calculator" | "Calculette")
		icon_result=":calculator:"
		;;
	"Calendar" | "日历" | "Fantastical" | "Cron" | "Amie" | "Calendrier" | "Notion Calendar")
		icon_result=":calendar:"
		;;
	"Citrix Workspace" | "Citrix Viewer")
		icon_result=":citrix:"
		;;
	"Claude")
		icon_result=":claude:"
		;;
	"ClickUp")
		icon_result=":click_up:"
		;;
	"Code" | "Code - Insiders")
		icon_result=":code:"
		;;
	"Color Picker" | "数码测色计")
		icon_result=":color_picker:"
		;;
	"Copilot")
		icon_result=":copilot:"
		;;
	"Cursor")
		icon_result=":cursor:"
		;;
	"Cypress")
		icon_result=":cypress:"
		;;
	"DataGrip")
		icon_result=":datagrip:"
		;;
	"DataSpell")
		icon_result=":dataspell:"
		;;
	"Default")
		icon_result=":default:"
		;;
	"CleanMyMac X")
		icon_result=":desktop:"
		;;
	"Discord" | "Discord Canary" | "Discord PTB")
		icon_result=":discord:"
		;;
	"Docker" | "Docker Desktop")
		icon_result=":docker:"
		;;
	"Drafts")
		icon_result=":drafts:"
		;;
	"draw.io")
		icon_result=":draw_io:"
		;;
	"Dropbox")
		icon_result=":dropbox:"
		;;
	"Element")
		icon_result=":element:"
		;;
	"Emacs")
		icon_result=":emacs:"
		;;
	"FaceTime" | "FaceTime 通话")
		icon_result=":face_time:"
		;;
	"Finder" | "访达")
		icon_result=":finder:"
		;;
	"Firefox")
		icon_result=":firefox:"
		;;
	"Firefox Developer Edition" | "Firefox Nightly")
		icon_result=":firefox_developer_edition:"
		;;
	"System Preferences" | "System Settings" | "系统设置" | "Réglages Système")
		icon_result=":gear:"
		;;
	"GitHub Desktop")
		icon_result=":git_hub:"
		;;
	"Chromium" | "Google Chrome" | "Google Chrome Canary")
		icon_result=":google_chrome:"
		;;
	"Grammarly Editor")
		icon_result=":grammarly:"
		;;
	"Home Assistant")
		icon_result=":home_assistant:"
		;;
	"Hyper")
		icon_result=":hyper:"
		;;
	"IntelliJ IDEA")
		icon_result=":idea:"
		;;
	"IINA")
		icon_result=":iina:"
		;;
	"iTerm" | "iTerm2")
		icon_result=":iterm:"
		;;
	"Jellyfin Media Player")
		icon_result=":jellyfin:"
		;;
	"KeePassXC")
		icon_result=":kee_pass_x_c:"
		;;
	"Keynote" | "Keynote 讲演")
		icon_result=":keynote:"
		;;
	"LibreWolf")
		icon_result=":libre_wolf:"
		;;
	"LM Studio")
		icon_result=":lm_studio:"
		;;
	"LocalSend")
		icon_result=":localsend:"
		;;
	"Maps" | "Google Maps")
		icon_result=":maps:"
		;;
	"Matlab")
		icon_result=":matlab:"
		;;
	"Mattermost")
		icon_result=":mattermost:"
		;;
	"Messages" | "信息" | "Nachrichten")
		icon_result=":messages:"
		;;
	"Messenger")
		icon_result=":messenger:"
		;;
	"Microsoft Edge")
		icon_result=":microsoft_edge:"
		;;
	"Microsoft Excel")
		icon_result=":microsoft_excel:"
		;;
	"Microsoft Outlook")
		icon_result=":microsoft_outlook:"
		;;
	"Microsoft PowerPoint")
		icon_result=":microsoft_power_point:"
		;;
	"Microsoft Remote Desktop" | "Windows App")
		icon_result=":microsoft_remote_desktop:"
		;;
	"Microsoft Teams" | "Microsoft Teams (work or school)")
		icon_result=":microsoft_teams:"
		;;
	"Microsoft Word")
		icon_result=":microsoft_word:"
		;;
	"MongoDB Compass"*)
		icon_result=":mongodb:"
		;;
	"mpv")
		icon_result=":mpv:"
		;;
	"Mullvad Browser")
		icon_result=":mullvad_browser:"
		;;
	"Music" | "音乐" | "Musique")
		icon_result=":music:"
		;;
	"Neovide" | "neovide")
		icon_result=":neovide:"
		;;
	"Neovim" | "neovim" | "nvim")
		icon_result=":neovim:"
		;;
	"NordVPN")
		icon_result=":nord_vpn:"
		;;
	"Notability")
		icon_result=":notability:"
		;;
	"Notes" | "备忘录")
		icon_result=":notes:"
		;;
	"Notion")
		icon_result=":notion:"
		;;
	"Numbers" | "Numbers 表格")
		icon_result=":numbers:"
		;;
	"Obsidian")
		icon_result=":obsidian:"
		;;
	"OBS")
		icon_result=":obsstudio:"
		;;
	"1Password")
		icon_result=":one_password:"
		;;
	"ChatGPT")
		icon_result=":openai:"
		;;
	"OpenVPN Connect")
		icon_result=":openvpn_connect:"
		;;
	"Pages" | "Pages 文稿")
		icon_result=":pages:"
		;;
	"Parsec")
		icon_result=":parsec:"
		;;
	"Preview" | "预览" | "Skim" | "zathura" | "Aperçu")
		icon_result=":pdf:"
		;;
	"Pi-hole Remote")
		icon_result=":pihole:"
		;;
	"Pine")
		icon_result=":pine:"
		;;
	"Plex")
		icon_result=":plex:"
		;;
	"Plexamp")
		icon_result=":plexamp:"
		;;
	"Podcasts" | "播客")
		icon_result=":podcasts:"
		;;
	"Postman")
		icon_result=":postman:"
		;;
	"Proton Mail" | "Proton Mail Bridge")
		icon_result=":proton_mail:"
		;;
	"PyCharm")
		icon_result=":pycharm:"
		;;
	"Raindrop.io")
		icon_result=":raindrop_io:"
		;;
	"Reeder")
		icon_result=":reeder5:"
		;;
	"Reminders" | "提醒事项" | "Rappels")
		icon_result=":reminders:"
		;;
	"Safari" | "Safari浏览器" | "Safari Technology Preview")
		icon_result=":safari:"
		;;
	"Setapp")
		icon_result=":setapp:"
		;;
	"SF Symbols")
		icon_result=":sf_symbols:"
		;;
	"Signal")
		icon_result=":signal:"
		;;
	"Sketch")
		icon_result=":sketch:"
		;;
	"Slack")
		icon_result=":slack:"
		;;
	"Spotify")
		icon_result=":spotify:"
		;;
	"Spotlight")
		icon_result=":spotlight:"
		;;
	"Sublime Text")
		icon_result=":sublime_text:"
		;;
	"superProductivity")
		icon_result=":superproductivity:"
		;;
	"Telegram")
		icon_result=":telegram:"
		;;
	"Terminal" | "终端")
		icon_result=":terminal:"
		;;
	"Thunderbird")
		icon_result=":thunderbird:"
		;;
	"Todoist")
		icon_result=":todoist:"
		;;
	"Toggl Track")
		icon_result=":toggl_track:"
		;;
	"Tor Browser")
		icon_result=":tor_browser:"
		;;
	"Tower")
		icon_result=":tower:"
		;;
	"Transmit")
		icon_result=":transmit:"
		;;
	"Trello")
		icon_result=":trello:"
		;;
	"UTM")
		icon_result=":utm:"
		;;
	"MacVim" | "Vim" | "VimR")
		icon_result=":vim:"
		;;
	"Vivaldi")
		icon_result=":vivaldi:"
		;;
	"VLC")
		icon_result=":vlc:"
		;;
	"VSCodium")
		icon_result=":vscodium:"
		;;
	"Warp")
		icon_result=":warp:"
		;;
	"WezTerm")
		icon_result=":wezterm:"
		;;
	"WhatsApp" | "‎WhatsApp")
		icon_result=":whats_app:"
		;;
	"Xcode")
		icon_result=":xcode:"
		;;
	"Zed")
		icon_result=":zed:"
		;;
	"Zen Browser")
		icon_result=":zen_browser:"
		;;
	"Zeplin")
		icon_result=":zeplin:"
		;;
	"zoom.us")
		icon_result=":zoom:"
		;;
	*)
		icon_result=":default:"
		;;
	esac
}
### END-OF-ICON-MAP

icon_map "$1"

echo "$icon_result"
