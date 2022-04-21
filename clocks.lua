-- settings
-- possible values of THEME
-- nord light        nord dark
-- classic light     classic dark
-- gruvbox light     gruvbox dark
theme = "nord light"

-- waiting time before starting conky
-- this prevents issues when conky is launched at startup
time_before_start = 5 -- secondes

-- EDIT THIS to match your network interface.
-- You can find out by executing `ifconfig` or `ip link`.
-- It might be "wlan0", "eth0", "wlp3s0" or something else
net_interface = "enp2s0f1"

-- Your internet speed in Mb
download_rate_maximum = 100
upload_rate_maximum = 100

-- Default font used by the convinient functions like write() and write_bold()
-- You can use _write() to choose another font
main_font = "Roboto"

-- Show the seconds hand ?
show_seconds = true

-------------------------------------------

if theme == "nord light" then
    color0 = 0xd8dee9
    color1 = 0x8fbcbb
    color2 = 0x5e81ac
    color3 = 0xbf616a
    color4 = 0xa3be8c
    bg_alpha = 0.1
    fg_alpha = 0.6

elseif theme == "nord dark" then
    color0 = 0x2e3440
    color1 = 0x8fbcbb
    color2 = 0x5e81ac
    color3 = 0xbf616a
    color4 = 0xa3be8c
    bg_alpha = 0.3
    fg_alpha = 0.9

elseif theme == "classic light" then
    color0 = 0xffffff
    color1 = 0x607d8b
    color2 = 0x3f51b5
    color3 = 0xe53935
    color4 = 0x00796b
    bg_alpha = 0.1
    fg_alpha = 0.6

elseif theme == "classic dark" then
    color0 = 0x000000
    color1 = 0x607d8b
    color2 = 0x3f51b5
    color3 = 0xe53935
    color4 = 0x00796b
    bg_alpha = 0.3
    fg_alpha = 0.9

elseif theme == "gruvbox light" then
    color0 = 0xfbf1c7 -- bg color
    color1 = 0x689d6a -- aqua
    color2 = 0x458588 -- blue
    color3 = 0xcc241d -- red
    color4 = 0x98971a -- green
    bg_alpha = 0.3
    fg_alpha = 0.9

elseif theme == "gruvbox dark" then
    color0 = 0x282828 -- bg color
    color1 = 0x689d6a -- light-blue
    color2 = 0x458588 -- blue
    color3 = 0xcc241d -- red
    color4 = 0x98971a -- green
    bg_alpha = 0.3
    fg_alpha = 0.9

else
    color0 = nil
    color1 = nil
    color2 = nil
    color3 = nil
    color4 = nil
    bg_alpha = nil
    fg_alpha = nil
end

-------------------------------------------

require 'cairo'
-- require "imlib2"

-------------------------------------------

