require'lspconfig'.ccls.setup {
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 1;
    };
    cache = {
      directory = "$HOME/AppData/Local/Temp/ccls-cache";
    };
  }
}

