from functools import lru_cache
from pathlib import Path
import os

from kitty.fast_data_types import Screen
from kitty.tab_bar import (DrawData,
                         TabBarData,
                         ExtraData,
                         TabAccessor,
                         draw_tab_with_powerline,
                         )

# -----------------------------------------------------------------------------
# TOKYO NIGHT COLOR PALETTES (Storm)
# -----------------------------------------------------------------------------

# Palette for INACTIVE tabs (Darker / muted)
RAINBOW_INACTIVE = [
    "#7f3f4a",  # Dark Red
    "#7f5730",  # Dark Orange
    "#7f6540",  # Dark Yellow
    "#4f6a3a",  # Dark Green
    "#3a6a7f",  # Dark Cyan
    "#5a4f7f",  # Dark Purple
    "#5f5f7f",  # Muted Foreground
]

# Palette for ACTIVE tabs (Bright Accent -> Contrast Text)
RAINBOW_ACTIVE = [
    "#ff6188",  # Brighter Red
    "#fc9867",  # Brighter Orange
    "#ffd866",  # Brighter Yellow
    "#a9dc76",  # Brighter Green
    "#78dce8",  # Brighter Cyan
    "#ab9df2",  # Brighter Purple
    "#ffffff",  # Bright Foreground
]

_home = os.path.expanduser("~")

@lru_cache(maxsize=32)
def get_short_path(cwd: str) -> tuple[str, ...]:
  global _home
  if cwd.startswith(_home):
      cwd = "~" + cwd[len(_home):]
  if cwd.startswith("~/projects"):
      cwd = "~/p" + cwd[10:]

  parts = cwd.strip("/").split("/")

  if len(parts) > 3:
      return tuple([".."] + parts[-3:])

  return tuple(parts)

@lru_cache(maxsize=128)
def colorize_path(parts: tuple[str, ...], tab_index: int, is_active: bool) -> str:
  colored_parts = []

  # Select the appropriate palette
  if is_active:
      palette = RAINBOW_ACTIVE
  else:
      palette = RAINBOW_INACTIVE

  for i, part in enumerate(parts):
      color_idx = (tab_index + i) % len(palette)
      color_hex = palette[color_idx]
      kitty_color = f"_{color_hex.lstrip('#')}"
      colored_parts.append(f"{{fmt.fg.{kitty_color}}}{part}")
  sep = "{fmt.fg.tab}/"
  return sep.join(colored_parts) + "{fmt.fg.tab}"

@lru_cache(maxsize=1)
def load_icons():
  """Load icons from nerd-font-icons.yml file (Cached)"""
  icons = {}
  config_path = Path.home() / ".dotfiles/kitty/nerd-font-icons.yml"
  if not config_path.exists():
      return {}
  try:
      with open(config_path, 'r', encoding='utf-8') as f:
          in_icons_section = False
          for line in f:
              stripped = line.strip()

              if stripped == 'icons:':
                  in_icons_section = True
                  continue

              if in_icons_section and stripped and not line.startswith(' ') and ':' in stripped:
                  break

              if in_icons_section and ':' in stripped:
                  parts = stripped.split(':', 1)
                  if len(parts) == 2:
                      key = parts[0].strip().strip('"\'')
                      value = parts[1].strip().strip('"\'')
                      if key and value:
                          icons[key] = value
      return icons

  except Exception:
      return {}

def draw_tab(
  draw_data: DrawData, screen: Screen, tab: TabBarData,
  before: int, max_title_length: int, index: int, is_last: bool,
  extra_data: ExtraData,
) -> int:
  ta = TabAccessor(tab.tab_id)

  path_tuple = get_short_path(ta.active_wd)
  pwd = colorize_path(path_tuple, index, tab.is_active)

  icons = load_icons()
  icon = icons.get(ta.active_exe, ta.active_exe)

  new_draw_data = draw_data._replace(
      title_template="{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}"
      + str(index) + " "
      + pwd + " "
      + icon
  )
  return draw_tab_with_powerline(
      new_draw_data, screen, tab,
      before, max_title_length, index, is_last,
      extra_data)
