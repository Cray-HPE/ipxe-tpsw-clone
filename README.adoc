# iPXE 

## Developing quick start

   cd src
   make

## Maintaining

### Where did this repo come from and how is it used?
- This repo is a clone of the scms ipxe-tpsw-fork repo which was obtained from the Cray TPSW ipxe repo which was last updated on 08/21/2018.  The repo also contains Cray ipxe customizations.
- This repo uses the master branch for current code development.
- The base Docker image for the cms-ipxe container is built from the contents of this repo.
- This repo also tracks the external ipxe Git repo at https://git.ipxe.org/ipxe.git
- Future updates to the ipxe source can be fetched from the external repo into a branch where they can be integrated, tested and then merged into master using the standard PR process.

Significant changes should be first vetted in the opensource community, and if possible, picked from the upstream
source.
### Patches
Features should be implemented in the form of patch files that can be found in the patches directory. Patches are
applied to the upstream source at docker build time, such that when the docker build is finished, all affected changes
to the source should be able to be pre-built using one of the existing pre-compile build tests. This ensures a
pre-checkout test as well as an opportunity to compile linked objects within the build environment ahead of time.

#### Creating a Patch
Standard linux patch/diff tools are used:
    diff -u /ipxe/config/general.h /ipxe/config/general.h.new > /patches/enable_https.patch

Add your patch to patches/apply.sh


## Developing in an OSX environment
- If you want to make changes to the ipxe source code, recompile, and boot your image in a VM then read on.
- Build and run a Docker image with the dependencies for making ipxe. 
- Build the image with './make-builder-image'.  This will build and save the image to your local docker registry.
- Start the builder container './start-builder'.
- Shell into the builder image using './sh-builder' and from within the container shell run:
  - cd /home/ipxe
  - run the appropriate make to build the required ipxe rom (example: make bin/ipxe.iso).
- The build artifacts are available under $PWD/src/bin locally outside of the container.
- The bin/ipxe.iso image can be booted from a local VirtualBox VM or from a Craystack compute VM for inital testing
- To stop and remove the running builder image run './stop-builder'.  This will not delete the $PWD/src directory.

## Embedding a JWT token into the image.
- A JWT token can be included in the image using the make build process. If so the token will be included as a request header (i.e. 'Authorization: Bearer <token>') for all requests from ipxe.
- To enable this feature pass the `BEARER_TOKEN` argumet to make.
  - Example: `make bin/iso BEARER_TOKEN='eyJhbGciOi ... MdOecaEeA'`

## Other iPXE resources
- For any more detailed instructions, see http://ipxe.org


## Build Helpers
This repo uses some build helpers from the 
[cms-meta-tools](https://github.com/Cray-HPE/cms-meta-tools) repo. See that repo for more details.

## Local Builds
If you wish to perform a local build, you will first need to clone or copy the contents of the
cms-meta-tools repo to `./cms_meta_tools` in the same directory as the `Makefile`. When building
on github, the cloneCMSMetaTools() function clones the cms-meta-tools repo into that directory.

For a local build, you will also need to manually write the .version, .docker_version (if this repo
builds a docker image), and .chart_version (if this repo builds a helm chart) files. When building
on github, this is done by the setVersionFiles() function.

## Copyright and License
See each individual file for information on its copyright and license.

## Updating the iPXE source

iPXE is pulled in using `git vendor`[^1], pulling the [Cray-HPE fork of iPXE](https://github.com/Cray-HPE/ipxe).

To update the pulled reference of iPXE specify a branch, ref, or tag:

- Branch

    ```bash
    git vendor update ipxe master
    ```

- Ref

    ```bash
    git vendor update ipxe a2941c315a805b28a9ea13a2425e32da23a35607
    ```

Note that using `git vendor` creates 2 commits:

  - One commit showing the squashed history
  - Another commit showing the update of the local `vendor/` folder

These commits will merge into one commit if a `git rebase` is executed, this is not necessarily bad however the Git history
will appear different to the user.

[^1]: `git vendor` is a wrapper for `git substree`
