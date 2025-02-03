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
            version = "2025.2.104";
            sha256 = "06hsc73qkmhkmfiprayvg9c82xx3s4ch3br3h927ng14a8avnrkx";
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
            version = "0.117.2025013120";
            sha256 = "0n6mf08b7d9swcd0iyk3bsr01rhinavjavdm7r0wdlc7c6b6fqdv";
          };
          "ms-dotnettools"."vscode-dotnet-runtime" = vscode-utils.extensionFromVscodeMarketplace {
            name = "vscode-dotnet-runtime";
            publisher = "ms-dotnettools";
            version = "2.2.6";
            sha256 = "0qg9lxx2j9bk42yfdljlb2j1lgcicx1xf99kdb71247rzi65rq24";
          };
          "golang"."go" = vscode-utils.extensionFromVscodeMarketplace {
            name = "go";
            publisher = "golang";
            version = "0.45.0";
            sha256 = "1ihy5pd5ymxarcgnq8ky7nfa9kk9x3hdazajirrh5f1m4cwgizn3";
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
            version = "0.16.4";
            sha256 = "0fa4h9hk1xq6j3zfxvf483sbb4bd17fjl5cdm3rll7z9kaigdqwg";
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
            version = "2.0.3";
            sha256 = "19c9bkvm9snsqsq0s7m1py5y1g28qcim0j4d1rxnr39giw87dva4";
          };
          "rooveterinaryinc"."roo-cline" = vscode-utils.extensionFromVscodeMarketplace {
            name = "roo-cline";
            publisher = "rooveterinaryinc";
            version = "3.3.9";
            sha256 = "1r0v0gblzzgb9w92zvvx55d1m2ya4p1zlckmjhwk02q0gg47cwf7";
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
            version = "2.63.31";
            sha256 = "151dnsyd7q5cx06msdfv6i2kwqw4r44ydgpxgyrsvffzyydb8ka0";
            arch = "linux-x64";
          };
          "ms-dotnettools"."csdevkit" = vscode-utils.extensionFromVscodeMarketplace {
            name = "csdevkit";
            publisher = "ms-dotnettools";
            version = "1.16.4";
            sha256 = "1i6cyyhfbr48d1qjfymjb1xbm82cyq9rs3vd37fi0hf2x323w4aj";
            arch = "linux-x64";
          };
          "rust-lang"."rust-analyzer" = vscode-utils.extensionFromVscodeMarketplace {
            name = "rust-analyzer";
            publisher = "rust-lang";
            version = "0.4.2290";
            sha256 = "184ssvrixx739g37ix5nj2zd2fvzg98z8shvw5jrmxmylwb46nn1";
            arch = "linux-x64";
          };
          "continue"."continue" = vscode-utils.extensionFromVscodeMarketplace {
            name = "continue";
            publisher = "continue";
            version = "0.9.259";
            sha256 = "0mkfm6107zi1hnidrl74qhpnd9bdjld4gzfas4rfh8mpvbvbjsjg";
            arch = "linux-x64";
          };
        }))
      (lib.attrsets.optionalAttrs (isLinux && (isAarch32 || isAarch64)) {
        "ms-dotnettools"."csharp" = vscode-utils.extensionFromVscodeMarketplace {
          name = "csharp";
          publisher = "ms-dotnettools";
          version = "2.63.31";
          sha256 = "1q9ll4m0f0zf0d0bnh4i56cwbqmamf77f6aqbsmfarclhil7rr2f";
          arch = "linux-arm64";
        };
        "ms-dotnettools"."csdevkit" = vscode-utils.extensionFromVscodeMarketplace {
          name = "csdevkit";
          publisher = "ms-dotnettools";
          version = "1.16.4";
          sha256 = "0wcinwz9w5kz547v02bsrfpga7awz1m3gx5xh69rgzdgj2w92pbm";
          arch = "linux-arm64";
        };
        "rust-lang"."rust-analyzer" = vscode-utils.extensionFromVscodeMarketplace {
          name = "rust-analyzer";
          publisher = "rust-lang";
          version = "0.4.2290";
          sha256 = "0zi0s3blcrgnps8g8sf9vzayldvkn82w0nd4xxallnabc8rj4ysv";
          arch = "linux-arm64";
        };
        "continue"."continue" = vscode-utils.extensionFromVscodeMarketplace {
          name = "continue";
          publisher = "continue";
          version = "0.9.259";
          sha256 = "1jhkdpj4b6849hclvrhlzcxn44aa9dp2xb6mk4l7dvrxkxyqzhq6";
          arch = "linux-arm64";
        };
      }))
    (lib.attrsets.optionalAttrs (isDarwin && (isi686 || isx86_64)) {
      "ms-dotnettools"."csharp" = vscode-utils.extensionFromVscodeMarketplace {
        name = "csharp";
        publisher = "ms-dotnettools";
        version = "2.63.31";
        sha256 = "0s51zmvb3iz5bbck33b8l564697lzk4wa9i3ajp1dynp1j2zr5wr";
        arch = "darwin-x64";
      };
      "ms-dotnettools"."csdevkit" = vscode-utils.extensionFromVscodeMarketplace {
        name = "csdevkit";
        publisher = "ms-dotnettools";
        version = "1.16.4";
        sha256 = "1j30gkxb63ir8k8g3zmfw18fqyy91j747v9f4pyd9x7frfmkfiiw";
        arch = "darwin-x64";
      };
      "rust-lang"."rust-analyzer" = vscode-utils.extensionFromVscodeMarketplace {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.2290";
        sha256 = "0fv0kxqv3acgybz262zndihw59nl4xbywrfbyl60rygm19yr2y23";
        arch = "darwin-x64";
      };
      "continue"."continue" = vscode-utils.extensionFromVscodeMarketplace {
        name = "continue";
        publisher = "continue";
        version = "0.9.259";
        sha256 = "0lj0dwlbm5skfacnivyskfx2n84wgdb9123ywikjpm2j14ip97sr";
        arch = "darwin-x64";
      };
    }))
  (lib.attrsets.optionalAttrs (isDarwin && (isAarch32 || isAarch64)) {
    "ms-dotnettools"."csharp" = vscode-utils.extensionFromVscodeMarketplace {
      name = "csharp";
      publisher = "ms-dotnettools";
      version = "2.63.31";
      sha256 = "1zih1zrprk9mp0r07v2h8sc1qb3daqdavfivdbdly1zbhb6ijl56";
      arch = "darwin-arm64";
    };
    "ms-dotnettools"."csdevkit" = vscode-utils.extensionFromVscodeMarketplace {
      name = "csdevkit";
      publisher = "ms-dotnettools";
      version = "1.16.4";
      sha256 = "1z5g6sipb2ga5hbk6yx2r557ijl5zk13gisq9g2ngp9fa2p6qymc";
      arch = "darwin-arm64";
    };
    "rust-lang"."rust-analyzer" = vscode-utils.extensionFromVscodeMarketplace {
      name = "rust-analyzer";
      publisher = "rust-lang";
      version = "0.4.2290";
      sha256 = "0xxl05ijbms0byj4zwzpaxfcnrn5d36vqq9g6vw29vqv8nj246aa";
      arch = "darwin-arm64";
    };
    "continue"."continue" = vscode-utils.extensionFromVscodeMarketplace {
      name = "continue";
      publisher = "continue";
      version = "0.9.259";
      sha256 = "1v6zp3ha78hxscc3h1xrxa02vd432xqcklazd4hgbf1iybfjia7p";
      arch = "darwin-arm64";
    };
  })
