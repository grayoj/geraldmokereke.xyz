---
title: "My Development Setup"
date: 2023-09-21T10:46:46+01:00
draft: false
ShowBreadCrumbs: true
tags: ["Programming", "Neovim", "Setup"]
cover:
  image: "https://i.ibb.co/Yc2FbML/Screenshot-2023-09-21-at-17-14-13.png"
  # can also paste direct link from external site
  # ex. https://i.ibb.co/K0HVPBd/paper-mod-profilemode.png
  alt: "My neovim environment, on Wezterm."
  caption: "My neovim environment on Wezterm."
  relative: false # To use relative path for cover image, used in hugo Page-bundles

showToc: true
---

> This article was created because of my guy,
> [Collins Ikotun](https://ng.linkedin.com/in/collins-ikotun-0a11a11b6), my vim
> convert! Also,
> [I use vim btw](https://www.reddit.com/r/linuxmemes/comments/pfv8hq/i_use_vim_btw/).

When I started off programming I really had a very wrong perception of a
"development environment" or "development setup." This led to me, eventually
wanting to do the most. Effectively creating an amazing workflow to most people
with very much reduced productivity. Now, I've come to realise that a
development setup isn't necessarily spawning an ultra wide $5,000 monitor. But
creating a very productive environment that maximises your experience and gets
the best out of your abilities.

## Starting hard with Vim

If I can remember correctly - my first experience with Vim - was being petrified
about getting stuck in an unusual terminal environment that I could not exit
easily. I tried everything. To even powering off my computer in fear of what I
had done. I attempted again, consulted Google. Nothing. Quit the terminal. I was
the [living meme on the Vim subreddit](https://i.redd.it/5yz0nnw08qm61.jpg) at
that point.

| ![Graph](https://i.ibb.co/rmm3F9d/vimmeme.jpg) |
| :--------------------------------------------: |
|                  Exiting Vim                   |

Reflecting on that and where I am today really makes me laugh. It was truly a
fun ride. That was early in the 2009s and 2010s. There was no "cool"
[LSPs (Language Server Protocol)](https://en.wikipedia.org/wiki/Language_Server_Protocol)
to do some autocomplete, no treesitter or any of the available cool integrations
today.

The advantages of Vim which I realised on the early onset were:

- **Extremely light and portable**: Vim was well suited to computers running on
  low memory or CPU. This was what made it gold to me. At that time, I was
  running netbeans on my system and it was causing a major lag.
- **Felt like a game**: Being a kid, I really enjoyed the odd keybindings it
  took to execute certain commands on my Vim. It gave me this game feeling and I
  absolutely enjoyed it.
- **The hollywood hacker persona**: Anytime my relatives came around for
  Christmas, Easter or any holidays - I would bam! Inside vim, inside a pile of
  long ass bash commands and disorganised C code to run a simple CLI calculator.
- **Keeping strangers off**: Anyone who got into Vim on my computer then, was
  basically confused. So this in a way was pretty helpful in keeping strangers
  off.

The problems I faced as of then was related to poor autocomplete, no cool
features and GUI like [codeblocks](https://www.codeblocks.org/) and
[netbeans](https://netbeans.apache.org/) gave me later on in my development
life. Hence, I eventually dropped Vim, landed upon Windows. The transition was
quite difficult. I struggled earlier on with the command prompt in Windows
because bash just seemed so much better.

## Visual Studio Code

I was basically a C programmer. I spent most of my time writing CLI
applications. From calculators, to minimalistic games. That was all I could
basically do. Till I came across JavaScript - which then changed my scope
in 2016. JavaScript was bubbling and I had hopped on the hype train. I learnt
JSON, JavaScript Syntax, Node JS and began to build browser based web pages at
that time. My first site was a single HTML page with a JavaScript implementation
popping my name up from nowhere which was pretty cool. Most tutorials I began to
follow all used a similar IDE. This was
[Visual Studio Code](https://code.visualstudio.com/), and eventually I picked it
up to be in sync with the tutorials I watched.

Boy. I loved it. I could install so many cool extensions that I wasn't privy to
on my Vim. It seemed like my development was getting better. I enjoyed the
syntax highlighting, integrated terminal - the search feature. It was crazy.
Fast forward, I got so sucked up into the GUI crew that I began to handle by Git
workflow via a GUI. My first Github account came out the following year or two
years with the username [Mgeraldoj](https://github.com/mgeraldoj) which
unfortunately, I pretty much lost access to.

I was a VScode ambassador at that point, cycling through crazy themes,
extensions and essentially making my RAM and CPU regret being in my hands -
which I didn't realise anyways. One day, I stumbled across a
[post that talked
about the Vim Plugin in VScode](https://medium.com/swlh/the-best-of-both-worlds-visual-studio-code-vim-f8e343eb070f).
I was instantly hooked. I tried it out. I won't lie, i was embarrassingly rusty.
I eventually started using it then dropped it again, to lay back on VSCode's own
keybindings.

What changed it?

## Vim again

had I had a whole lot of channels I watched on YouTube then to keep me
motivated. I used these channels as _background noise_. One of my favourite
channels as of the time was the
[George Hotz Archive](https://www.youtube.com/@geohotarchive) that would
eventually hook me on Vim, again.

{{< youtube hYxwe-bYkrU >}}

[George Hotz](https://en.wikipedia.org/wiki/George_Hotz) is a cool systems
level programmer I followed for many reasons. I mean, it seemed like he loved C
and the only thing with me that didn't sync with him, was his avid use of
Python.

I was blown away - he was extremely fast. I am trying to mimmick his movements
and I'm nothing close to him. He's in a terminal window, practically schooling
me on what it means to be productive. Questions were plopping into my head.

- How on earth, is he moving that fast?
- How does he jump between several terminal windows? What terminal does he use?
  Which tabs? But he's on a single tab.
- How does his Vim look like this? A little bit of syntax highlighting?
- HOW CAN I BE LIKE THIS?

I began to hunt very diligently for ideas to get a similar workflow. I copied
his Vim dotfiles, I essentially wrote some vimscript, set up keybindings. I was
still kind of abysmal. How was he jumping that fast between windows, I still
didn't know. My goodness, I wanted to just relapse on Visual Studio Code again,
but his workflow was so enticing to implement. I am running through articles on
Hackernews, Reddit before eventually stumbling across an editor that would
change my life and workflow. Neovim.

## Neovim

The articles, screenshots and forums I came across were buzzing about Neovim.
Infact - I succumbed quickly to the peer pressure. My first experience with
Neovim was trying to get the executable, like a `neovim.exe` installed on my
Windows machine? Hey. Laugh all you want, sucker. It proved otherwise. Something
beautiful I appreciated about the Neovim community was how much exposure I got
to CLI based tooling, and even WSL (Windows Subsytem for Linux). Sooner or
later, I had told my best friend - I was moving off the Windows train.

Attempting to relive the past moments. In less than a year, I had ported fully
to Ubuntu, a
[debian distribution of Linux](https://ubuntu.com/download/desktop). I did not
regret. I truly recommend except you're someone who is heavily invested on the
[C# and .NET staCK](https://dotnet.microsoft.com/en-us/languages/csharp),
[Windows Server](https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwi4zPSniLyBAxUMx-0KHaoSCA8YABARGgJkZw&ase=2&gclid=Cj0KCQjw06-oBhC6ARIsAGuzdw3NJVuBHK57kgmLNRnSBDDRKCpy1OInak3WsRCRSb5Wd9UIFYKLO0MaAgZ5EALw_wcB&ohost=www.google.com&cid=CAESa-D2XMkE3sPtkgeZd3TvUlsHOeIb59zsZgXVkoWmhu29fPPkVnzqxXjqqpLinNpb2hx-trZEffAEnppAxvTNAZw416vsQsmA7moHV6shxYKrrB0ptGHrLC3rZl1uxRjEdBKzj8U0zSTK_lz_&sig=AOD64_2Z6W0n9uLf1C9GyWtZu_BpVUuBcA&q&nis=4&adurl&ved=2ahUKEwjD9-yniLyBAxUViVwKHd81CP0Q0Qx6BAgKEAE)
and Microsoft platform? You should definitely port to Linux. I promise you, that
you would enjoy it and become really productive. You escape the .exe and MSI
installers for packages and that disgusting font called
[Consolas](https://www.reddit.com/r/vscode/comments/ftmehh/why_does_the_consolas_font_look_weird_on_vs_code/)
or
["Segoe EWWW I" (Segoe UI)](https://www.ghisler.ch/board/viewtopic.php?t=38214).

In general, Neovim was amazing. It was basically an improved version or
distribution of Vim, packed with a lot of features. This time, you would write
your configurations in a programming language called [Lua](https://www.lua.org/)
which is a really easy to understand and intuitive language. Guess what this
meant? Yes.

> No more Vimscript (`.Vimrc`) again for configurations.

What did this mean? The advent of
[Language Server Protocols](https://en.wikipedia.org/wiki/Language_Server_Protocol)
providing _intellisense_ to a language such as autocomplete, suggestions and
snippets. Speeding up my productivity. Not to mention, other features of an IDE,
like a status bar, a file explorer called a **NerdTree** - the formatters, the
debuggers, the syntax highlighting thanks to **treesitter** and oh baby, we were
ready to do madness with all of these.

At that moment, I was like Ben 10 discovering something greater than the
[ultimatrix](<https://ben10.fandom.com/wiki/Ultimatrix_(Original)>). Neovim, was
the next big thing. The community too was fantastic.

## Losing my configurations

My basic Neovim setup was absolutely not minimalistic. It was bloated. A cool
background colour which would fry my eyes today and some other configurations.
At the basic level this was the most important components of my configuration:

- The status-line. I needed to see the name of my file, the branch I was on. The
  LSP that was active. Hoe many lines and columns I was on, and so on.
- Telescope. I wanted to search through my files easily, without the `grep`.
- The Nerdtree, because nobody is writing code without a file explorer or way to
  navigate.
- Treesitter.
- Git integrations.
- Glyphs which looked pretty cool when I used and installed a nerdfont.
- An integrated terminal, which I would end up not using that much after
  figuring out why
  [Hotz was so productive](https://www.reddit.com/r/vim/comments/ey78p3/vimmers_with_heavy_configs_every_thought_about/).

Those were the basic building blocks of my neovim configurations. The rest, were
well - excess. But nevermind - how about you check out my configurations?

## My Development environment

tl:dr?

Okay, so what's my setup exactly? You'd be surprised to find out how extremely
minimalistic it is, compared to the bloatware I had before. I'll start off with
the editors I use at the basic level.

- Neovim.
- Intelli J IDEA \*
- Visual Studio Code \*
- Tmux a multiplexer. Lets me use one tab, create multiple windows.
- Starship.rs
- Zsh
- Fish Shell
- Alacritty terminal
- Wezterm terminal

I use Neovim for basically everything. You'd find me on Intelli J when on Java
based projects for example with
[Spring Boot](https://spring.io/projects/spring-boot) or on Scala based
projects. This is because I genuinely believe the experience of Intelli J for
Java, Scala and Kotlin projects is absolutely unbeatable. Would still use vim
for editing. I also use Visual Studio Code as well for remote server, and very
occasionally. I am also fond of this recent IDE called [Zed](https://zed.dev/)
due to their early support for Elixir.

### Setting up Neovim

My neovim is quite minimalistic as possible, to start with to maximise my
productivity and efficiency. In order to get the best out of my neovim with
liberty to still make certain edits to my experience, I use a Neovim
distribution popularly known as [Nvchad](https://nvchad.com/docs/features). Now
there are several distributions, where you can choose from such as
[Astrovim](https://astronvim.com/) and [Lunarvim](https://www.lunarvim.org/),
but I find Nvchad better, and I've gotten used to it. You can set up Nvchad by
[visiting their documentation](https://nvchad.com/docs/features). Maybe you'd be
"chad" enough.

Like I said my configuration is minimalistic and the only thing that changes is
my theme. I use the [Grubvox](https://github.com/morhetz/gruvbox) theme.
Possibly because it's easier on the eyes, for me.

```lua
-- chadrc.lua
---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "gruvbox",
  theme_toggle = { "gruvbox", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
```

I customised my statusbar and nerdtree, which I would provide in a
[github repository]() for you to access. This is basically the plugins,
otherwise LSPs I use currently if you're interested in having an overview:

```lua
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "gopls", "tailwindcss", "rust_analyzer", "marksman", "jsonls", "sqlls", "pyright" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
```

I use the above plugins for HTML, CSS, Typescript, C/C++, Go, Tailwind, Rust,
Markdown, JSON, SQL and Python - basically. The tools I find myself using daily.
I also have some formatters configured with prettier to improve my code
readability and add automatic indentations to languages like Python - for
example. Setting up Ncvhad solves your IDE problem.

### Tmux

[Tmux is a multiplexer](https://github.com/tmux/tmux/wiki) that I find pretty
cool. It enables you create sessions, windows and hop in between them through
keybindings. My tmux configuration is quite straightforward and minimalistic
too. All you have to do, is to create a `tmux.conf`. This is a sample
configuration of mine:

```conf
set -g @plugim 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

run '~/.tmux/plugins/tpm/tpm'
```

Here I am using a tool called
[tpm (tmux package manager)](https://github.com/tmux-plugins/tpm) to install
plugins for Tmux that I would use. As you can see, I do not really use so much
plugins. Like I said, I keep it minimal and simple.

### Starship.rs

[Starship is a customisable prompt for any shell](https://starship.rs) I just
use this, because it's a pretty good prompt. You can install this via
[Homebrew](https://brew.sh) my favourite package manager for Unix/Linux systems.
It's actually written in rust. Need I say, you'd be quite concerned as we go
along how many rust tooling I use in my workflow despite not being an avid Rust
programmer myself. This is my starship configuration below in TOML, incase you
want to use it:

```toml
format = """
$username\
$hostname\
$directory\
$git_branch\
$git_state\
$git_status\
$cmd_duration\
$line_break\
$python\
$character"""

[directory]
style = "blue"

[character]
success_symbol = "[❯](purple)"
error_symbol = "[❯](red)"
vimcmd_symbol = "[❮](green)"

[git_branch]
format = "[$branch]($style)"
style = "bright-black"

[git_status]
format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)"
style = "cyan"
conflicted = "​"
untracked = "​"
modified = "​"
staged = "​"
renamed = "​"
deleted = "​"
stashed = "≡"

[git_state]
format = '\([$state( $progress_current/$progress_total)]($style)\) '
style = "bright-black"

[cmd_duration]
format = "[$duration]($style) "
style = "yellow"

[python]
format = "[$virtualenv]($style) "
style = "bright-black"
```

That's my starship configuration!

### Zsh and Fish shell configurations

You should know what
[zsh](<https://en.wikipedia.org/wiki/Z_shell#:~:text=The%20Z%20shell%20(Zsh)%20is,Z%20shell>)
is. The only new thing here is [Fish Shell](https://fishshell.com/) which is
pretty cool because it comes packed with autosuggestions. I find this extremely
useful because: You cannot remember your folder directories all the time, it's
fast and you do not have to punch `ls -la` to see your files. These are my fish
variables:

```shell
# This file contains fish universal variable definitions.
# VERSION: 3.0
SETUVAR __fish_initialized:3400
SETUVAR fish_color_autosuggestion:555\x1ebrblack
SETUVAR fish_color_cancel:\x2dr
SETUVAR fish_color_command:blue
SETUVAR fish_color_comment:red
SETUVAR fish_color_cwd:green
SETUVAR fish_color_cwd_root:red
SETUVAR fish_color_end:green
SETUVAR fish_color_error:brred
SETUVAR fish_color_escape:brcyan
SETUVAR fish_color_history_current:\x2d\x2dbold
SETUVAR fish_color_host:normal
SETUVAR fish_color_host_remote:yellow
SETUVAR fish_color_normal:normal
SETUVAR fish_color_operator:brcyan
SETUVAR fish_color_param:cyan
SETUVAR fish_color_quote:yellow
SETUVAR fish_color_redirection:cyan\x1e\x2d\x2dbold
SETUVAR fish_color_search_match:bryellow\x1e\x2d\x2dbackground\x3dbrblack
SETUVAR fish_color_selection:white\x1e\x2d\x2dbold\x1e\x2d\x2dbackground\x3dbrblack
SETUVAR fish_color_status:red
SETUVAR fish_color_user:brgreen
SETUVAR fish_color_valid_path:\x2d\x2dunderline
SETUVAR fish_key_bindings:fish_default_key_bindings
SETUVAR fish_pager_color_completion:normal
SETUVAR fish_pager_color_description:B3A06D\x1eyellow\x1e\x2di
SETUVAR fish_pager_color_prefix:normal\x1e\x2d\x2dbold\x1e\x2d\x2dunderline
SETUVAR fish_pager_color_progress:brwhite\x1e\x2d\x2dbackground\x3dcyan
SETUVAR fish_pager_color_selected_background:\x2dr
```

This is my `fish.conf`, again minimalistic as possible:

```bash
if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
```

### Alacritty Terminal

Alacritty is a rust based terminal - that can be configured using `Yaml`. It's
pretty fast, and I do not code outside Alacritty except it's
[Wezterm](https://wezfurlong.org/wezterm/index.html) due to the efficiency and
the performance. You can visit
[Alacritty's site here for installations](https://alacritty.org/).

This is my `Yaml`, which I used to configure my use. I borrowed the
configuration anyways. I just use **Grubvox** as my theme, and the basics again:

You can pick the preconfigured theme you want below.

```yml
-- alacritty,yml
font:
  size: 14
  normal:
    # family: "Cousine Nerd Font Mono"
    family: "FiraCode Nerd Font Mono"
cursor:
  unfocused_hollow: true
  style:
    blinking: Never

scrolling:
  history: 2000
  auto_scroll: true

#######################################
##      START OF COLOR SCHEMES       ##
#######################################
schemes:
  ### Doom One ###
  doom-one: &doom-one
    primary:
      background: '#282c34'
      foreground: '#bbc2cf'
    cursor:
      text: CellBackground
      cursor: '#528bff'
    selection:
      text: CellForeground
      background: '#3e4451'
    normal:
      black:   '#1c1f24'
      red:     '#ff6c6b'
      green:   '#98be65'
      yellow:  '#da8548'
      blue:    '#51afef'
      magenta: '#c678dd'
      cyan:    '#5699af'
      white:   '#202328'
    bright:
      black:   '#5b6268'
      red:     '#da8548'
      green:   '#4db5bd'
      yellow:  '#ecbe7b'
      blue:    '#3071db'   # This is 2257a0 in Doom Emacs but I lightened it.
      magenta: '#a9a1e1'
      cyan:    '#46d9ff'
      white:   '#dfdfdf'

  ### Dracula ###
  dracula: &dracula
    primary:
      background: '#282a36'
      foreground: '#f8f8f2'

    vi_mode_cursor:
      text: CellBackground
      cursor: CellForeground
    search:
      matches:
        foreground: '#44475a'
        background: '#50fa7b'
      focused_match:
        foreground: '#44475a'
        background: '#ffb86c'
      bar:
        background: '#282a36'
        foreground: '#f8f8f2'
    line_indicator:
      foreground: None
      background: None
    selection:
      text: CellForeground
      background: '#44475a'
    normal:
      black:   '#000000'
      red:     '#ff5555'
      green:   '#50fa7b'
      yellow:  '#f1fa8c'
      blue:    '#bd93f9'
      magenta: '#ff79c6'
      cyan:    '#8be9fd'
      white:   '#bfbfbf'
    bright:
      black:   '#4d4d4d'
      red:     '#ff6e67'
      green:   '#5af78e'
      yellow:  '#f4f99d'
      blue:    '#caa9fa'
      magenta: '#ff92d0'
      cyan:    '#9aedfe'
      white:   '#e6e6e6'
    dim:
      black:   '#14151b'
      red:     '#ff2222'
      green:   '#1ef956'
      yellow:  '#ebf85b'
      blue:    '#4d5b86'
      magenta: '#ff46b0'
      cyan:    '#59dffc'
      white:   '#e6e6d1'

  ### Gruvbox dark ###
  gruvbox-dark: &gruvbox-dark
    # Default colors
    primary:
      # hard contrast: background = '0x1d2021'
      background: '#1b1b1b'
      # soft contrast: background = '0x32302f'
      foreground: '#ebdbb2'

    # Normal colors
    normal:
      black:   '#282828'
      red:     '#cc241d'
      green:   '#98971a'
      yellow:  '#d79921'
      blue:    '#458588'
      magenta: '#b16286'
      cyan:    '#689d6a'
      white:   '#a89984'

    # Bright colors
    bright:
      black:   '#928374'
      red:     '#fb4934'
      green:   '#b8bb26'
      yellow:  '#fabd2f'
      blue:    '#83a598'
      magenta: '#d3869b'
      cyan:    '#8ec07c'
      white:   '#ebdbb2'

### Monokai ###
  monokai-pro: &monokai-pro
    # Default colors
    primary:
      background: '#2D2A2E'
      foreground: '#FCFCFA'

    # Normal colors
    normal:
      black:   '#403E41'
      red:     '#FF6188'
      green:   '#A9DC76'
      yellow:  '#FFD866'
      blue:    '#FC9867'
      magenta: '#AB9DF2'
      cyan:    '#78DCE8'
      white:   '#FCFCFA'

    # Bright colors
    bright:
      black:   '#727072'
      red:     '#FF6188'
      green:   '#A9DC76'
      yellow:  '#FFD866'
      blue:    '#FC9867'
      magenta: '#AB9DF2'
      cyan:    '#78DCE8'
      white:   '#FCFCFA'

  ### Nord ###
  nord: &nord
    # Default colors
    primary:
      background: '#2E3440'
      foreground: '#D8DEE9'

    # Normal colors
    normal:
      black:   '#3B4252'
      red:     '#BF616A'
      green:   '#A3BE8C'
      yellow:  '#EBCB8B'
      blue:    '#81A1C1'
      magenta: '#B48EAD'
      cyan:    '#88C0D0'
      white:   '#E5E9F0'

    # Bright colors
    bright:
      black:   '#4C566A'
      red:     '#BF616A'
      green:   '#A3BE8C'
      yellow:  '#EBCB8B'
      blue:    '#81A1C1'
      magenta: '#B48EAD'
      cyan:    '#8FBCBB'
      white:   '#ECEFF4'

  ### Oceanic Next ###
  oceanic-next: &oceanic-next
    # Default colors
    primary:
      background: '#1b2b34'
      foreground: '#d8dee9'

    # Colors the cursor will use if `custom_cursor_colors` is true
    cursor:
      text: '#1b2b34'
      cursor: '#ffffff'

    # Normal colors
    normal:
      black:   '#343d46'
      red:     '#EC5f67'
      green:   '#99C794'
      yellow:  '#FAC863'
      blue:    '#6699cc'
      magenta: '#c594c5'
      cyan:    '#5fb3b3'
      white:   '#d8dee9'

    # Bright colors
    bright:
      black:   '#343d46'
      red:     '#EC5f67'
      green:   '#99C794'
      yellow:  '#FAC863'
      blue:    '#6699cc'
      magenta: '#c594c5'
      cyan:    '#5fb3b3'
      white:   '#d8dee9'

  ### Solarized Light ###
  solarized-light: &solarized-light
    # Default colors
    primary:
      background: '#fdf6e3' # base3
      foreground: '#657b83' # base00

    # Cursor colors
    cursor:
      text:   '#fdf6e3' # base3
      cursor: '#657b83' # base00

    # Normal colors
    normal:
      black:   '#073642' # base02
      red:     '#dc322f' # red
      green:   '#859900' # green
      yellow:  '#b58900' # yellow
      blue:    '#268bd2' # blue
      magenta: '#d33682' # magenta
      cyan:    '#2aa198' # cyan
      white:   '#eee8d5' # base2

    # Bright colors
    bright:
      black:   '#002b36' # base03
      red:     '#cb4b16' # orange
      green:   '#586e75' # base01
      yellow:  '#657b83' # base00
      blue:    '#839496' # base0
      magenta: '#6c71c4' # violet
      cyan:    '#93a1a1' # base1
      white:   '#fdf6e3' # base3

  ### Solarized Dark ###
  solarized-dark: &solarized-dark
    # Default colors
    primary:
      background: '#002b36' # base03
      foreground: '#839496' # base0

    # Cursor colors
    cursor:
      text:   '#002b36' # base03
      cursor: '#839496' # base0

    # Normal colors
    normal:
      black:   '#073642' # base02
      red:     '#dc322f' # red
      green:   '#859900' # green
      yellow:  '#b58900' # yellow
      blue:    '#268bd2' # blue
      magenta: '#d33682' # magenta
      cyan:    '#2aa198' # cyan
      white:   '#eee8d5' # base2

    # Bright colors
    bright:
      black:   '#002b36' # base03
      red:     '#cb4b16' # orange
      green:   '#586e75' # base01
      yellow:  '#657b83' # base00
      blue:    '#839496' # base0
      magenta: '#6c71c4' # violet
      cyan:    '#93a1a1' # base1
      white:   '#fdf6e3' # base3

  ### Tomorrow Night ###
  tomorrow-night: &tomorrow-night
     # Default colors
    primary:
      background: '#1d1f21'
      foreground: '#c5c8c6'

    # Colors the cursor will use if `custom_cursor_colors` is true
    cursor:
      text: '#1d1f21'
      cursor: '#ffffff'

    # Normal colors
    normal:
      black:   '#1d1f21'
      red:     '#cc6666'
      green:   '#b5bd68'
      yellow:  '#e6c547'
      blue:    '#81a2be'
      magenta: '#b294bb'
      cyan:    '#70c0ba'
      white:   '#373b41'

    # Bright colors
    bright:
      black:   '#666666'
      red:     '#ff3334'
      green:   '#9ec400'
      yellow:  '#f0c674'
      blue:    '#81a2be'
      magenta: '#b77ee0'
      cyan:    '#54ced6'
      white:   '#282a2e'

  ### moonfly ###
  moonfly: &moonfly
     # Default colors
    primary:
      background: '#080808'
      foreground: '#b2b2b2'

    # Colors the cursor will use if `custom_cursor_colors` is true
    cursor:
      text: '#080808'
      cursor: '#b2b2b2'

    # Normal colors
    normal:
      black:   '#323437'
      red:     '#ff5454'
      green:   '#8cc85f'
      yellow:  '#e3c78a'
      blue:    '#80a0ff'
      magenta: '#d183e8'
      cyan:    '#79dac8'
      white:   '#c6c6c6'

    # Bright colors
    bright:
      black:   '#949494'
      red:     '#ff5189'
      green:   '#36c692'
      yellow:  '#bfbf97'
      blue:    '#74b2ff'
      magenta: '#ae81ff'
      cyan:    '#85dc85'
      white:   '#e4e4e4'

# Colors (PaperColor - Light)

  ### papercolor ###
  papercolor: &papercolor

  # Default colors
    primary:
      background: '0xeeeeee'
      foreground: '0x878787'

    cursor:
      text: '0xeeeeee'
      cursor: '0x878787'

  # Normal colors
    normal:
      black:   '0xeeeeee'
      red:     '0xaf0000'
      green:   '0x008700'
      yellow:  '0x5f8700'
      blue:    '0x0087af'
      magenta: '0x878787'
      cyan:    '0x005f87'
      white:   '0x444444'

  # Bright colors
    bright:
      black:   '0xbcbcbc'
      red:     '0xd70000'
      green:   '0xd70087'
      yellow:  '0x8700af'
      blue:    '0xd75f00'
      magenta: '0xd75f00'
      cyan:    '0x005faf'
      white:   '0x005f87'
colors: *moonfly


######################################################################
## SET THEME: Choose ONE color scheme from those in the above list. ##
## ###################################################################
# Available themes are:
# *doom-one
# *dracula
# *gruvbox-dark
# *monokai-pro
# *nord
# *oceanic-next
# *solarized-light
# *solarized-dark
# *tomorrow-night

colors: *gruvbox-dark

#######################################
##       END OF COLOR SCHEMES        ##
#######################################
```

That's my alacritty configuration. Next is my Wezterm, which I am using now
apparently and starting to like way too much.

### Wezterm

[Wezterm](https://wezfurlong.org/wezterm/index.html) is written in rust, again.
Crazy I know. Rust is pretty much carrying the cool development tools at this
point. Wezterm is very performant. It runs pretty smoothly and is configured via
Lua just like neovim. Here is my dotfile for wezterm, incase you are interested:

```lua
-- .wezterm.lua
-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "GruvboxDarkHard"

config.font = wezterm.font("Operator Mono SSm Lig")
-- config.font = wezterm.font 'FiraCode Nerd Font Mono'

-- and finally, return the configuration to wezterm
return config
```

That's it. That is pretty much my configuration at this point, not such a
complicated setup to implement and be productive with, right? If you have any
suggestions to improving my workflow, any advice too - shoot me a
[mail and I would surely get back](https://mailto:geraldmokereke@gmail.com/).
