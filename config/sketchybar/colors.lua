return {
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
