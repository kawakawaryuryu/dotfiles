return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap = opts.keymap or {}
      opts.keymap["<C-e>"] = false
      opts.keymap["<C-b>"] = false
      opts.keymap["<C-f>"] = false
      opts.keymap["<C-p>"] = false
      opts.keymap["<C-n>"] = false
      opts.keymap["<C-k>"] = false
      opts.keymap["<C-g>"] = { "cancel", "fallback" }
      opts.keymap["<M-b>"] = { "scroll_documentation_up", "fallback" }
      opts.keymap["<M-f>"] = { "scroll_documentation_down", "fallback" }
      opts.keymap["<Tab>"] = {
        "select_next",
        LazyVim.cmp.map({ "snippet_forward", "ai_nes", "ai_accept" }),
        "fallback",
      }
      opts.keymap["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" }
    end,
  },
}
