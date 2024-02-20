pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
function _init()
  t = 0
  p = {
    x = 2,
    y = 2,
    off_x = 0,
    off_y = 0,
    next_x = 0,
    next_y = 0,
    flip = false
  }
  cam = {
    x = p.x - 7,
    y = p.y - 7,
    off_x = 0,
    off_y = 0,
  }
  msg = nil
end

function _update()
  if btnp(0) then p.next_x = -1 end
  if btnp(1) then p.next_x =  1 end
  if btnp(2) then p.next_y = -1 end
  if btnp(3) then p.next_y =  1 end

  if p.next_x < 0 then
    p.flip = true
  elseif p.next_x > 0 then
    p.flip = false
  end

  local next_tile = mget(p.x+p.next_x, p.y+p.next_y)
  if fget(next_tile, 0) then
    p.off_x += p.next_x * 4
    p.off_y += p.next_y * 4
    p.next_x, p.next_y = 0, 0
  end
  if fget(next_tile, 1) then
    msg = "oH, HI! hOW ARE YOU?"
  end

  update_camera()

  p.off_x += p.next_x * -8
  p.off_y += p.next_y * -8
  p.off_x *= 0.8
  p.off_y *= 0.8

  p.x += p.next_x
  p.y += p.next_y
  p.next_x, p.next_y = 0, 0

  t += 1
end

function _draw()
  cls()
  camera(cam.x * 8 + cam.off_x, cam.y * 8 + cam.off_y)
  map(0, 0, 0, 0, 64, 64)
  local s = 1 + flr(t / 12) % 2
  local x = p.x * 8 + p.off_x
  local y = p.y * 8 + p.off_y
  spr(s, x, y, 1, 1, p.flip)

  if msg != nil then
    print(msg)
  end
end

function update_camera()
  cam.off_x += p.next_x * -8
  cam.off_y += p.next_y * -8
  cam.off_x *= 0.9
  cam.off_y *= 0.9

  cam.x += p.next_x
  cam.y += p.next_y
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000000cc00000c770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000c7700000c110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000c1100000c117000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000c711000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
22202220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
202220200ddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000d111d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
222022200ddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20222020000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000001030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1020202020202020202020202020201000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1020202020202020202020202020201000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1020202020202020202020202020201000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1020202020202020202020202020201000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1020202020202020202020202020201000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1020202020202020112020202020201010101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1020202020202020202020202020202020202020202020202020202020202020100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1020202020202020202020202020202020202020202020202020202020202020100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1020202020202020202020202020202020202020202020202020202020202020100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1020202020202020202020202020202020202020202020202020202020202020100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1020202020202020202020202020202020202020202020202020202020202020100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1020202020202020202020202020202020202020202020202020202020202020100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1020202020202020202020202020202020202020202020202020202020202020100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1020202020202020202020202020202020202020202020202020202020202020100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101010101010202020202020202020202020202020202020202020202020100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000010202020202020202020112020202020202020202020202020100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000010202020202020202020202020202020202020202020202020100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000010102020202020202020202020202020202020202020202020100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000102020202020202020202020202020202020202020202020100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000102020202020202020201010101010101010202020202020100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000101020202020202020201000000000000010202020202020100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000001020202020202020201000000000000010202020202020100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000001010101010101020201000000000000010202020202020100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000001010101000000000000010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
