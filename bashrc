# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

#-------------------------

# System suspend command
alias sleep='systemctl suspend'

# GPU fan control
/home/sofia/linux-backup/custom-commands/gpu_fan_control.sh &

#find cuda
export PATH=/run/media/sofia/More\ Apps_Personal/cuda/cuda-12.8/bin:$PATH

coffee() {
    if [[ -z "$1" ]]; then
        echo "Usage: coffee <minutes>"
        return 1
    fi
    echo "Keeping system awake for $1 minutes..."
    systemd-inhibit --what=idle sleep $(( $1 * 60 ))
}
