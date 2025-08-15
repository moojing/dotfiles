# Defined in - @ line 1
function ghw --wraps='gh repo view -w' --description 'alias ghw=gh repo view -w'
  gh repo view -w $argv;
end
