#!/usr/bin/env python3
import feedparser
import os
import sys

def main():

    feed = feedparser.parse('https://www.archlinux.org/feeds/news/')

    print("\n" * 100)

    print("   _    ___  _   _ ")
    print("  /_\  / __|| | | |")
    print(" / _ \ \__ \| |_| |")
    print("/_/ \_\|___/ \___/ ")

    print("Arch Safe Update - v1.0.0")
    print("Written by Karl Swanepoel (karlswa.com)")
    print("\n")
    print("Latest news from archlinux.org:")

    print("------------------")
    print(">>> " + feed['entries'][0]['title'])
    print(">>> " + feed['entries'][1]['title'])
    print(">>> " + feed['entries'][2]['title'])

    print("------------------")
    print("\n")
    print("WARNING - Only proceed if you are aware of the above entries.")

    print("Would you like to proceed? (y/N)")

    choice = input(": ")

    if choice.lower() == "" or choice.lower() == "n":
        sys.exit()

    elif choice.lower() == "y":
        print("Running 'sudo pacman -Syu'")
        os.system("sudo pacman -Syu")
        sys.exit()

    else:
        print("Error, please select either y or n.")
        main()

while True:
    main()