settings_table = {{
    name = 'time',
    arg = '%S',
    max = 60,
    bg_colour = color0,
    bg_alpha = bg_alpha,
    fg_colour = color0, -- defualt 0x0778ec
    fg_alpha = fg_alpha,
    x = 160,
    y = 82,
    radius = 55,
    thickness = 3,
    start_angle = 0,
    end_angle = 360
}, {
    name = 'time',
    arg = '%M.%S',
    max = 60,
    bg_colour = color0,
    bg_alpha = bg_alpha,
    fg_colour = color0, -- defualt 0x0778ec
    fg_alpha = fg_alpha,
    x = 160,
    y = 82,
    radius = 44,
    thickness = 10,
    start_angle = 0,
    end_angle = 360
}, {
    name = 'time',
    arg = '%I.%M',
    max = 12,
    bg_colour = color0,
    bg_alpha = bg_alpha,
    fg_colour = color0, -- defualt 0x0778ec
    fg_alpha = fg_alpha,
    x = 160,
    y = 82,
    radius = 34,
    thickness = 3,
    start_angle = 0,
    end_angle = 360
}, {
    name = 'downspeedf',
    arg = net_interface,
    max = (download_rate_maximum * 1000 / 8),
    bg_colour = color0,
    bg_alpha = bg_alpha,
    fg_colour = color0,
    fg_alpha = fg_alpha,
    x = 104,
    y = 238,
    radius = 60,
    thickness = 3,
    start_angle = 0,
    end_angle = 360
}, {
    name = 'upspeedf',
    arg = net_interface,
    max = (upload_rate_maximum * 1000 / 8),
    bg_colour = color0,
    bg_alpha = bg_alpha,
    fg_colour = color0,
    fg_alpha = fg_alpha,
    x = 104,
    y = 238,
    radius = 50,
    thickness = 10,
    start_angle = 0,
    end_angle = 360
}, {
    name = 'cpu',
    arg = 'cpu0',
    max = 100,
    bg_colour = color0,
    bg_alpha = bg_alpha,
    fg_colour = color1,
    fg_alpha = fg_alpha,
    x = 155,
    y = 420,
    radius = 70,
    thickness = 10,
    start_angle = 140,
    end_angle = 450
}, {
    name = 'cpu',
    arg = 'cpu1',
    max = 100,
    bg_colour = color0,
    bg_alpha = bg_alpha,
    fg_colour = color2,
    fg_alpha = fg_alpha,
    x = 155,
    y = 420,
    radius = 60,
    thickness = 9,
    start_angle = 140,
    end_angle = 450
}, {
    name = 'cpu',
    arg = 'cpu2',
    max = 100,
    bg_colour = color0,
    bg_alpha = bg_alpha,
    fg_colour = color4,
    fg_alpha = fg_alpha,
    x = 155,
    y = 420,
    radius = 50,
    thickness = 9,
    start_angle = 140,
    end_angle = 450
}, {
    name = 'cpu',
    arg = 'cpu3',
    max = 100,
    bg_colour = color0,
    bg_alpha = bg_alpha,
    fg_colour = color3,
    fg_alpha = fg_alpha,
    x = 155,
    y = 420,
    radius = 40,
    thickness = 9,
    start_angle = 140,
    end_angle = 450
}, {
    name = 'fs_used_perc',
    arg = '/',
    max = 100,
    bg_colour = color0,
    bg_alpha = bg_alpha,
    fg_colour = color0,
    fg_alpha = fg_alpha,
    x = 285,
    y = 590,
    radius = 55,
    thickness = 18,
    start_angle = 0,
    end_angle = 270
}, {
    name = 'memperc',
    arg = '/',
    max = 100,
    bg_colour = color0,
    bg_alpha = bg_alpha,
    fg_colour = color0,
    fg_alpha = fg_alpha,
    x = 285,
    y = 590,
    radius = 70,
    thickness = 7,
    start_angle = 0,
    end_angle = 270
}}

-------------------------------------------

-- set line colour

line_colour = color0
line_alpha = fg_alpha

-- Use these settings to define the origin and extent of your clock.
clock_r = 50

-- Coordinates of the centre of the clock, in pixels, from the top left of the Conky window.
clock_x = 160
clock_y = 82

-- Colour & alpha of the clock hands
clock_colour = color3
clock_alpha = fg_alpha

-------------------------------------------

-- convinience function
function parse(str)
    return conky_parse(string.format("${%s}", str))
end

function rgb_to_r_g_b(colour, alpha)
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

-- Variable definitions to avoir repeating the same string concatenations
local _download_speed = "downspeed " .. net_interface
local _download_speed_kb = "downspeedf " .. net_interface
local _download_total = "totaldown " .. net_interface
local _upload_speed = "upspeed " .. net_interface
local _upload_speed_kb = "upspeedf " .. net_interface
local _upload_total = "totalup " .. net_interface
local _ssid = "wireless_essid " .. net_interface
local _wifi_signal = "wireless_link_qual_perc " .. net_interface
local _local_ip = "addr " .. net_interface

-- functions to fetch some important system info
-- for other variables, see: <http://conky.sourceforge.net/variables.html>
function updates()
    return parse("updates")
end
function kernel()
    return parse("kernel")
end --  ex: 5.10.32-1-lts
function system_name()
    return parse("sysname")
end --  ex: Linux
function arch()
    return parse("machine")
end --  ex: x86_64
function desktops()
    return parse("desktop_number")
end --  total number of desktops
function desktop()
    return parse("desktop")
end --  ex: 3 (current desktop)
function desktop_name()
    return parse("desktop_name")
end --  ex: Desktop 3
function username()
    return parse("user_names")
end
function running_threads()
    return parse("running_threads")
end
function memory()
    return parse("mem")
end
function memory_percent()
    return parse("memperc")
end
function memory_max()
    return parse("memmax")
end
function memory_cached()
    return parse("cached")
end
function memory_buffers()
    return parse("buffers")
end
function swap()
    return parse("swap")
end
function swap_max()
    return parse("swapmax")
end
function swap_percent()
    return parse("swapperc")
end
function download_speed()
    return parse(_download_speed)
end --  ex: 930B or 3kb
function download_speed_kb()
    return parse(_download_speed_kb)
