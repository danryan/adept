hook to github
- grab repo, build on x86 and amd64,push to apt

# Directory structure

dists/
  codename (lucid)/
    Release (https://gist.github.com/3759886)
    component (testing)/
    component (main)/
      binary-arch (binary-amd64)/
        Release (https://gist.github.com/3759881)
        Package (https://gist.github.com/3759804)
pool/
  component (main)/
    letter (p)/
      source-or-package (postgresql-9.0)/
        packagename_upstreamversion-pkgversion~codename_arch.deb (postgresql-9.0_9.0.5-1~lucid_amd64.deb)



## dists/lucid/Release

https://gist.github.com/3759886

## dists/lucid/main/binary-amd64/Release

https://gist.github.com/3759881

## dists/lucid/main/binary-amd64/Packages

Listing of all control files for Lucid 64-bit binary packages in the main component

https://gist.github.com/3759804