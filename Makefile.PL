use inc::Module::Install;

name 'Perlisp';
all_from 'lib/Perlisp.pm';

build_requires 'Test::More';
build_requires 'ok';

WriteAll();