end --  ex: 0.9  or 3.0
function download_total()
    return parse(_download_total)
end
function upload_speed()
    return parse(_upload_speed)
end --  ex: 930B or 3kb
function upload_speed_kb()
    return parse(_upload_speed_kb)
end --  ex: 0.9  or 3.0
function upload_total()
    return parse(_upload_total)
end
function ssid()
    return parse(_ssid)
end
function wifi_signal()
    return parse(_wifi_signal)
end --  value in %
function local_ip()
    return parse(_local_ip)
end
function uptime()
    return parse("uptime")
end --  ex: 2d 13h 40m
function uptime_short()
    return parse("uptime_short")
end --  ex: 2d 13h
function time_hrmin()
    return parse("time %R")
end --  ex: 15:40
function time_hrminsec()
    return parse("time %T")
end --  ex: 15:30:25
function time_hr12minsec()
    return parse("time %R")
end --  ex: 03:30:25 PM
function time_hour24()
    return parse("time %H")
end --  ex: 15
function time_hour12()
    return parse("time %I")
end --  ex: 3
function time_minute()
    return parse("time %M")
end --  ex: 30
function time_second()
    return parse("time %S")
end --  ex: 25
function time_am_pm_upper()
    return parse("time %p")
end --  ex: PM
function time_am_pm_lower()
    return parse("time %P")
end --  ex: pm
function time_day()
    return parse("time %A")
end --  ex: saturday
function time_day_short()
    return parse("time %a")
end --  ex: sat
function time_day_number()
    return parse("time %d")
end --  ex: 1
function time_month()
    return parse("time %H")
end --  ex: january
function time_month_short()
    return parse("time %h")
end --  ex: jan
function time_month_number()
    return parse("time %m")
end --  ex: 1
function time_year()
    return parse("time %Y")
end --  ex: 2021
function time_year_short()
    return parse("time %y")
end --  ex: 21
function utime()
    return parse("utime")
end --  UCT time --  ex: 2021-05-29 17:31:01
function diskio(device)
    return parse("diskio " .. device)
end --  device ex: /dev/sda
function diskio_read(device)
    return parse("diskio_read " .. device)
end
function diskio_write(device)
    return parse("diskio_write " .. device)
end
function cpu_temperature()
    return parse("acpitemp")
end --  temperature in C°
function cpu_percent(n)
    if n == nil or n == "" then
        return parse("cpu")
    end
    if n > 0 and n <= 8 then
        return parse("cpu cpu" .. n)
    else
        return nil
    end
end
function fs_used(fs)
    if fs == nil then
        return nil
    else
        return parse("fs_used " .. fs)
    end
end
function fs_used_perc(fs)
    if fs == nil then
        return nil
    else
        return parse("fs_used_perc " .. fs)
    end
end
function fs_size(fs)
    if fs == nil then
        return nil
    else
        return parse("fs_size " .. fs)
    end
end
function fs_free_perc(fs)
    if fs == nil then
        return nil
    else
        return parse("fs_free_perc " .. fs)
    end
end
function fs_free(fs)
    if fs == nil then
        return nil
    else
        return parse("fs_free " .. fs)
    end
end
function fetch_public_ip()
    local po = io.popen("wget http://ipinfo.io/ip -qO -")
    -- local po = io.popen("curl -s ifconfig.me/ip")
    -- local po = io.popen("curl -s ident.me")
    -- local po = io.popen("curl -s api.ipify.org")
    local content = po:read("*a")
    if content == nil or content == "" or string.len(content) > 15 then
        return "None"
    else
        return content
    end
end

-------------------------------------------

function draw_ring(cr, t, pt)
    local w, h = conky_window.width, conky_window.height

    local xc, yc, ring_r, ring_w, sa, ea = pt['x'], pt['y'], pt['radius'], pt['thickness'], pt['start_angle'],
        pt['end_angle']
    local bgc, bga, fgc, fga = pt['bg_colour'], pt['bg_alpha'], pt['fg_colour'], pt['fg_alpha']

    local angle_0 = sa * (2 * math.pi / 360) - math.pi / 2
    local angle_f = ea * (2 * math.pi / 360) - math.pi / 2
    local t_arc = t * (angle_f - angle_0)

    -- Draw background ring
    cairo_arc(cr, xc, yc, ring_r, angle_0, angle_f)
    cairo_set_source_rgba(cr, rgb_to_r_g_b(bgc, bga))
    cairo_set_line_width(cr, ring_w)
    cairo_stroke(cr)

    -- Draw indicator ring
    cairo_arc(cr, xc, yc, ring_r, angle_0, angle_0 + t_arc)
    cairo_set_source_rgba(cr, rgb_to_r_g_b(fgc, fga))
    cairo_stroke(cr)
