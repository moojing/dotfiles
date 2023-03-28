# Defined in - @ line 1
function ghc --wraps='gh pr create -w' --description 'alias ghc=gh pr create -w'
  gh pr create -w $argv;
end
