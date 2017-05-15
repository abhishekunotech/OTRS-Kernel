# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
#  Note:
#
#  -->> Most OTRS configuration should be done via the OTRS web interface
#       and the SysConfig. Only for some configuration, such as database
#       credentials and customer data source changes, you should edit this
#       file. For changes do customer data sources you can copy the definitions
#       from Kernel/Config/Defaults.pm and paste them in this file.
#       Config.pm will not be overwritten when updating OTRS.
# --

package Kernel::Config;

use strict;
use warnings;
use utf8;

sub Load {
    my $Self = shift;

    # ---------------------------------------------------- #
    # database settings                                    #
    # ---------------------------------------------------- #

    # The database host
    $Self->{'DatabaseHost'} = '172.17.0.4';

    # The database name
    $Self->{'Database'} = "otrs";

    # The database user
    $Self->{'DatabaseUser'} = "otrs";

    # The password of database user. You also can use bin/otrs.Console.pl Maint::Database::PasswordCrypt
    # for crypted passwords
    $Self->{'DatabasePw'} = 'otrs';

    # The database DSN for MySQL ==> more: "perldoc DBD::mysql"
    #$Self->{DatabaseDSN} = "DBI:mysql:database=$Self->{Database};host=$Self->{DatabaseHost};";

    # The database DSN for PostgreSQL ==> more: "perldoc DBD::Pg"
    # if you want to use a local socket connection
#    $Self->{DatabaseDSN} = "DBI:Pg:dbname=$Self->{Database};";
    # if you want to use a TCP/IP connection
    $Self->{'DatabaseDSN'} = "DBI:Pg:dbname=$Self->{Database};host=$Self->{DatabaseHost}";

    # The database DSN for Microsoft SQL Server - only supported if OTRS is
    # installed on Windows as well
#    $Self->{DatabaseDSN} = "DBI:ODBC:driver={SQL Server};Database=$Self->{Database};Server=$Self->{DatabaseHost},1433";

    # The database DSN for Oracle ==> more: "perldoc DBD::oracle"
#    $Self->{DatabaseDSN} = "DBI:Oracle://$Self->{DatabaseHost}:1521/$Self->{Database}";
#
#    $ENV{ORACLE_HOME}     = '/path/to/your/oracle';
#    $ENV{NLS_DATE_FORMAT} = 'YYYY-MM-DD HH24:MI:SS';
#    $ENV{NLS_LANG}        = 'AMERICAN_AMERICA.AL32UTF8';

    # ---------------------------------------------------- #
    # fs root directory
    # ---------------------------------------------------- #
    $Self->{Home} = '/opt/otrs';

    # ---------------------------------------------------- #
    # insert your own config settings "here"               #
    # config settings taken from Kernel/Config/Defaults.pm #
    # ---------------------------------------------------- #
    # $Self->{SessionUseCookie} = 0;
    # $Self->{CheckMXRecord} = 0;

    # This is an example configuration for an LDAP auth. backend.
    # (make sure Net::LDAP is installed!)
    $Self->{'Customer::AuthModule'} = 'Kernel::System::CustomerAuth::LDAP'; # LDAP Auth
    # $Self->{'Customer::AuthModule'} = 'Kernel::System::Auth::Sugar'; # SSO Auth

    $Self->{'Customer::AuthModule::LDAP::Host'} = '192.168.2.223';
    $Self->{'Customer::AuthModule::LDAP::BaseDN'} = 'dc=unotechsoft,dc=com';
    $Self->{'Customer::AuthModule::LDAP::UID'} = 'uid';

    # Check if the user is allowed to auth in a posixGroup
    # (e. g. user needs to be in a group xyz to use otrs)
    #$Self->{'Customer::AuthModule::LDAP::GroupDN'} = 'cn=otrsallow,ou=posixGroups,dc=example,dc=com';
    #$Self->{'Customer::AuthModule::LDAP::AccessAttr'} = 'memberUid';
    # for ldap posixGroups objectclass (just uid)
    $Self->{'Customer::AuthModule::LDAP::UserAttr'} = 'UID';
    # for non ldap posixGroups objectclass (full user dn)
    $Self->{'Customer::AuthModule::LDAP::UserAttr'} = 'DN';

    # The following is valid but would only be necessary if the
    # anonymous user does NOT have permission to read from the LDAP tree
    $Self->{'Customer::AuthModule::LDAP::SearchUserDN'} = 'uid=UNOTECH225,dc=unotechsoft,dc=com';
    $Self->{'Customer::AuthModule::LDAP::SearchUserPw'} = '123456';

    # in case you want to add always one filter to each ldap query, use
    # this option. e. g. AlwaysFilter => '(mail=*)' or AlwaysFilter => '(objectclass=user)'
    #$Self->{'Customer::AuthModule::LDAP::AlwaysFilter'} = '';

    # in case you want to add a suffix to each customer login name, then
    # you can use this option. e. g. user just want to use user but
    # in your ldap directory exists user@domain.
    #$Self->{'Customer::AuthModule::LDAP::UserSuffix'} = '@mahfin.com';

    # Net::LDAP new params (if needed - for more info see perldoc Net::LDAP)
    $Self->{'Customer::AuthModule::LDAP::Params'} = {
    port => 389,
    timeout => 120,
    async => 0,
    version => 3,
    };

    $Self->{CustomerUser} = {
    Name => 'LDAP Data Source',
    Module => 'Kernel::System::CustomerUser::LDAP',
    Params => {
    # ldap host
    Host => '192.168.2.223',
    # ldap base dn
    BaseDN => 'dc=unotechsoft,dc=com',
    # search scope (one|sub)
    SSCOPE => 'sub',
    # The following is valid but would only be necessary if the
    # anonymous user does NOT have permission to read from the LDAP tree
    UserDN => 'uid=UNOTECH225,dc=unotechsoft,dc=com',
    UserPw => '123456',
    # in case you want to add always one filter to each ldap query, use
    # this option. e. g. AlwaysFilter => '(mail=*)' or AlwaysFilter => '(objectclass=user)'
    #AlwaysFilter => '',
    # if both your frontend and your LDAP are unicode, use this:
    SourceCharset => 'utf-8',
    DestCharset   => 'utf-8',
    # if your frontend is unicode and the charset of your
    # ldap server is iso-8859-1, use these options.
    # SourceCharset => 'iso-8859-1',
    # DestCharset => 'utf-8',
    # Net::LDAP new params (if needed - for more info see perldoc Net::LDAP)
    Params => {
    port => 389,
    timeout => 120,
    async => 0,
    version => 3,
    },
    },
    # customer unique id
    CustomerKey => 'uid',
    # customer #
    CustomerID => 'uid',
    #CustomerUserListFields => ['cn', 'mail'],
    CustomerUserListFields => ['cn', 'mail'],
    CustomerUserSearchFields => ['uid', 'cn', 'mail'],
    CustomerUserSearchPrefix => '',
    CustomerUserSearchSuffix => '*',
    CustomerUserSearchListLimit => 250,
    CustomerUserPostMasterSearchFields => ['mail'],
    #CustomerUserNameFields => ['uid'],
    CustomerUserNameFields => ['givenname', 'sn'],
    # show not own tickets in customer panel, CompanyTickets
    CustomerUserExcludePrimaryCustomerID => 0,
    # add an ldap filter for valid users (expert setting)
    #    CustomerUserValidFilter => '(!(description=locked))',
    # administrator can't change customer preferences
    AdminSetPreferences => 0,
    #    # cache time to live in sec. - cache any database queries
    #    CacheTTL => 0,
    Map => [
    # note: Login, Email and CustomerID are mandatory!
    # var, frontend, storage, shown (1=always,2=lite), required, storage-type, http-link, readonly
    [ 'UserTitle',      'Title',      'title',           1, 0, 'var', '', 0 ],
    [ 'UserFirstname',  'Firstname',  'givenname',       1, 1, 'var', '', 0 ],
    [ 'UserLastname',   'Lastname',   'sn',              1, 1, 'var', '', 0 ],
    [ 'UserLogin',      'Username',   'uid',             1, 1, 'var', '', 0 ],
    [ 'UserEmail',      'Email',      'mail',            1, 1, 'var', '', 0 ],
    [ 'UserCustomerID', 'CustomerID', 'uid',            0, 1, 'var', '', 0 ],
    #        [ 'UserCustomerIDs', 'CustomerIDs', 'second_customer_ids', 1, 0, 'var', '', 0 ],
    [ 'UserPhone',      'Phone',      'telephonenumber', 1, 0, 'var', '', 0 ],
    [ 'UserAddress',    'Address',    'postaladdress',   1, 0, 'var', '', 0 ],
    #      [ 'UserComment',    'Comment',    'description',     1, 0, 'var', '', 0 ],
    ],
    };


    # AuthSyncModule::LDAP::UserSyncInitialGroups
    # (sync following group with rw permission after initial create of first agent
    # login)
    $Self->{'AuthSyncModule::LDAP::UserSyncInitialGroups'} = [
    'users',
    ];


    # ---------------------------------------------------- #

    # ---------------------------------------------------- #
    # data inserted by installer                           #
    # ---------------------------------------------------- #
    # $DIBI$

    # ---------------------------------------------------- #
    # ---------------------------------------------------- #
    #                                                      #
    # end of your own config options!!!                    #
    #                                                      #
    # ---------------------------------------------------- #
    # ---------------------------------------------------- #
}

# ---------------------------------------------------- #
# needed system stuff (don't edit this)                #
# ---------------------------------------------------- #

use Kernel::Config::Defaults; # import Translatable()
use base qw(Kernel::Config::Defaults);

# -----------------------------------------------------#

1;
