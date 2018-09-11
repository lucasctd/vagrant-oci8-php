# vagrant-oci8-php
A simple Vagrantfile to create a box (ubuntu/xenial64) with PHP 5.6+ (you choose), apache2 and oracle driver (oci8).

## How to:

1. Run __install_vagrant_plugins.bat__ to install vagrant-env, vagrant-winnfsd and vagrant-timezone, you should run this file as __adm__;  
1. Make a copy of __.env.example__ as __.env__ and set the path to your application. Remember to use __"//"__ instead of __"/"__. There are also other parameters which are self-explanatory;  
1. Run __"vagrant up"__  
1. __That's it =D__



__*Tested on PHP 5.6, 7.0, 7.1 and 7.2.__

### What's next?

I am also planning to make it working with **nginx**.
