# OTRS config file (automatically generated)
# VERSION:1.1
package Kernel::Config::Files::ZZZAuto;
use strict;
use warnings;
no warnings 'redefine';
use utf8;
sub Load {
    my ($File, $Self) = @_;
$Self->{'Cache::Module::Memcached'}->{'Parameters'} =  {
  'max_size' => '16777216',
  'utf8' => '1'
};
$Self->{'Cache::Module::Memcached'}->{'Servers'} =  [
  '127.0.0.1:11211'
];
$Self->{'Cache::Module'} =  'Kernel::System::Cache::Memcached';
$Self->{'Customer::AuthModule::LDAP::Params'} =  {
  'async' => 0,
  'port' => 389,
  'timeout' => 120,
  'version' => 3
};
$Self->{'Customer::AuthModule::LDAP::SearchUserPw'} =  '123456';
$Self->{'Customer::AuthModule::LDAP::SearchUserDN'} =  'uid=UNOTECH225,dc=unotechsoft,dc=com';
$Self->{'Customer::AuthModule::LDAP::UserAttr'} =  'DN';
$Self->{'Customer::AuthModule::LDAP::UID'} =  'uid';
$Self->{'Customer::AuthModule::LDAP::BaseDN'} =  'dc=unotechsoft,dc=com';
$Self->{'Customer::AuthModule::LDAP::Host'} =  '192.168.2.223';
$Self->{'Customer::AuthModule'} =  'Kernel::System::CustomerAuth::LDAP';
delete $Self->{'PreferencesGroups'}->{'SpellDict'};
$Self->{'LogModule'} =  'Kernel::System::Log::File';
$Self->{'CheckMXRecord'} =  '0';
$Self->{'Organization'} =  'Unotech Software';
delete $Self->{'NodeID'};
$Self->{'FQDN'} =  'b107c238f6e6';
$Self->{'SystemID'} =  '85';
$Self->{'SecureMode'} =  1;
}
1;
