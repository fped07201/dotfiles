#!/bin/sh

INSIDE='#1a1b26dd'
BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#c0caf5aa'
TEXT='#7aa2f7ff'
WRONG='#f7768ebb'
VERIFYING='#9d7cd8cc'

i3lock-color \
--insidever-color=$CLEAR      \
--ringver-color=$VERIFYING    \
\
--insidewrong-color=$CLEAR    \
--ringwrong-color=$WRONG      \
\
--inside-color=$INSIDE        \
--ring-color=$TEXT            \
--line-color=$BLANK           \
--separator-color=$DEFAULT    \
\
--verif-color=$VERIFYING      \
--wrong-color=$WRONG          \
--time-color=$TEXT            \
--date-color=$TEXT         \
--layout-color=$DEFAULT       \
--keyhl-color=$TEXT           \
--bshl-color=$WRONG           \
\
--screen 1                    \
--blur 10                     \
--clock                       \
--indicator                   \
--time-str="%H:%M:%S"         \
--date-str="%A, %Y-%m-%d"     \
--radius 100                  \
--ring-width=20

