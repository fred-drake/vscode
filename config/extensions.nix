####################################
# Auto-generated -- do not modify! #
####################################
{
  pkgs,
  lib,
}: let
  inherit (pkgs.stdenv) isDarwin isLinux isi686 isx86_64 isAarch32 isAarch64;
  vscode-utils = pkgs.vscode-utils;
  merge = lib.attrsets.recursiveUpdate;
in
  merge
  (merge
    (merge
      (merge
        {
          "esbenp"."prettier-vscode" = vscode-utils.extensionFromVscodeMarketplace {
            name = "prettier-vscode";
            publisher = "esbenp";
            version = "11.0.0";
            sha256 = "1fcz8f4jgnf24kblf8m8nwgzd5pxs2gmrv235cpdgmqz38kf9n54";
          };
          "eamodio"."gitlens" = vscode-utils.extensionFromVscodeMarketplace {
            name = "gitlens";
            publisher = "eamodio";
            version = "2025.2.1204";
            sha256 = "0n3pr5sw8bivi570whxn0v6d0xn77azg2v23wa3vdmjykmfsfbyz";
          };
          "pkief"."material-icon-theme" = vscode-utils.extensionFromVscodeMarketplace {
            name = "material-icon-theme";
            publisher = "pkief";
            version = "5.19.0";
            sha256 = "16ly295r3ibi42dhj24iks7b8mz0blw4mrq6g9v7w3l1lf45y3cf";
          };
          "ms-vscode-remote"."remote-ssh" = vscode-utils.extensionFromVscodeMarketplace {
            name = "remote-ssh";
            publisher = "ms-vscode-remote";
            version = "0.118.2025021215";
            sha256 = "1as2n5plidn5s8zsv5abp7b2kzjar17f5gkikfawykkrwcrpl7fv";
          };
          "ms-dotnettools"."vscode-dotnet-runtime" = vscode-utils.extensionFromVscodeMarketplace {
            name = "vscode-dotnet-runtime";
            publisher = "ms-dotnettools";
            version = "2.2.8";
            sha256 = "1k4d7idgkmf8py47hf911n22cjmaj8s6z7p9ijcr02whl68j9p6m";
          };
          "golang"."go" = vscode-utils.extensionFromVscodeMarketplace {
            name = "go";
            publisher = "golang";
            version = "0.45.1";
            sha256 = "0i04669vsxn3ms8zsd1dyfy9446hpf6029pj352sda25ap3wi7hw";
          };
          "donjayamanne"."githistory" = vscode-utils.extensionFromVscodeMarketplace {
            name = "githistory";
            publisher = "donjayamanne";
            version = "0.6.20";
            sha256 = "0x9q7sh5l1frpvfss32ypxk03d73v9npnqxif4fjwcfwvx5mhiww";
          };
          "editorconfig"."editorconfig" = vscode-utils.extensionFromVscodeMarketplace {
            name = "editorconfig";
            publisher = "editorconfig";
            version = "0.17.0";
            sha256 = "0yqw6hvypzpw10m3m967hk5daxp6gyjdaxmbh414n5qmlv8bzmgw";
          };
          "oderwat"."indent-rainbow" = vscode-utils.extensionFromVscodeMarketplace {
            name = "indent-rainbow";
            publisher = "oderwat";
            version = "8.3.1";
            sha256 = "0iwd6y2x2nx52hd3bsav3rrhr7dnl4n79ln09picmnh1mp4rrs3l";
          };
          "vscodevim"."vim" = vscode-utils.extensionFromVscodeMarketplace {
            name = "vim";
            publisher = "vscodevim";
            version = "1.29.0";
            sha256 = "1r29gd6na3gyc38v8ynmc2c46mi38zms1p87y65v9n2rj94pqx97";
          };
          "mikestead"."dotenv" = vscode-utils.extensionFromVscodeMarketplace {
            name = "dotenv";
            publisher = "mikestead";
            version = "1.0.1";
            sha256 = "0rs57csczwx6wrs99c442qpf6vllv2fby37f3a9rhwc8sg6849vn";
          };
          "usernamehw"."errorlens" = vscode-utils.extensionFromVscodeMarketplace {
            name = "errorlens";
            publisher = "usernamehw";
            version = "3.23.0";
            sha256 = "100fp73c7pvnlmvc6bxxi7almbl2p58p2291zp6ajgxzix9wjgcv";
          };
          "gruntfuggly"."todo-tree" = vscode-utils.extensionFromVscodeMarketplace {
            name = "todo-tree";
            publisher = "gruntfuggly";
            version = "0.0.226";
            sha256 = "0yrc9qbdk7zznd823bqs1g6n2i5xrda0f9a7349kknj9wp1mqgqn";
          };
          "wayou"."vscode-todo-highlight" = vscode-utils.extensionFromVscodeMarketplace {
            name = "vscode-todo-highlight";
            publisher = "wayou";
            version = "1.0.5";
            sha256 = "1sg4zbr1jgj9adsj3rik5flcn6cbr4k2pzxi446rfzbzvcqns189";
          };
          "mtxr"."sqltools" = vscode-utils.extensionFromVscodeMarketplace {
            name = "sqltools";
            publisher = "mtxr";
            version = "0.28.3";
            sha256 = "0zs8gdfar6g7j1mybdrpx7rmydlb1smqicw9438hrfzw301cffkd";
          };
          "tamasfe"."even-better-toml" = vscode-utils.extensionFromVscodeMarketplace {
            name = "even-better-toml";
            publisher = "tamasfe";
            version = "0.21.2";
            sha256 = "0208cms054yj2l8pz9jrv3ydydmb47wr4i0sw8qywpi8yimddf11";
          };
          "be5invis"."vscode-custom-css" = vscode-utils.extensionFromVscodeMarketplace {
            name = "vscode-custom-css";
            publisher = "be5invis";
            version = "7.4.2";
            sha256 = "1k10k03al0lvj9zf5g9s8bgikq2l47ispgk5d7jnsj53dc2mkwdr";
          };
          "neikeq"."godot-csharp-vscode" = vscode-utils.extensionFromVscodeMarketplace {
            name = "godot-csharp-vscode";
            publisher = "neikeq";
            version = "0.2.1";
            sha256 = "04gm1k1kh6aa3yzrbjhby10ddqs8bmsikiii6syg78syhzxhzfxh";
          };
          "fnando"."linter" = vscode-utils.extensionFromVscodeMarketplace {
            name = "linter";
            publisher = "fnando";
            version = "0.0.19";
            sha256 = "13bllbxd7sy4qlclh37qvvnjp1v13al11nskcf2a8pmnmj455v4g";
          };
          "fill-labs"."dependi" = vscode-utils.extensionFromVscodeMarketplace {
            name = "dependi";
            publisher = "fill-labs";
            version = "0.7.13";
            sha256 = "1dsd4qal7wmhhbzv5jmcrf8igm20dnr256s2gp1m5myhj08qlzay";
          };
          "csharpier"."csharpier-vscode" = vscode-utils.extensionFromVscodeMarketplace {
            name = "csharpier-vscode";
            publisher = "csharpier";
            version = "2.0.6";
            sha256 = "14a8kyx68v1apdx9f3i9kdf1yl5a1065j4vbnrvbx71s2c3bwsii";
          };
          "rooveterinaryinc"."roo-cline" = vscode-utils.extensionFromVscodeMarketplace {
            name = "roo-cline";
            publisher = "rooveterinaryinc";
            version = "3.3.18";
            sha256 = "18jnw2lkzkb1nvkhzkix4hb5y8yvhd9zw1h4wb2j1yi86m50byp2";
          };
          "jnoortheen"."nix-ide" = vscode-utils.extensionFromVscodeMarketplace {
            name = "nix-ide";
            publisher = "jnoortheen";
            version = "0.4.12";
            sha256 = "0rdq9wnqfrj8k1g5fcaam5iahzd16bdpi3sa0n2gi0rh02kg55fy";
          };
          "mkhl"."direnv" = vscode-utils.extensionFromVscodeMarketplace {
            name = "direnv";
            publisher = "mkhl";
            version = "0.17.0";
            sha256 = "1n2qdd1rspy6ar03yw7g7zy3yjg9j1xb5xa4v2q12b0y6dymrhgn";
          };
          "gaborv"."flatbuffers" = vscode-utils.extensionFromVscodeMarketplace {
            name = "flatbuffers";
            publisher = "gaborv";
            version = "0.1.0";
            sha256 = "1jqa5824cv79w3xrln60k5i0s1l4l6qjvi9jkswy1rdd53b2csyx";
          };
          "skellock"."just" = vscode-utils.extensionFromVscodeMarketplace {
            name = "just";
            publisher = "skellock";
            version = "2.0.0";
            sha256 = "1ph869zl757a11f8iq643f79h8gry7650a9i03mlxyxlqmspzshl";
          };
          "signageos"."signageos-vscode-sops" = vscode-utils.extensionFromVscodeMarketplace {
            name = "signageos-vscode-sops";
            publisher = "signageos";
            version = "0.9.1";
            sha256 = "1wr9magp4961pady696wiv20zpdw0hz97anbqixyzzgrsbxajlbg";
          };
          "bluebrown"."yamlfmt" = vscode-utils.extensionFromVscodeMarketplace {
            name = "yamlfmt";
            publisher = "bluebrown";
            version = "0.1.4";
            sha256 = "0faff5dnaq26l6dwmrn6jmz4shphlaa174958x229jqpgcwli5cg";
          };
          "mobalic"."jetbrains-dark-theme" = vscode-utils.extensionFromVscodeMarketplace {
            name = "jetbrains-dark-theme";
            publisher = "mobalic";
            version = "3.1.0";
            sha256 = "1nyxasrnv1rhyk9dg92xldkmi8a1bqlkn53b6ygwgqnpxxpz7fqi";
          };
          "kamadorueda"."alejandra" = vscode-utils.extensionFromVscodeMarketplace {
            name = "alejandra";
            publisher = "kamadorueda";
            version = "1.0.0";
            sha256 = "1ncjzhrc27c3cwl2cblfjvfg23hdajasx8zkbnwx5wk6m2649s88";
          };
          "arr"."marksman" = vscode-utils.extensionFromVscodeMarketplace {
            name = "marksman";
            publisher = "arr";
            version = "0.3.4";
            sha256 = "1pvapvydbrlllhihy7bkgvz38851381fmcvwc3z2m3w6dpywaijm";
          };
          "rodrigocfd"."format-comment" = vscode-utils.extensionFromVscodeMarketplace {
            name = "format-comment";
            publisher = "rodrigocfd";
            version = "0.0.8";
            sha256 = "0kn56q9c94p74caaqhak67g9mwykbq34ksxbkv1jwnm2p3rvxgj6";
          };
          "gofenix"."go-lines" = vscode-utils.extensionFromVscodeMarketplace {
            name = "go-lines";
            publisher = "gofenix";
            version = "0.0.10";
            sha256 = "1w9zhw1y97ij1rrrfg84nw5wjj5ikbihhg2wwba80rh7fv2rq5xy";
          };
        }
        (lib.attrsets.optionalAttrs (isLinux && (isi686 || isx86_64)) {
          "ms-dotnettools"."csharp" = vscode-utils.extensionFromVscodeMarketplace {
            name = "csharp";
            publisher = "ms-dotnettools";
            version = "2.65.29";
            sha256 = "1gzn4qaamfzn2ikammqz8fjjhvizpysp0fa5b0rhhgy0m1b6yicn";
            arch = "linux-x64";
          };
          "ms-dotnettools"."csdevkit" = vscode-utils.extensionFromVscodeMarketplace {
            name = "csdevkit";
            publisher = "ms-dotnettools";
            version = "1.17.12";
            sha256 = "0q18vlwzzw0lvhlqh9anj65y0jgjdzhibqy3vy23s7dwwmxs7mdd";
            arch = "linux-x64";
          };
          "rust-lang"."rust-analyzer" = vscode-utils.extensionFromVscodeMarketplace {
            name = "rust-analyzer";
            publisher = "rust-lang";
            version = "0.4.2301";
            sha256 = "0spn80qmksbas727nazigr3kg872b9lrkxp4c5vl6zcpqbrjala0";
            arch = "linux-x64";
          };
          "continue"."continue" = vscode-utils.extensionFromVscodeMarketplace {
            name = "continue";
            publisher = "continue";
            version = "0.9.264";
            sha256 = "02wr6xkdyaw1pjirs26x1qj8095hrrzh8vjr0qv751mfcwxm6r5b";
            arch = "linux-x64";
          };
        }))
      (lib.attrsets.optionalAttrs (isLinux && (isAarch32 || isAarch64)) {
        "ms-dotnettools"."csharp" = vscode-utils.extensionFromVscodeMarketplace {
          name = "csharp";
          publisher = "ms-dotnettools";
          version = "2.65.29";
          sha256 = "1qs97ifz7fz3q5g4ss1nfll2h9m8fhzkgamhx9wnd6a9ndv7cv7b";
          arch = "linux-arm64";
        };
        "ms-dotnettools"."csdevkit" = vscode-utils.extensionFromVscodeMarketplace {
          name = "csdevkit";
          publisher = "ms-dotnettools";
          version = "1.17.12";
          sha256 = "17dnj8gbcbk27kgwls7msd90vg73b2q85426y0hjyharc2rjv9ka";
          arch = "linux-arm64";
        };
        "rust-lang"."rust-analyzer" = vscode-utils.extensionFromVscodeMarketplace {
          name = "rust-analyzer";
          publisher = "rust-lang";
          version = "0.4.2301";
          sha256 = "0ymiiplg1a9i4w0a06fsv82d0fka79gjnshrm3fwh3b62zxh424p";
          arch = "linux-arm64";
        };
        "continue"."continue" = vscode-utils.extensionFromVscodeMarketplace {
          name = "continue";
          publisher = "continue";
          version = "0.9.264";
          sha256 = "05zq4wil4gnhl2pd9g3rpq17589gmsb78z3m7381fszxk0pwcsg8";
          arch = "linux-arm64";
        };
      }))
    (lib.attrsets.optionalAttrs (isDarwin && (isi686 || isx86_64)) {
      "ms-dotnettools"."csharp" = vscode-utils.extensionFromVscodeMarketplace {
        name = "csharp";
        publisher = "ms-dotnettools";
        version = "2.65.29";
        sha256 = "0kisnczslalbw2ryh1wrkvyw7k7kc9d3qbihb5qgf9q59fb8zkrd";
        arch = "darwin-x64";
      };
      "ms-dotnettools"."csdevkit" = vscode-utils.extensionFromVscodeMarketplace {
        name = "csdevkit";
        publisher = "ms-dotnettools";
        version = "1.17.12";
        sha256 = "124gcj2691pxc6xnm4sp9sjngidsifghm2s7z4whci86yc9z6xvn";
        arch = "darwin-x64";
      };
      "rust-lang"."rust-analyzer" = vscode-utils.extensionFromVscodeMarketplace {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.2301";
        sha256 = "09aiwddr96mf6xwr0i5bvfa2bnqjfird9zyw38prxin3d9q02zn5";
        arch = "darwin-x64";
      };
      "continue"."continue" = vscode-utils.extensionFromVscodeMarketplace {
        name = "continue";
        publisher = "continue";
        version = "0.9.264";
        sha256 = "03yz16xk031qzq4jwywksrpk8kdwk6snlkz63p40p1ism20yiya8";
        arch = "darwin-x64";
      };
    }))
  (lib.attrsets.optionalAttrs (isDarwin && (isAarch32 || isAarch64)) {
    "ms-dotnettools"."csharp" = vscode-utils.extensionFromVscodeMarketplace {
      name = "csharp";
      publisher = "ms-dotnettools";
      version = "2.65.29";
      sha256 = "0a8qjb71pgm1mszn9g4l9zgp46x4swxi0rq7zixxr9v0dfyk5ghy";
      arch = "darwin-arm64";
    };
    "ms-dotnettools"."csdevkit" = vscode-utils.extensionFromVscodeMarketplace {
      name = "csdevkit";
      publisher = "ms-dotnettools";
      version = "1.17.12";
      sha256 = "02q9hxzqrrz49pa30hq795sbva395s5y3mg8f40j72718zzl16dr";
      arch = "darwin-arm64";
    };
    "rust-lang"."rust-analyzer" = vscode-utils.extensionFromVscodeMarketplace {
      name = "rust-analyzer";
      publisher = "rust-lang";
      version = "0.4.2301";
      sha256 = "0p5yra58by9jgq97wdd24hm73x5vryc6m79fqxihi07q0axskwl1";
      arch = "darwin-arm64";
    };
    "continue"."continue" = vscode-utils.extensionFromVscodeMarketplace {
      name = "continue";
      publisher = "continue";
      version = "0.9.264";
      sha256 = "06x144sz7zl8a4av34j1l0k2bg0aixif5avawkqb47gld8bpizfr";
      arch = "darwin-arm64";
    };
  })
