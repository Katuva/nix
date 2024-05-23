#!/usr/bin/env bash

polybar-msg cmd quit

polybar top_bar 2>&1 & disown

