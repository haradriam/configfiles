# vimrc

- There are some mappings that use `<C-Arrow>` sequence. To see correct sequence for your system, use `od -a` utility.
- To generate C++ standard library ctags (C++ version could change): `ctags -f ~/.vim/tags/cpp -R --c++-kinds=+p --fields=+iaS --extra=+q -I "_GLIBCXX_BEGIN_NAMESPACE_VERSION _GLIBCXX_END_NAMESPACE_VERSION _GLIBCXX_VISIBILITY+" -n /usr/include/c++/7/*`
