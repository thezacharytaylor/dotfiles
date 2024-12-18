-- Carbonfox colors
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

-- Catppuccin Macchiato colors
local catppuccin_macchiato = {
  black = 0xff24273a,
  white = 0xffcad3f5,
  red = 0xffed8796,
  green = 0xffa5da95,
  blue = 0xff8aadf4,
  yellow = 0xffeed49f,
  orange = 0xfff5a97e,
  magenta = 0xffb7bdf8,
  grey = 0xff6e738d,
  transparent = 0x00000000,

  bar = {
    bg = 0xff24273A,
    border = 0xff6e038d,
  },
  popup = {
    bg = 0xff1d2030,
    border = 0xffffb7bdf8,
  },
  bg1 = 0xff24273a,
  bg2 = 0xff171825,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then
      return color
    end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}

-- Catppuccin Mocha colors
local catppuccin_mocha = {
  black = 0xff1e1e2e,
  white = 0xffcdd6f4,
  red = 0xfff38ba8,
  green = 0xffa6e3a1,
  blue = 0xff89dceb,
  yellow = 0xfff9e2af,
  orange = 0xfffab387,
  magenta = 0xffb4befe,
  grey = 0xff6c7086,
  transparent = 0x00000000,

  bar = {
    bg = 0xff1e1e2e,
    border = 0xff6c7086,
  },
  popup = {
    bg = 0xff181825,
    border = 0xffb4befe,
  },
  bg1 = 0xff1e1e2e,
  bg2 = 0xff181825,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then
      return color
    end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}

-- Rose pine colors
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

-- Rose pine dawn colors
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

local hang_in_there = {
  black = 0xfff8edf7,
  white = 0xffb99bd4,
  red = 0xfff7bfd5,
  green = 0xffb8e6c3,
  blue = 0xffd9f2f5,
  yellow = 0xfffbf9ab,
  orange = 0xfffaba8b,
  magenta = 0xffd7c6e6,
  grey = 0xffbfbddd,
  transparent = 0x00000000,

  bar = {
    bg = 0xfffaf4ed,
    border = 0xfffaba8b,
  },
  popup = {
    bg = 0xfff2e9e1,
    border = 0xfffafba8b,
  },
  bg1 = 0xfffffaf3,
  bg2 = 0xfff8edf7,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then
      return color
    end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}

local pokemon_ghost = {
  black = 0xff463A5A,
  white = 0xffF7F5F7,
  red = 0xffFF857F,
  green = 0xffC2FFDF,
  blue = 0xff1BC5E0,
  yellow = 0xffFFF352,
  orange = 0xffFFB8D1,
  magenta = 0xffCEB1FF,
  grey = 0xffbfbddd,
  transparent = 0x00000000,

  bar = {
    bg = 0xff625778,
    border = 0xff807F8A,
  },
  popup = {
    bg = 0xff8b7292,
    border = 0xff807f8a,
  },
  bg1 = 0xff8b7292,
  bg2 = 0xff625778,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then
      return color
    end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}

return catppuccin_mocha
