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
chomp(my $localhost = `hostname`);
my $output;

my $TESTFILE = 'tmpdt';

# data-transfer-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'data-transfer installed');
} else {
  ok(! $isInstalled, 'data-transfer not installed');
}

$output = `ssh localhost /bin/echo hello 2>&1`;
my $canSsh = $output =~ /hello/;

SKIP: {

  skip 'bbftp not installed', 8 if ! $isInstalled;

  SKIP: {
    skip 'cannot ssh without passphrase', 1 if ! $canSsh;
    `$bbftpHome/bin/bbftp -E "$bbftpHome/bin/bbftpd -s" -S -e "get /etc/motd ./" $localhost && /usr/bin/cmp /etc/motd ./motd`;
    ok($? == 0, 'bbftp works');
    `/bin/rm -f motd`;
  }

  SKIP: {
    skip 'cannot ssh without passphrase', 1 if ! $canSsh;
    `$bbcpPath -4 -S "ssh -x -a -oFallBackToRsh=no %H $bbcpPath" $localhost:/etc/motd motd && /usr/bin/cmp /etc/motd ./motd`;
    ok($? == 0, 'bbcp works');
    `/bin/rm -f motd`;
  }

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

`/bin/rm -fr $TESTFILE*`;
