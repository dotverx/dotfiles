function Linemode:mdate_perm_own()
  local cha = self._file.cha

  -- modified time
  local t = math.floor(cha.mtime or 0)
  local mtime = "-"
  if t > 0 then
    if os.date("%Y", t) == os.date("%Y") then
      mtime = os.date("%d.%m %H:%M", t)
    else
      mtime = os.date("%d.%m  %Y", t)
    end
  end

  -- permissions (e.g. -rwxr-xr-x)
  local perm = cha:perm() or "-"

  -- owner (username, falling back to uid)
  local owner = "-"
  if cha.uid then
    owner = ya.user_name(cha.uid) or tostring(cha.uid)
  end

  -- group (group name, falling back to gid)
  local group = "-"
  if cha.gid then
    group = ya.group_name(cha.gid) or tostring(cha.gid)
  end

  return string.format("%s %s %s:%s", mtime, perm, owner, group)
end

-- git.yazi plugin
require("git"):setup {
  -- order of status signs showing in the linemode
  order = 900,
}

require("eza-preview"):setup({
  -- Set the tree preview to be default (default: true)
  default_tree = false,
  -- Directory depth level for tree preview (default: 3)
  level = 3,
  -- Show file icons
  icons = true,
  -- Follow symlinks when previewing directories (default: true)
  follow_symlinks = true,
  -- Show target file info instead of symlink info (default: false)
  dereference = false,
  -- Show hidden files (default: true)
  all = true,
  -- Ignore files matching patterns (default: {})
  -- ignore_glob = "*.log"
  -- ignore_glob = { "*.tmp", "node_modules", ".git", ".DS_Store" }
  -- SEE: https://www.linuxjournal.com/content/pattern-matching-bash to learn about glob patterns
  ignore_glob = {},
  -- Ignore files mentioned in '.gitignore'  (default: true)
  git_ignore = false,
  -- Show git status (default: false)
  git_status = false,
})

require("recycle-bin"):setup()

require("duckdb"):setup()

