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
  ); # Plugins added with default settings


  $self -> add_bundle( '@Filter' => {
    '-bundle' => '@Basic' ,
    '-remove' => [ 'ConfirmRelease' ] ,
  }
  ); # Git::Check, Git::Commit, Git::Tag, Git::Push

  $self -> add_bundle( '@Filter' => {
    '-bundle' => '@Git' ,
    '-remove' => [ 'Git::Check' ] ,
  }
  );

  $self -> add_plugins(

    @plugins ,

    [
      AutoVersion => {
        major => 0
      }
    ] ,

    [
      PruneFiles => {
        filename => '_Deparsed_XSubs.pm' ,
        match    => '\.iml$' ,
      }
    ] ,

    [
      GenerateFile => {
        filename            => 'CONTRIBUTING' ,
        content_is_template => '1' ,

        content             => my $text = <<~ 'CONTRIBUTING'
          Please use project GitHub repository for your contributions.

          To contribute to this distribution you may:

          1. Create pull requests at: https://github.com/rwp-cpan/{{$dist -> name}}/pulls

          2. File issues at: https://github.com/rwp-cpan/{{$dist -> name}}/issues

          Thanks
          CONTRIBUTING
      }
    ] ,

    [
      GithubMeta => { # External plugin
        issues => 1
      }
    ] ,

    [
      'Git::Check' => { # External plugin
        untracked_files => 'ignore'
      }
    ]

  );

}

=pod

https://metacpan.org/pod/Dist::Zilla::Role::PluginBundle::Easy

https://metacpan.org/release/RJBS/Dist-Zilla-PluginBundle-RJBS-5.023/source/lib/Dist/Zilla/PluginBundle/RJBS.pm
