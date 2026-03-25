programs.git = {
  enable = true;
  settings = {
    user = {
      name = "Ryutaro Kawaguchi";
      email = "kawakawaryuryu@hotmail.co.jp";
    };
    alias = {
      st = status;
      df = diff;
      co = checkout;
      b = branch;
      ad = add;
      cm = commit;
      p = push;
    };
    init = {
      defaultBranch = main;
    };
  };
  ignores = [
    "*.swp"
    ".DS_Store"
    "GPATH"
    "GRTAGS"
    "GTAGS"
  ];
};
