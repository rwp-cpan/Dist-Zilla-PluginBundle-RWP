requires 'Dist::Zilla::PluginBundle::Git';
requires 'Dist::Zilla::Plugin::PodWeaver'; # force
requires 'Dist::Zilla::Plugin::InstallGuide';
requires 'Dist::Zilla::Plugin::MetaProvides::Package';
requires 'Dist::Zilla::Plugin::GithubMeta';
requires 'Pod::Elemental::Transformer::List';

# cpanm only since dzil doesn't seem to find "cpm install"-d modules
# sometimes do "cpanm --force" esp. for Test-Differences, a depedency of PodWeaver

# dzil authordeps --missing
# dzil build
# dzil release