end

function draw_clock_hands(cr, xc, yc)
    local secs, mins, hours, secs_arc, mins_arc, hours_arc
    local xh, yh, xm, ym, xs, ys

    secs = os.date("%S")
    mins = os.date("%M")
    hours = os.date("%I")

    secs_arc = (2 * math.pi / 60) * secs
    mins_arc = (2 * math.pi / 60) * mins + secs_arc / 60
    hours_arc = (2 * math.pi / 12) * hours + mins_arc / 12

    -- Draw hour hand
    xh = xc + 0.65 * clock_r * math.sin(hours_arc)
    yh = yc - 0.65 * clock_r * math.cos(hours_arc)
    cairo_move_to(cr, xc, yc)
    cairo_line_to(cr, xh, yh)
    --
    cairo_set_line_cap(cr, CAIRO_LINE_CAP_ROUND)
    cairo_set_line_width(cr, 5)
    cairo_set_source_rgba(cr, rgb_to_r_g_b(clock_colour, clock_alpha))
    cairo_stroke(cr)

    -- Draw minute hand
    xm = xc + 0.95 * clock_r * math.sin(mins_arc)
    ym = yc - 0.95 * clock_r * math.cos(mins_arc)
    cairo_move_to(cr, xc, yc)
    cairo_line_to(cr, xm, ym)
    --
    cairo_set_line_width(cr, 3)
    cairo_stroke(cr)

    -- Draw seconds hand
    if show_seconds then
        xs = xc + 1.1 * clock_r * math.sin(secs_arc)
        ys = yc - 1.1 * clock_r * math.cos(secs_arc)
        cairo_move_to(cr, xc, yc)
        cairo_line_to(cr, xs, ys)

        cairo_set_line_width(cr, 1)
        cairo_stroke(cr)
    end
end

function DrawLine(cr, start_x, start_y, end_x, end_y, linewidth)
    -- set colour (r,g,b,alpha)
    cairo_set_source_rgba(cr, rgb_to_r_g_b(line_colour, line_alpha))
    cairo_move_to(cr, conky_window.width - start_x, start_y)
    cairo_rel_line_to(cr, -end_x, end_y)
    cairo_set_line_width(cr, linewidth)
    cairo_stroke(cr)

end

function DrawBars(cr, start_x, start_y, bar_width, bar_height, corenum, r, g, b, alpha)
    -- set colour (r,g,b,alpha)
    cairo_set_source_rgba(cr, rgb_to_r_g_b(color0, bg_alpha))
    cairo_rectangle(cr, start_x, start_y, bar_width, -bar_height)
    cairo_fill(cr)
    cairo_set_source_rgba(cr, r, g, b, alpha)

    local file = io.popen("sensors -u | awk '/temp1_input:/ {print $2; exit}'")
    local value = tonumber(file:read('*a'))
    max_value = 100
    scale = bar_height / max_value
    indicator_height = scale * value
    cairo_rectangle(cr, start_x, start_y, bar_width, -indicator_height)
    cairo_fill(cr)
    file:close()
end

function write(cr, x, y, text, font_size, color, alpha)
    _write_(cr, x, y, text, main_font, font_size, color, alpha, CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL)
end

function write_bold(cr, x, y, text, font_size, color, alpha)
    -- convinience function to write in bold font
    _write_(cr, x, y, text, main_font, font_size, color, alpha, CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_BOLD)
end

function _write_(cr, x, y, text, font_name, font_size, color, alpha, font_slant, font_face)
    cairo_select_font_face(cr, font_name, font_slant, font_face);
    cairo_set_font_size(cr, font_size)
    cairo_set_source_rgba(cr, color_convert(color, alpha))
    cairo_move_to(cr, x, y)
    cairo_show_text(cr, text)
    cairo_stroke(cr)
end

