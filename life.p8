pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
prev = {}
next = {}

neig = {
  {-1, -1}, {0, -1}, {1, -1},
  {-1,  0},          {1,  0},
  {-1,  1}, {0,  1}, {1,  1}
}

function _init()
  for p = 0, 128*128-1 do
    prev[p] = rnd() > 0.5
  end
end

function _update()
  for p = 0, 128*128-1 do
    local alive = 0

    for n = 1, #neig do
      local x = (p%128 + neig[n][1])%128
      local y = (flr(p/128) + neig[n][2])%128
      if prev[x+y*128] then
        alive += 1
      end
    end

    if 2 == alive then
      next[p] = prev[p]
    elseif 3 == alive then
      next[p] = true
    else
      next[p] = false
    end
  end

  for p = 0, 128*128-1 do
    prev[p] = next[p]
  end
end

function _draw()
  cls()

  for p = 0, 128*128-1 do
    if prev[p] then
      pset(p%128, flr(p/128), 1)
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