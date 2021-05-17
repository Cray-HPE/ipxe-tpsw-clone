# iPXE 

## Developing quick start

   cd src
   make

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

## Where did this repo come from and how is it used?
- This repo is a clone of the scms ipxe-tpsw-fork repo which was obtained from the Cray TPSW ipxe repo which was last updated on 08/21/2018.  The repo also contains Cray ipxe customizations.
- This repo uses the master branch for current code development.
- The base Docker image for the cms-ipxe container is built from the contents of this repo.
- This repo also tracks the external ipxe Git repo at https://git.ipxe.org/ipxe.git
- Future updates to the ipxe source can be fetched from the external repo into a branch where they can be integrated, tested and then merged into master using the standard PR process.

## Versioning
Use [SemVer](http://semver.org/). The version is located in the [.version](.version) file. 

## Copyright and License
See each individual file for information on its copyright and license.