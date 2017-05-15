HAWK - INSTALLATION INSTRUCTIONS
================================

Installing OTRS Server
-----------------------

### Steps for Installing OTRS over a new Database Server: ###

 1. curl -O https://raw.githubusercontent.com/abhishekunotech/install_scripts/master/installOTRS.sh
 2. chmod +x installOTRS.sh
 3. ./installOTRS.sh
 4. Make sure you have followed steps for Installing PostgreSQL server
 5. systemctl start httpd
 6. yum install -y perl-DBD-Pg
 7. Run Web Installer - go to <ip_of_server>/otrs/installer.pl 

### Steps for Installing OTRS over an existing Database Server: ###

 1. curl -O https://raw.githubusercontent.com/abhishekunotech/install_scripts/master/installOTRS.sh
 2. chmod +x installOTRS.sh
 3. ./installOTRS.sh
 4. curl -O https://raw.githubusercontent.com/abhishekunotech/install_scripts/master/postInstallOTRS.sh
 5. chmod +x postInstallOTRS.sh
 6. ./postInstallOTRS.sh

Installing PostgreSQL Server
-----------------------------

### Steps for Installing Database ###

 1. curl -O https://raw.githubusercontent.com/abhishekunotech/install_scripts/master/installPG.sh
 2. chmod +x installPG.sh
 3. ./installPG.sh
 4. systemctl restart postgresql-9.6
 5. vim /var/lib/pgsql/9.6/data/pg_hba.conf
 6. Add a line -- "host    all             all            <ip_of_otrs_server>           trust"
 7. vim /var/lib/pgsql/9.6/data/postgresql.conf
 8. Change hostname to <ip_of_postgre_server>
 9. Follow steps for Installing OTRS on new Database Server


Backing up and Restoring PostgreSQL data
-----------------------------------------

### Steps ###

 1. su - postgres
 2. pg_dumpall > output.dmp
 3. psql -f output.dmp postgres


Restoring Config and Code from Git
-----------------------------------

### Steps ###

 1. git pull
 2. yes | cp -R /opt/otrs/OTRS-Kernel/* /opt/otrs/Kernel/

Committing code to Git
-----------------------

### Steps ###

 1. yes | cp -R /opt/otrs/Kernel/* /opt/otrs/OTRS-Kernel/
 2. git commit -am "<your message>"
 3. git push

Installing Memcache
---------------------

### Steps ###
 
 0. Pull the latest code
 1. yum install -y gcc memcached patch
 2. git clone https://github.com/JRaspass/Cache-Memcached-Fast.git
 3. cd Cache-Memcached-Fast
 4. perl Makefile.pl
 5. make
 6. systemctl start memcached
 7. make test
 8. make install
 9. cd /opt/otrs/OTRS-Kernel
 10. cp otrs-memcached.patch ../../otrs
 11. patch -i otrs-memcached.patch
 12. Go to <ip_of_otrs_server>/otrs/index.pl?Action=AdminSysConfig;Subaction=Edit;SysConfigSubGroup=Core::Cache;SysConfigGroup=Framework;#
 13. Change Cache Module to Memcached and enable disabled checkboxes.
 14. systemctl restart httpd
 15. su - otrs
 16. bin/otrs.Console.pl Maint::Config::Rebuild

 