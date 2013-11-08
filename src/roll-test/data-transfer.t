#!/usr/bin/perl -w
# data-transfer roll installation test.  Usage:
# data-transfer.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $bbcpPath = '/opt/bbcp/bin/bbcp';
my $bbftpHome = '/opt/bbftp';
my $isInstalled = -d $bbftpHome;
my $output;

my $TESTFILE = 'tmpdt';
my $TESTPASS = 'tmpdtpass';
my $TESTUSER = 'tmpdtuser';

open(OUT, ">$TESTFILE.pass.exp");
print OUT <<END;
spawn passwd $TESTUSER
expect -ex "New password: " {send "$TESTPASS\\r"}
expect -ex "Retype new password: " {send "$TESTPASS\\r"}
expect -ex "passwd: all" {}
END
close(OUT);

open(OUT, ">$TESTFILE.exp");
print OUT <<END;
spawn $bbftpHome/bin/bbftp -u $TESTUSER -e "get /etc/motd ./" localhost
expect -ex "Password:" {send "$TESTPASS\\r"}
expect -ex "get /etc/motd" {}
END
close(OUT);

# data-transfer-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'data-transfer installed');
} else {
  ok(! $isInstalled, 'data-transfer not installed');
}

SKIP: {

  skip 'bbftp not installed', 8 if ! $isInstalled;
  `/usr/sbin/useradd -d /tmp/$TESTUSER -s /sbin/nologin -g 100 $TESTUSER`;
  `/usr/bin/expect $TESTFILE.pass.exp`;
  `$bbftpHome/etc/bbftpd start`;
  `/usr/bin/expect $TESTFILE.exp`;
  `$bbftpHome/etc/bbftpd stop`;
  ok(-f 'motd', 'bbftp works');
  `/usr/sbin/userdel -r $TESTUSER`;
  `/bin/rm -f motd`;

  `$bbcpPath -S "ssh -x -a -oFallBackToRsh=no %I -l %U %H $bbcpPath" localhost:/etc/motd motd`;
  ok(-f 'motd', 'bbcp works');
  `/bin/rm -f motd`;

  skip 'modules not installed', 6 if ! -f '/etc/profile.d/modules.sh';
  `/bin/ls /opt/modulefiles/applications/bbftp/[0-9]* 2>&1`;
  ok($? == 0, 'bbftp module installed');
  `/bin/ls /opt/modulefiles/applications/bbftp/.version.[0-9]* 2>&1`;
  ok($? == 0, 'bbftp version module installed');
  ok(-l '/opt/modulefiles/applications/bbftp/.version',
     'bbftp version module link created');
  `/bin/ls /opt/modulefiles/applications/bbcp/[0-9.]* 2>&1`;
  ok($? == 0, 'bbcp module installed');
  `/bin/ls /opt/modulefiles/applications/bbcp/.version.[0-9.]* 2>&1`;
  ok($? == 0, 'bbcp version module installed');
  ok(-l '/opt/modulefiles/applications/bbcp/.version',
     'bbcp version module link created');

}

# data-transfer-doc.xml
SKIP: {
  skip 'not server', 1 if $appliance ne 'Frontend';
  ok(-d '/var/www/html/roll-documentation/data-transfer', 'doc installed');
}

`/bin/rm -fr $TESTFILE*`;