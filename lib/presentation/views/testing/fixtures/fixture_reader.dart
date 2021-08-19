import 'dart:io';

String fixture(String name) =>
    File('lib/presentation/views/testing/fixtures/$name').readAsStringSync();
