# OTRS config file (automatically generated)
# VERSION:1.1
package Kernel::Config::Files::ZZZAuto;
use strict;
use warnings;
no warnings 'redefine';
use utf8;
sub Load {
    my ($File, $Self) = @_;
$Self->{'SystemID'} = '85';
$Self->{'FQDN'} = 'b107c238f6e6';
$Self->{'AdminEmail'} = 'admin@example.com';
$Self->{'Organization'} = 'Unotech Software';
$Self->{'LogModule'} = 'Kernel::System::Log::File';
$Self->{'LogModule::LogFile'} = '/tmp/otrs.log';
$Self->{'DefaultLanguage'} = 'en';
$Self->{'CheckMXRecord'} = '0';
$Self->{'SecureMode'} = 1;
}
1;
