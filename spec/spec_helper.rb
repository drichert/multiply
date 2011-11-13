require 'yaml'
require 'multiply'

def text_strings
  [
    "This is a long text. This text is longer than the short text.",
    "This text is shorter than the long text."
  ]
end

def text_arrays
  [
    ["This", "is", "a", "long", "text.", "This", "text",
   "is", "longer", "than", "the", "short", "text."],
    ["This", "text", "is", "shorter", "than", "the", "long", "text."]
  ]
end

def text_files
  [
    File.open(File.expand_path("../../share/texts/test/short.txt", __FILE__)),
    File.open(File.expand_path("../../share/texts/test/long.txt", __FILE__))
  ]
end
