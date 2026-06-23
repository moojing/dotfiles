function wtpath --description "Print the git worktree path for a given branch name"
    if test -z "$argv[1]"
        echo "usage: wtpath <branch-name>" >&2
        return 1
    end
    git worktree list --porcelain | awk -v b="$argv[1]" '
        /^worktree / { path = $2 }
        $0 == "branch refs/heads/" b { print path }
    '
end
