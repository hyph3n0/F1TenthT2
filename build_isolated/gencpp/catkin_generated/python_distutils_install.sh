#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/f1tenthteam2/pleasework/src/gencpp"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/f1tenthteam2/pleasework/install_isolated/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/f1tenthteam2/pleasework/install_isolated/lib/python3/dist-packages:/home/f1tenthteam2/pleasework/build_isolated/gencpp/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/f1tenthteam2/pleasework/build_isolated/gencpp" \
    "/usr/bin/python" \
    "/home/f1tenthteam2/pleasework/src/gencpp/setup.py" \
    egg_info --egg-base /home/f1tenthteam2/pleasework/build_isolated/gencpp \
    build --build-base "/home/f1tenthteam2/pleasework/build_isolated/gencpp" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/f1tenthteam2/pleasework/install_isolated" --install-scripts="/home/f1tenthteam2/pleasework/install_isolated/bin"
