#!/bin/sh

FONT=$(xrdb -get font)
BOTTOM=$(xrdb -get bottom)

BG_BAR=$(xrdb -get background)
BG_ITEM=$(xrdb -get color8)
GREEN=$(xrdb -get color2)
WHITE=$(xrdb -get color7)
