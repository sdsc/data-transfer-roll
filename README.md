# SDSC "data-transfer" roll

## Overview

This roll bundles the bbftp and bbcp file transfer programs.

For more information about the various packages included in the data-transfer roll please visit their official web pages:

- <a href="http://doc.in2p3.fr/bbftp/" target="_blank">bbFTP</a> is a file
transfer software. It implements its own transfer protocol, which is optimized
for large files (larger than 2GB) and secure as it does not read the password in
a file and encrypts the connection information. - <a
href="http://www.slac.stanford.edu/~abh/bbcp/" target="_blank">BBCP</a> is a
tool used to securely and quickly copy data from source to target.


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate data-transfer source file(s) using a machine that does
have Internet access and copy them into the `src/<package>` directories on your
Rocks development machine.


## Dependencies

Unknown at this time.


## Building

To build the data-transfer-roll, execute these instructions on a Rocks
development machine (e.g., a frontend or development appliance):

```shell
% make default 2>&1 | tee build.log
% grep "RPM build error" build.log
```

If nothing is returned from the grep command then the roll should have been
created as... `data-transfer-*.iso`. If you built the roll on a Rocks frontend
then proceed to the installation step. If you built the roll on a Rocks
development appliance you need to copy the roll to your Rocks frontend before
continuing with installation.


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll data-transfer
% cd /export/rocks/install
% rocks create distro
% rocks run roll data-transfer | bash
```

In addition to the software itself, the roll installs environment module files
in:

```shell
 /opt/modulefiles/applications/{bbcp,bbftp}.
```


## Testing

The data-transfer-roll includes a test script which can be run to verify proper
installation of the data-transfer-roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/data-transfer.t 
ok 1 - data-transfer is installed
ok 2 - data-transfer test run
ok 3 - data-transfer module installed
ok 4 - data-transfer version module installed
ok 5 - data-transfer version module link created
1..5
```
