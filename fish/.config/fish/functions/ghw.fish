# Defined in - @ line 1
function ghw --wraps='glab repo view --web' --description 'alias ghw=glab repo view --web'
  glab repo view --web $argv;
end
