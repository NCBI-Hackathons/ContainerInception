# Running the demo workflow using Common Workflow Language and Docker containers

With the `.cwl`/`.yml` files in the same directory as the sample input fastq files and the reference sequence, run the following:

```sh
sudo `which cwl-runner` trim.cwl trim.yml
sudo `which cwl-runner` hs-build.cwl hs-build.yml
sudo `which cwl-runner` hs-align.cwl hs-align.yml
```

# Dependencies

Since this workflow uses CWL to run pre-made Docker containers, it has only two dependencies:

- [Docker](https://docs.docker.com/install/)
- [cwltool](https://github.com/common-workflow-language/cwltool#install)

# Customization

The `.yml` files are used to define the parameters used to run each step of the pipeline. The `.cwl` files map these parameters to the tools used.

The `.yml` files can be modified to run the pipeline with different files, etc.
