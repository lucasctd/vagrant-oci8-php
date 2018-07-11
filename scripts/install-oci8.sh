echo "-----------------------------------------------------------------------"
echo "***********************************************************************"
echo "*********************** INSTALLING OCI 8 ******************************"
echo "***********************************************************************"
echo "-----------------------------------------------------------------------"
sudo cp /home/vagrant/oci8.ini /etc/php/$1/mods-available/oci8.ini
sudo dpkg -i /home/vagrant/oracle-instantclient12.2-basic_12.2.0.1.0-2_amd64.deb
sudo dpkg -i /home/vagrant/oracle-instantclient12.2-devel_12.2.0.1.0-2_amd64.deb
if ["$1" = "5.6"]
then
    sudo yes '' | sudo pecl install -f oci8-2.0.12
else
    sudo yes '' | sudo pecl install -f oci8
fi
sudo ln -s /etc/php/$1/mods-available/oci8.ini /etc/php/$1/cli/conf.d/oci8.ini
sudo ln -s /etc/php/$1/mods-available/oci8.ini /etc/php/$1/apache2/conf.d/oci8.ini
sudo service apache2 restart
echo "-----------------------------------------------------------------------"
echo "***********************************************************************"
echo "*********** OCI 8 HAS BEEN INSTALLED SUCCESSFULLY *********************"
echo "***********************************************************************"
echo "-----------------------------------------------------------------------"