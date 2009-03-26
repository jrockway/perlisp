use inc::Module::Install;

name 'Perlisp';
all_from 'lib/Perlisp.pm';

requires 'Moose';
requires 'MooseX::AttributeHelpers';

build_requires 'Test::More';
build_requires 'ok';

WriteAll();
