# ABSTRACT: Add [@RWP] plugin bundle into dist.ini

use v5.37;

package Dist::Zilla::PluginBundle::RWP;
use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';

sub configure ( $self ) {

  my @plugins = qw(
    CPANFile
    AutoPrereqs
    NextRelease

    PodWeaver
    InstallGuide
    Git::Commit
    Git::Tag
  ); # Plugins added with default settings


  $self -> add_bundle( '@Filter' => {
    '-bundle' => '@Basic' ,
    '-remove' => [ 'ConfirmRelease' ] ,
  }
  );

  $self -> add_plugins( @plugins );

  $self -> add_plugins( [ AutoVersion => { major => 0 } ] , );

  $self -> add_plugins(
    [
      PruneFiles => {
        filename => '_Deparsed_XSubs.pm' ,
        match    => '\.iml$' ,
      }
    ] ,
  );

  $self -> add_plugins( [ GithubMeta => { issues => 1 } ] , );                 # External plugin
  $self -> add_plugins( [ 'Git::Check' => { untracked_files => 'warn' } ] , ); # External plugin

}

=pod

https://metacpan.org/pod/Dist::Zilla::Role::PluginBundle::Easy

https://metacpan.org/release/RJBS/Dist-Zilla-PluginBundle-RJBS-5.023/source/lib/Dist/Zilla/PluginBundle/RJBS.pm
