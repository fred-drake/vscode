{ pkgs, lib }:

let
  inherit (pkgs.stdenv) isDarwin isLinux isi686 isx86_64 isAarch32 isAarch64;
  vscode-utils = pkgs.vscode-utils;
  merge = lib.attrsets.recursiveUpdate;
in
merge
  (merge
    (merge
      (merge
      {
        "eamodio"."gitlens" = vscode-utils.extensionFromVscodeMarketplace {
          name = "gitlens";
          publisher = "eamodio";
          version = "2024.10.1005";
          sha256 = "03483hs4n48jvrdrbfypj1fpm99v10xcqhrbzr091dy9bp9i5n10";
        };
        "pkief"."material-icon-theme" = vscode-utils.extensionFromVscodeMarketplace {
          name = "material-icon-theme";
          publisher = "pkief";
          version = "5.11.1";
          sha256 = "0f5nvs7z3zfdsqrl6pcczpbnzslf40npg792k1pv6xlrwy52s4ad";
        };
        "ms-vscode-remote"."remote-ssh" = vscode-utils.extensionFromVscodeMarketplace {
          name = "remote-ssh";
          publisher = "ms-vscode-remote";
          version = "0.116.2024100715";
          sha256 = "15k5fxaqc8nzrnc09r197dfx5b9s1ni56kwlv2x1iv1nc027b39j";
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
        "mikestead"."dotenv" = vscode-utils.extensionFromVscodeMarketplace {
          name = "dotenv";
          publisher = "mikestead";
          version = "1.0.1";
          sha256 = "0rs57csczwx6wrs99c442qpf6vllv2fby37f3a9rhwc8sg6849vn";
        };
        "wayou"."vscode-todo-highlight" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-todo-highlight";
          publisher = "wayou";
          version = "1.0.5";
          sha256 = "1sg4zbr1jgj9adsj3rik5flcn6cbr4k2pzxi446rfzbzvcqns189";
        };
        "tamasfe"."even-better-toml" = vscode-utils.extensionFromVscodeMarketplace {
          name = "even-better-toml";
          publisher = "tamasfe";
          version = "0.19.2";
          sha256 = "0q9z98i446cc8bw1h1mvrddn3dnpnm2gwmzwv2s3fxdni2ggma14";
        };
        "be5invis"."vscode-custom-css" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-custom-css";
          publisher = "be5invis";
          version = "7.3.1";
          sha256 = "151qr67jz5z3j53lkycjy3dg4hw60hf3cj7rka57gjxfq2gynlww";
        };
        "bbenoist"."nix" = vscode-utils.extensionFromVscodeMarketplace {
          name = "nix";
          publisher = "bbenoist";
          version = "1.0.1";
          sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
        };
        "saoudrizwan"."claude-dev" = vscode-utils.extensionFromVscodeMarketplace {
          name = "claude-dev";
          publisher = "saoudrizwan";
          version = "2.0.4";
          sha256 = "0zqml6k0lqln6f7a6c1v9x2gaglzg5ksb53f9ch01s3xpd8i5g2d";
        };
        "mkhl"."direnv" = vscode-utils.extensionFromVscodeMarketplace {
          name = "direnv";
          publisher = "mkhl";
          version = "0.17.0";
          sha256 = "1n2qdd1rspy6ar03yw7g7zy3yjg9j1xb5xa4v2q12b0y6dymrhgn";
        };
        "signageos"."signageos-vscode-sops" = vscode-utils.extensionFromVscodeMarketplace {
          name = "signageos-vscode-sops";
          publisher = "signageos";
          version = "0.9.1";
          sha256 = "1wr9magp4961pady696wiv20zpdw0hz97anbqixyzzgrsbxajlbg";
        };
        "mobalic"."jetbrains-dark-theme" = vscode-utils.extensionFromVscodeMarketplace {
          name = "jetbrains-dark-theme";
          publisher = "mobalic";
          version = "3.1.0";
          sha256 = "1nyxasrnv1rhyk9dg92xldkmi8a1bqlkn53b6ygwgqnpxxpz7fqi";
        };
        "rodrigocfd"."format-comment" = vscode-utils.extensionFromVscodeMarketplace {
          name = "format-comment";
          publisher = "rodrigocfd";
          version = "0.0.8";
          sha256 = "0kn56q9c94p74caaqhak67g9mwykbq34ksxbkv1jwnm2p3rvxgj6";
        };
      }
        (lib.attrsets.optionalAttrs (isLinux && (isi686 || isx86_64)) {
          "continue"."continue" = vscode-utils.extensionFromVscodeMarketplace {
            name = "continue";
            publisher = "continue";
            version = "0.9.215";
            sha256 = "0ishy8x8ki9vpc4zhr0zvwywpm22i5i6f0jdnqh443j2rimrivsy";
            arch = "linux-x64";
          };
        }))
      (lib.attrsets.optionalAttrs (isLinux && (isAarch32 || isAarch64)) {
        "continue"."continue" = vscode-utils.extensionFromVscodeMarketplace {
          name = "continue";
          publisher = "continue";
          version = "0.9.215";
          sha256 = "1z83bvizbclnnbxdp4i94x1isnq19n70s8wk1pdlnkwmzrhyvhjk";
          arch = "linux-arm64";
        };
      }))
    (lib.attrsets.optionalAttrs (isDarwin && (isi686 || isx86_64)) {
      "continue"."continue" = vscode-utils.extensionFromVscodeMarketplace {
        name = "continue";
        publisher = "continue";
        version = "0.9.215";
        sha256 = "0qbxxl4q56l1b078shm9hx5mlpgs77bclbb6pkr65rg76pcza25v";
        arch = "darwin-x64";
      };
    }))
  (lib.attrsets.optionalAttrs (isDarwin && (isAarch32 || isAarch64)) {
    "continue"."continue" = vscode-utils.extensionFromVscodeMarketplace {
      name = "continue";
      publisher = "continue";
      version = "0.9.215";
      sha256 = "0nbv2gpmxj0zicslbnxqvjd6r4p5jav9kavszas7jr0pd37hc88c";
      arch = "darwin-arm64";
    };
  })

