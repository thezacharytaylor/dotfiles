-- Rose Pine Dawn colors
local carbonfox = {
  black = 0xff282828,
  white = 0xffdfdfe0,
  red = 0xffee5396, -- pink ff7eb6
  green = 0xff25be6a,
  blue = 0xff78a9ff,
  yellow = 0xff08bdba,
  orange = 0xff3ddbd9,
  magenta = 0xffbe95ff,
  grey = 0xff928374,
  transparent = 0x00000000,

  bar = {
    bg = 0xff161616,
    border = 0xfff2f4f8,
  },
  popup = {
    bg = 0xff161616,
    border = 0xfff2f4f8,
  },
  bg1 = 0xff161616,
  bg2 = 0xff161616,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then
      return color
    end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}

local rose_pine = {
  black = 0xff191724,
  white = 0xffe0def4,
  red = 0xffeb6f92,
  green = 0xff56949f,
  blue = 0xff9ccfd8,
  yellow = 0xfff6c177,
  orange = 0xffebbcba,
  magenta = 0xffc4a7e7,
  grey = 0xff9893a5,
  transparent = 0x00000000,

  bar = {
    bg = 0xff191724,
    border = 0xff524f67,
  },
  popup = {
    bg = 0xff26233a,
    border = 0xff524f67,
  },
  bg1 = 0xff191724,
  bg2 = 0xff1f1d2e,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then
      return color
    end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}

local rose_pine_dawn = {
  black = 0xfff4ede8,
  white = 0xff575279,
  red = 0xffb4637a,
  green = 0xff56949f,
  blue = 0xff286983,
  yellow = 0xffea9d34,
  orange = 0xffd7827e,
  magenta = 0xff907aa9,
  grey = 0xff9893a5,
  transparent = 0x00000000,

  bar = {
    bg = 0xfffaf4ed,
    border = 0xffd7827e,
  },
  popup = {
    bg = 0xfff2e9e1,
    border = 0xffd7827e,
  },
  bg1 = 0xfffffaf3,
  bg2 = 0xfff4ede8,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then
      return color
    end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}

return rose_pine
