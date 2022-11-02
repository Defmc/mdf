#!/bin/sh

FONT=$(xrdb -get font)
BOTTOM=$(xrdb -get bottom)

BG=$(xrdb -get background)
BG_ITEM=$(xrdb -get color8)

RED=$(xrdb -get color1)
GREEN=$(xrdb -get color2)
YELLOW=$(xrdb -get color3)
WHITE=$(xrdb -get color7)
