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