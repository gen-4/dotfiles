function fish_is_root_user --description "Check if the user is root"
    if test "$EUID" = 0 2>/dev/null
        return 0
    end

    if contains -- $USER root toor Administrator
        return 0
    end

    return 1
end
