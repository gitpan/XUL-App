package XUL::App;

use strict;
use warnings;
use base qw/ Class::Data::Inheritable /;

our $VERSION = '0.01';

__PACKAGE__->mk_classdata('FILES' => {});

our ($ID, $APP_NAME);

1;
__END__

=head1 NAME

XUL::App - Nifty XUL apps in a XUL::App

=head1 VERSION

This document describes XUL::App 0.01 released on Jun 22, 2008.

=head1 SYNOPSIS

    $ xulapp app --name YSearchAll

    $ cd YSearchAll

    $ xulapp view --name Overlay --type overlay

    # Edit lib/YSearchAll/App.pm to add the following lines:
    package YSearchAll::App;
    our $VERSION = '0.01';

    use XUL::App::Schema;
    use XUL::App schema {
    +     xulfile 'overlay.xul' =>
    +         generated from 'YSearchAll::View::Overlay',
    +         includes qw( xulapp/jquery.js overlay.js ),
    +         overlays 'chrome://browser/content/browser.xul';
    +
        xpifile 'ysearchall.xpi' =>
            name is 'YSearchAll',

    # Add and edit js/ysearchall.js manually
    $ xulapp overlay -p dev11
    $ xulapp bundle .  # generate XPI ready for deployment

=head1 DESCRIPTION

XUL::App is a nifty Firefox extension development framework based on Perl. It has a lot of parallels with Jifty.

This framework has the following highlights:

=over

=item *

Jifty love on the Firefox extension development land.

=item *

Building a realworld Firefox extension can be much easier than GreaseMonkey hacks.

=item *

Use 100% Perl to specify XUL layout via L<Template::Declare>, no XML pain.

=item *

The resulting XPI file contains B<0%> Perl and could run everywhere (Win32, Mac, Linux, and etc). It's a compiler-style framework.

=back

Currently the module is in alpha stage and we're in severe lack of documentation. But you can get a lot of information from the slides that I used in the talk:

    http://agentzh.org/misc/slides/xulapp/xulapp.xul  (a JS-enabled Firefox is required to view these slides)

If you're having problems in displaying the slides given above, please try out the PowerPoint (PPT) version below:

    http://agentzh.org/misc/slides/xulapp.ppt

or the PDF version:

    http://agentzh.org/misc/slides/xulapp.pdf

=head1 CAVEATS

=over

=item *

Because XUL::App wites to your ~/.mozilla/firefox directory directly, it's always recommended to backup that directory to somewhere else to prevent unexpected corruption occurring to your Firefox profiles.

=item *

After applying Firefox updates or using a new Firefox profile, it's required to restart Firefox one more time to load your extensions. So please don't fire bug report regarding that.

=item *

Only Firefox 2.0.0.* and Firefox 3.0 on Linux has been tested against this framework. So you're warned when you're going to do XUL::App hacking on other platforms like Windows.

(BTW, I'm very willing to apply patches for other platforms.)

=back

=head1 SOURCE CONTROL

You can always get the latest source of XUL::App from the following SVN repository:

    http://svn.openfoundry.org/xulapp/trunk/

There's very little POD docs, please read README and the slides for details.

I really need help in improving this module's docs, tests, and implementation. If you find this thing useful and feel like contributing to it, please write to me and get a commit bit! ;)

=head1 SAMPLES

=over

=item *

SearchAll is a real-world Firefox extension that is built upon XUL::App, which can serve as a big demo for the usage of the framework:

    L<http://svn.openfoundry.org/searchall/trunk/>

=item *

ExportReader: A Firefox extension to dump entries from Google Reader to JSON:

    L<http://svn.openfoundry.org/xulapp/trunk/demo/ExportReader/>

=item *

A helloworld sample extension is given in my XUL::App talk's slides:

    L<http://agentzh.org/misc/slides/xulapp.pdf>

=back

=head1 INSTALLATION

    perl Makefile.PL
    make
    sudo make install

=head1 BUGS

Sadly XUL::App does not run on Win32 yet. I've only tested it on Ubuntu Linux so far. If you have any problems or would love to help, please let me know ;)

=head1 SEE ALSO

L<Jifty>.

=head1 AUTHOR

Agent Zhang <agentzh@yahoo.cn>

=head1 COPYRIGHT

Copyright 2007 by Yahoo! China Inc. (http://cn.yahoo.com)

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

