# SDSC "data-transfer" roll

## Overview

This roll bundles the bbftp and bbcp file transfer programs.

For more information about the various packages included in the data-transfer roll please visit their official web pages:

- <a href="http://doc.in2p3.fr/bbftp/" target="_blank">bbFTP</a> is a file
transfer software. It implements its own transfer protocol, which is optimized
for large files (larger than 2GB) and secure as it does not read the password in
a file and encrypts the connection information.
- <a href="http://www.slac.stanford.edu/~abh/bbcp/" target="_blank">BBCP</a> is
a tool used to securely and quickly copy data from source to target.


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate data-transfer source file(s) using a machine that does
have Internet access and copy them into the `src/<package>` directories on your
Rocks development machine.


## Dependencies

The sdsc-roll must be installed on the build machine, since the build process
depends on make include files provided by that roll.


## Building

To build the data-transfer-roll, execute this on a Rocks
development machine (e.g., a frontend or development appliance):

```shell
% make 2>&1 | tee build.log
```

A successful build will create the file `data-transfer-*.disk1.iso`.  If you built the
roll on a Rocks frontend, proceed to the installation step. If you built the
roll on a Rocks development appliance, you need to copy the roll to your Rocks
frontend before continuing with installation.


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll data-transfer
% cd /export/rocks/install
% rocks create distro
```

Subsequent installs of compute and login nodes will then include the contents
of the data-transfer-roll.  To avoid cluttering the cluster frontend with unused
software, the data-transfer-roll is configured to install only on compute and
login nodes. To force installation on your frontend, run this command after
adding the abinit-roll to your distro

```shell
% rocks run roll data-transfer host=NAME | bash
```

where NAME is the DNS name of a compute or login node in your cluster.

In addition to the software itself, the roll installs environment module files
in:

```shell
 /opt/modulefiles/applications/{bbcp,bbftp}.
```


## Testing

The data-transfer-roll includes a test script which can be run to verify proper
installation of the roll documentation, binaries and module files.
To run the test scripts execute the following command(s):

```shell
% /root/rolltests/data-transfer.t 
```

To run successfully, this test must be run by a user that can ssh to localhost
without a passphrase.


## License

### bbftpc & bbftpd

bbFTP client/daemon are licensed under the GNU GENERAL PUBLIC LICENSE. See 
`src/bbftpc/COPYING` and `src/bbftpd/COPYING` for more information.

### bbcp  

#### Legal Notice

Copyright © 2002-2012, Board of Trustees of the Leland Stanford, Jr. University.  
Produced under contract DE-AC02-76-SF00515 with the US Department of Energy.  
All rights reserved.
 
Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 
a.      Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
b.      Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
c.       Neither the name of the Leland Stanford, Jr. University nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
