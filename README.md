# Buildroot-package-metro

https://buildroot.org/downloads/buildroot-2018.02.8.tar.gz

Buildroot + python + morpionpython package + inittab
=================================

For more information about buildroot, please consult the official buildroot
documentation:

https://buildroot.org/downloads/manual/manual.html

For more information about morpionpython:

https://github.com/Chadys/morpion_python

Build instructions
------------------

Below are step-by-step instructions for building an SD-card image containing
morpionpython project Raspberry Pi 3.

Step 1: get buildroot
++++++++++++++++++++++++

Download the buildroot long term support release:

::

    wget https://buildroot.org/downloads/buildroot-2018.02.8.tar.gz
    tar xvf buildroot-2018.02.8.tar.gz

Step 2: clone this repository and checkout this branch
+++++++++++++++++++++

::

    git clone https://github.com/Rapiiidooo/buildroot-markerless-detector.git
    cd buildroot-markerless-detector
    git checkout morpionpython-config
    cd ..


Step 3: copy important files to buildroot folder
+++++++++++++++++++++

::

	cp -r buildroot-markerless-detector/board/ buildroot-markerless-detector/configs/ buildroot-markerless-detector/package/ buildroot-2018.02.8/


Step 4: configuration
+++++++++++++++++++++

Use the defconfig *morpionpython_defconfig* as a starting
point for the configuration.

::

    cd buildroot-2018.02.8
    make morpionpython_defconfig

Step 5: build
+++++++++++++

Once the system is configured properly it is time to build.

To build an SD-card image, just run ``make``:

::

    make

Buildroot will download and build all packages and create the SD-card image
in one step.

The build will take some time (~40-60 minutes depending on the build machine).

The output will be available in *output/images*

Step 6: edit inittab in output/target
+++++++++++++++++++++

::

	echo "/usr/bin/python3" >> buildroot-2018.02.8/output/target/etc/profile

and run ``make`` again:

::

	make

or with the correct JLEVEL as your build machine: 

::

	BR2_JLEVEL=4 make

The build will take (~30seconds-1minute depending on the build machine).

The output will be available in *output/images*

Step 7: write SD-card
+++++++++++++++++++++

Write the image to the SD-card with *dd*:

::

    dd output/images/sdcard.img /dev/sdX

*/dev/sdX* should be replaced with the path to the SD-card device.

.. N.B.
    Make sure to use the correct sdX device so you don't mess up your
    build machine! Use fdisk or similar to verify that the disk you are
    writing to is the intended SD-card.
