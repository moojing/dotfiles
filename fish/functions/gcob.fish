# Defined in - @ line 1
function gcob --wraps='git checkout -b' --description 'alias gcob=git checkout -b'
  git checkout -b $argv;
end
