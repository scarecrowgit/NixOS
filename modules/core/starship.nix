{ ... }:
{
  home-manager.sharedModules = [
    (_: {
      programs.starship = {
        enable = true;
        settings = {
          add_newline = true;
          command_timeout = 500;
          format = ''
            [┌───────────────────────────────────────────────────>](bold green)
            [│](bold green)$directory$git_branch$git_status$python$kubernetes$rust$golang$docker_context$nix_shell
            [└─>](bold green) '';
          character = {
            success_symbol = "[➜](bold green)";
            error_symbol = "[✗](bold red)";
          };
          directory = {
            truncation_length = 3;
            truncate_to_repo = true;
            format = "[$path]($style)[$read_only]($read_only_style) ";
            style = "bold cyan";
            read_only = " 🔒";
            truncation_symbol = "…/";
          };
          git_branch = {
            symbol = "🌱 ";
            format = "on [$symbol$branch]($style) ";
            style = "bold purple";
          };
          git_status = {
            format = ''([\[$all_status$ahead_behind\]]($style) )'';
            style = "bold red";
            conflicted = "🏳";
            ahead = "⇡\${count}";
            behind = "⇣\${count}";
            diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
            untracked = "🤷";
            stashed = "📦";
            modified = "📝";
            staged = ''[++\($count\)](green)'';
            renamed = "👅";
            deleted = "🗑";
          };
          python = {
            symbol = "🐍 ";
            format = ''via [$\{symbol}$\{pyenv_prefix}($\{version} )(\($virtualenv\) )]($style)'';
            style = "yellow bold";
            pyenv_version_name = false;
          };
          nodejs = {
            disabled = true;
            symbol = "⬢ ";
            format = "via [$symbol($version )]($style)";
            style = "bold green";
          };
          kubernetes = {
            symbol = "☸ ";
            format = ''via [$symbol$context( \($namespace\))]($style) '';
            style = "cyan bold";
            disabled = false;
          };
          rust = {
            symbol = "🦀 ";
            format = "via [$symbol($version )]($style)";
            style = "bold red";
          };
          golang = {
            symbol = "🐹 ";
            format = "via [$symbol($version )]($style)";
            style = "bold cyan";
          };
          docker_context = {
            symbol = "🐳 ";
            format = "via [$symbol$context]($style) ";
            style = "blue bold";
            only_with_files = true;
          };
          cmd_duration = {
            min_time = 500;
            format = "took [$duration]($style) ";
            style = "bold yellow";
          };
          time = {
            disabled = true;
            format = ''🕙[\[ $time \]]($style) '';
            time_format = "%T";
            style = "bold white";
          };
          nix_shell = {
            symbol = "❄️ ";
            format = "[$symbol]($style)";
          };
        };
      };
    })
  ];
}
