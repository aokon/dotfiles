IEx.configure(
  width: 120,
  history_size: 200,
  inspect: [
    limit: :infinity,
    charlists: :as_lists,
    pretty: true,
    width: 120,
    binaries: :as_strings,
    printable_limit: :infinity
  ],
  colors: [
    syntax_colors: [
      number: :light_yellow,
      atom: :light_cyan,
      string: :light_black,
      boolean: :red,
      nil: [:magenta, :bright],
    ],
    ls_directory: :cyan,
    ls_device: :yellow,
    doc_code: :green,
    doc_inline_code: :magenta,
    doc_headings: [:cyan, :underline],
    doc_title: [:cyan, :bright, :underline],
  ]
)
