module Nyaplot
  add_extension("Bionya")
  add_additional_library("Bionya","https://cdn.rawgit.com/domitry/nyaplot/master/lib/bionya/js/release/bionya")
  init_iruby if defined? IRuby
end
