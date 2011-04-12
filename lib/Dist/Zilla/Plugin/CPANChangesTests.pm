#
# This file is part of Dist-Zilla-Plugin-CPANChangesTests
#
# This software is copyright (c) 2011 by Randy Stauner.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
package Dist::Zilla::Plugin::CPANChangesTests;
BEGIN {
  $Dist::Zilla::Plugin::CPANChangesTests::VERSION = '1.002';
}
BEGIN {
  $Dist::Zilla::Plugin::CPANChangesTests::AUTHORITY = 'cpan:RWSTAUNER';
}
# ABSTRACT: Deprecated


use strict;
use warnings;
use Moose;
extends 'Dist::Zilla::Plugin::InlineFiles';

before gather_files => sub {
	my ($self) = @_;
	$self->log($_) for (
		'!',
		__PACKAGE__ . ' is deprecated.',
		'Please use Dist::Zilla::Plugin::Test::CPAN::Changes.',
		'!',
	);
};

__PACKAGE__->meta->make_immutable;
no Moose;

1;




=pod

=for :stopwords Randy Stauner cpan testmatrix url annocpan anno bugtracker rt cpants
kwalitee diff irc mailto metadata placeholders

=head1 NAME

Dist::Zilla::Plugin::CPANChangesTests - Deprecated

=head1 VERSION

version 1.002

=head1 SYNOPSIS

This module is B<deprecated> in favor of the more configurable and better named
L<Dist::Zilla::Plugin::Test::CPAN::Changes>.

  # dist.ini
  [Test::CPAN::Changes]

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following files:

  xt/release/cpan-changes.t - a standard Test::CPAN::Changes test

=head1 SEE ALSO

=over 4

=item *

L<Dist::Zilla::Plugin::Test::CPAN::Changes>

=back

=head1 SUPPORT

=head2 Perldoc

You can find documentation for this module with the perldoc command.

  perldoc Dist::Zilla::Plugin::CPANChangesTests

=head2 Websites

The following websites have more information about this module, and may be of help to you. As always,
in addition to those websites please use your favorite search engine to discover more resources.

=over 4

=item *

Search CPAN

L<http://search.cpan.org/dist/Dist-Zilla-Plugin-CPANChangesTests>

=item *

RT: CPAN's Bug Tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Dist-Zilla-Plugin-CPANChangesTests>

=item *

AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Dist-Zilla-Plugin-CPANChangesTests>

=item *

CPAN Ratings

L<http://cpanratings.perl.org/d/Dist-Zilla-Plugin-CPANChangesTests>

=item *

CPAN Forum

L<http://cpanforum.com/dist/Dist-Zilla-Plugin-CPANChangesTests>

=item *

CPANTS Kwalitee

L<http://cpants.perl.org/dist/overview/Dist-Zilla-Plugin-CPANChangesTests>

=item *

CPAN Testers Results

L<http://cpantesters.org/distro/D/Dist-Zilla-Plugin-CPANChangesTests.html>

=item *

CPAN Testers Matrix

L<http://matrix.cpantesters.org/?dist=Dist-Zilla-Plugin-CPANChangesTests>

=back

=head2 Bugs / Feature Requests

Please report any bugs or feature requests by email to C<bug-dist-zilla-plugin-cpanchangestests at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Dist-Zilla-Plugin-CPANChangesTests>. You will be automatically notified of any
progress on the request by the system.

=head2 Source Code


L<http://github.com/magnificent-tears/Dist-Zilla-Plugin-CPANChangesTests/tree>

  git clone git://github.com/magnificent-tears/Dist-Zilla-Plugin-CPANChangesTests.git

=head1 AUTHOR

Randy Stauner <rwstauner@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Randy Stauner.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__DATA__
___[ xt/release/cpan-changes.t ]___
#!perl

use Test::More;
eval 'use Test::CPAN::Changes';
plan skip_all => 'Test::CPAN::Changes required for this test' if $@;
changes_ok();
