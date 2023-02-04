use v5.37;

package Dist::Zilla::PluginBundle::Example;

use Moose;

with 'Dist::Zilla::Role::PluginBundle::Easy';

sub configure ( $self ) {

  my @plugins = qw(
    CPANFile
    AutoPrereqs
    AutoVersion
    PruneFiles
    NextRelease

    PodWeaver
    InstallGuide
    GithubMeta
  );

  my @bundles = qw(
    Basic

    Git
  );

  $self -> add_bundle( $_ ) for @bundles;

  $self -> add_plugins( @plugins );

}
