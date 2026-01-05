# Only load these on a Shopify machine
shopify_machine || return

eval "$(wcd --init zsh)"
