=================
Salt Vagrant OpenSUSE Web Application Demo
=================

A Salt State/Executable generated web application using Vagrant w/ OpenSUSE.


Instructions
============

Run the following commands in a terminal. Git, VirtualBox and Vagrant must
already be installed.

.. code-block:: bash

    git clone https://github.com/Brownie2023/salt-opensue.git
    cd salt-opensuse
    vagrant up


This will download an OpenSUSE  VirtualBox image and create three virtual
machines for you. One will be a Salt Master named `master` and two will be Salt
Minions named `minion1` and `minion2`. Minion1 is used to host a Angular and Flask
web app that connects to a PostgreSQL database hosted on minion2. Because the minion keys are
pre-generated and reside in the repo, please be sure to regenerate new keys if
you use this for production purposes.

You can then run the following commands to log into the Salt Master and begin
using Salt to start and configure our services.

.. code-block:: bash

    vagrant ssh master
    su                                                #password: vagrant
    salt '*' state.apply                              #install and necessary packages on minion1 && 2 etc.
    salt 'minion1' state.apply postgres.create_db     #creates initial postgres relation for our app
    salt 'minion1' state.apply web_services.run_site  #starts our flask app

Lastly, navigate to

.. code-block:: bash

    http://192.168.50.11


Thanks to https://github.com/UtahDave (cloned from here) and all of the other contributors to this
salt vagrant demo template.