function color_convert(colour, alpha)
    -- input hexadecimal color code, returns its corresponding RGB+Alpha representation
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function WriteText(cr)
    local s = time_second()
    local m = time_minute()
    local h = time_hour24()
    local date = string.format("%s, %s", time_month_short(), time_year())

    write(cr, 245, 66, "" .. h .. ":" .. m .. "", 27, color0, fg_alpha)
    write(cr, 335, 66, "" .. uptime(), 11, color0, fg_alpha)
    write(cr, 243, 100, date, 17, color3, fg_alpha)

    local memperc = memory_percent()
    local usedmem = string.format("%s / %s", memory(), memory_max())

    local rt = fs_used_perc("/")
    local rt_text = string.format("%s / %s", fs_used("/"), fs_size("/"))

    local downspeed = download_speed()
    local upspeed = upload_speed()

    write(cr, 87, 240, "Net", 18, color0, fg_alpha)
    write(cr, 193, 217, "Dw", 23, color0, fg_alpha)
    write(cr, 260, 217, "" .. downspeed .. "", 23, color3, fg_alpha)
    write(cr, 193, 255, "Up", 23, color0, fg_alpha)
    write(cr, 260, 255, "" .. upspeed .. "", 23, color3, fg_alpha)

    local downtotal = download_total()
    local uptotal = upload_total()

    write(cr, 193, 287, "TDown", 16, color0, fg_alpha)
    -- write(cr, 200, 270, "⬇️", 18, color0)
    -- write(cr, 200, 290, "⬆️", 18, color0)
    write(cr, 260, 287, "" .. downtotal .. "", 16, color4, fg_alpha)
    -- write(cr, 230, 290, "" .. uptotal .. "", 18, color0)

    write(cr, 137, 427, "CPU", 18, color0, fg_alpha)
    write(cr, 249, 484, "Core 0", 10, color0, fg_alpha)
    write(cr, 289, 484, "Core 1", 10.5, color0, fg_alpha)
    write(cr, 329, 484, "Core 2", 10.5, color0, fg_alpha)
    write(cr, 369, 484, "Core 3", 10.5, color0, fg_alpha)

    write(cr, 121, 534, "" .. rt_text .. "", 14.5, color0, fg_alpha)
    write(cr, 121, 552, "" .. usedmem .. "", 14.5, color0, fg_alpha)
    write(cr, 216, 570, "[" .. memperc .. "%]", 14.5, color3, fg_alpha)
    write(cr, 263, 594, "MEM", 18, color0, fg_alpha)
    write(cr, 263, 594, "MEM", 18, color0, fg_alpha)
end

function conky_clock_rings()
    local function setup_rings(cr, pt)
        local str = ''
        local value = 0

        str = string.format('${%s %s}', pt['name'], pt['arg'])
        str = conky_parse(str)

        value = tonumber(str)
        if value == nil then
            value = 0
        end

        if pt['arg'] == "%I.%M" then
            value = os.date("%I") + os.date("%M") / 60
            if value > 12 then
                value = value - 12
            end
        end

        if pt['arg'] == "%M.%S" then
            value = os.date("%M") + os.date("%S") / 60
        end

        pct = value / pt['max']
        draw_ring(cr, pct, pt)
    end

    -- Check that Conky has been running for at least 5s
    if conky_window == nil then
        return
    end

    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual,
        conky_window.width, conky_window.height)

    local cr = cairo_create(cs)

    local updates = conky_parse('${updates}')
    update_num = tonumber(updates)

    WriteText(cr)

    if update_num > 5 then
        for i in pairs(settings_table) do
            setup_rings(cr, settings_table[i])
        end
    end

    download_speed()

    -- parse in arguments as so (cr,startx postion,starty postion, how much to move x, how much to move y)
    DrawLine(cr, 0, 0, 343, 0, 8)
    DrawLine(cr, 343, 0, 0, 25, 4)
    DrawLine(cr, 100, 75, 170, 0, 4)

    -- draw network lines
    DrawLine(cr, 398, 155, 0, 23, 4)
    DrawLine(cr, 0, 155, 400, 0, 4)
    -- draw cpu temp bars
    DrawBars(cr, 250, 470, 30, 100, 0, rgb_to_r_g_b(color1, fg_alpha))
    DrawBars(cr, 290, 470, 30, 100, 1, rgb_to_r_g_b(color2, fg_alpha))
    DrawBars(cr, 330, 470, 30, 100, 2, rgb_to_r_g_b(color4, fg_alpha))
    DrawBars(cr, 370, 470, 30, 100, 3, rgb_to_r_g_b(color3, fg_alpha))
    -- draw cpu temp lines
    DrawLine(cr, 0, 320, 348, 0, 4)
    DrawLine(cr, 348, 318, 0, 26, 4)
    -- draw mem lines
    DrawLine(cr, 0, 585, 144, 0, 4)

    draw_clock_hands(cr, clock_x, clock_y)
end
