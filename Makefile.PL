use strict;
use lib '.';
use inc::Module::Install;

name                ('XUL-App');
license             ('perl');
author              ('Agent Zhang <agentzh@yahoo.cn>');
perl_version        ('5.006001');
all_from            ('lib/XUL/App.pm');

requires            ('Object::Declare' => '0.22');
requires            ('Template::Declare' => '0.27');
requires            ('File::Slurp');
requires            ('Class::Accessor::Fast' => '0.30');
requires            ('Class::Data::Inheritable' => '0.06');
requires            ('File::ShareDir' => '0.04');
requires            ('File::Copy::Recursive' => '0.35');

no_index( directory => qw< doc examples share > );

install_script      ('script/xulapp');
install_share;

auto_install();
WriteAll();

