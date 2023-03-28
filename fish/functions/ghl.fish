# Defined in - @ line 1
function ghl --wraps='gh pr list -w' --description 'alias ghl=gh pr list -w'
  gh pr list -w $argv;
end
