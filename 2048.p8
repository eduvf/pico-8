pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
function _init()
  game = {
    { 0, 0, 0, 0 },
    { 0, 0, 0, 0 },
    { 0, 0, 0, 0 },
    { 0, 0, 0, 0 }
  }
end

function step()
  local x = flr(rnd(4)) + 1
  local y = flr(rnd(4)) + 1
  game[y][x] = rnd({2, 4})
end

function _update()
  if btnp(4) then
    step()
  end
end

function _draw()
  cls()
  for y = 1, 4 do
    for x = 1, 4 do
      print(game[y][x], 32*(x-1), 32*(y-1), 7)
    end
  end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000