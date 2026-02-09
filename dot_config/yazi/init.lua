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

