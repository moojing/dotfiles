# Defined in - @ line 1
function ghv --wraps='gh pr view -w' --description 'alias ghv=gh pr view -w'
  gh pr view -w $argv;
end
