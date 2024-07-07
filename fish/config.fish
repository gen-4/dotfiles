if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x JAVA_HOME /usr/share/jvm/jdk-22.0.1
fish_add_path $JAVA_HOME

set -x STARSHIP_CONFIG ~/.config/starship/starship.toml

function starship_transient_prompt_func
  starship module character
end
starship init fish | source
enable_transience

