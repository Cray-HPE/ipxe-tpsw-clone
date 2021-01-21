@Library('dst-shared@release/shasta-1.4') _

// DST-369 - RFE to push images created from non-master branches.

dockerBuildPipeline {
 app = "tpsw-ipxe"
 name = "ipxe"
 description = "iPXE is an open-source implementation of the Preboot eXecution Environment (PXE) client firmware and bootloader"
 repository = "cray"
 imagePrefix = "cray"
 masterBranch = "master"
 product = "internal"
 
 githubPushRepo = "Cray-HPE/ipxe-tpsw-clone"
 /*
    By default all branches are pushed to GitHub

    Optionally, to limit which branches are pushed, add a githubPushBranches regex variable
    Examples:
    githubPushBranches =  /master/ # Only push the master branch
        
    In this case, we push bugfix, feature, hot fix, master, and release branches
 */
 githubPushBranches =  /(bugfix\/.*|feature\/.*|hotfix\/.*|master|release\/.*)/ 
}
