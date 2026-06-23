function wtcd --description "Jump to a git worktree by branch name, or pick one interactively"
    # Build a "path<TAB>branch" row for every worktree in this repo
    set -l rows (git worktree list --porcelain | awk '
        /^worktree / { if (path != "") print path "\t" branch; path = substr($0, 10); branch = "(detached)" }
        /^branch /   { b = $0; sub(/^branch refs\/heads\//, "", b); branch = b }
        END          { if (path != "") print path "\t" branch }
    ')

    if test -z "$rows"
        echo "wtcd: not inside a git repository with worktrees" >&2
        return 1
    end

    # Direct jump when a branch name is supplied
    if test -n "$argv[1]"
        set -l query $argv[1]
        set -l matches
        for row in $rows
            set -l path (string split -f1 \t -- $row)
            set -l branch (string split -f2 \t -- $row)
            # Exact branch match wins immediately
            if test "$branch" = "$query"
                cd $path
                return 0
            end
            if string match -q "*$query*" -- $branch
                set -a matches $row
            end
        end
        # No exact match: accept a unique substring match
        if test (count $matches) -eq 1
            cd (string split -f1 \t -- $matches[1])
            return 0
        else if test (count $matches) -gt 1
            echo "wtcd: '$query' matches multiple branches:" >&2
            for m in $matches
                echo "  "(string split -f2 \t -- $m) >&2
            end
            return 1
        end
        echo "wtcd: no worktree for branch '$query'" >&2
        return 1
    end

    set -l current (git rev-parse --show-toplevel 2>/dev/null)

    # Interactive picker. Each fzf line is "<display>\t<path>": fzf shows only the
    # display column (--with-nth 1) while the trailing path field is used to cd.
    set -l lines
    for row in $rows
        set -l path (string split -f1 \t -- $row)
        set -l branch (string split -f2 \t -- $row)
        set -l mark " "
        test "$path" = "$current"; and set mark "*"
        set -a lines (printf '%s %-45s %s\t%s' $mark $branch $path $path)
    end

    # Prefer fzf (arrow keys + type-to-filter); fall back to a numbered prompt
    if type -q fzf
        set -l sel (printf '%s\n' $lines | fzf \
            --height=40% --reverse --ansi \
            --delimiter=\t --with-nth=1 \
            --prompt='worktree> ' \
            --header='↑↓ select · type to filter · enter to jump · esc to cancel')
        test -z "$sel"; and return 0
        cd (string split -f2 \t -- $sel)
        return 0
    end

    set -l i 1
    for line in $lines
        printf '%3d) %s\n' $i (string split -f1 \t -- $line)
        set i (math $i + 1)
    end
    read -P "Select worktree #: " -l choice
    test -z "$choice"; and return 0
    if not string match -qr '^[0-9]+$' -- $choice; or test $choice -lt 1; or test $choice -gt (count $lines)
        echo "wtcd: invalid selection '$choice'" >&2
        return 1
    end
    cd (string split -f2 \t -- $lines[$choice])
end
