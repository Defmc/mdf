#! /usr/bin/env python3
import os
import sys
import shutil

shittyfiles = [
    '~/.adobe',              # Flash crap
    '~/.macromedia',         # Flash crap
    '~/.recently-used',
    '~/.local/share/recently-used.xbel',
    '~/Desktop',            # Firefox creates this
    '~/.thumbnails',
    '~/.gconfd',
    '~/.gconf',
    '~/.local/share/gegl-0.2',
    '~/.FRD/log/app.log',   # FRD
    '~/.FRD/links.txt',     # FRD
    '~/.objectdb',          # FRD
    '~/.gstreamer-0.10',
    '~/.pulse',
    '~/.esd_auth',
    '~/.config/enchant',
    '~/.spicec',            # contains only log file; unconfigurable
    '~/.dropbox-dist',
    '~/.parallel',
    '~/.dbus',
    '~/ca2',                # WTF?
    '~/ca2~',               # WTF?
    '~/.distlib/',          # contains another empty dir, don't know which software creates it
    '~/.bazaar/',           # bzr insists on creating files holding default values
    '~/.bzr.log',
    '~/.nv/',
    '~/.viminfo',           # configured to be moved to ~/.cache/vim/viminfo, but it is still sometimes created...
    '~/.npm/',              # npm cache
    '~/.java/',
    '~/.oracle_jre_usage/',
    '~/.jssc/',
    '~/.tox/',              # cache directory for tox
    '~/.pylint.d/',
    '~/.qute_test/',
    '~/.QtWebEngineProcess/',
    '~/.qutebrowser/',      # created empty, only with webengine backend
    '~/.asy/',
    '~/.cmake/',
    '~/.gnome/',
    '~/unison.log',
    '~/.texlive/',
    '~/.w3m/',
    '~/.subversion/',
    '~/nvvp_workspace/',    # created empty even when the path is set differently in nvvp
    '~/.ansible/',
    '~/.fltk/',
    '~/.vnc/',
    '~/.mozilla/',
]

print("Found shittyfiles:")
found = []
for f in shittyfiles:
    absf = os.path.expanduser(f)
    if os.path.exists(absf):
        found.append(absf)
        print("    ", f)
        if os.path.isfile(absf):
            os.remove(absf)
        else:
            shutil.rmtree(absf)
