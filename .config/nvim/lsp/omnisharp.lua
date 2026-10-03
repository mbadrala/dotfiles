return {
  root_markers = { "*.sln", "*.slnx", "*.csproj", "Assets", "ProjectSettings" },
  
  cmd = { "omnisharp" }, 
  
  filetypes = { "cs", "vb" },

  settings = {
    MsBuild = {
      UseModernNet = false,
    },
    roslynExtensionsOptions = {
      enableAnalyzersSupport = true,
      enableImportCompletion = true,
    },
  },
}
