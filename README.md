# bazel-jdk19-coverage-repro
To demonstrate bazel coverage with Jacoco v0.8.8 and ASM 9.3 upgrades

`do-it.sh`
* clones a Bazel fork on branch [jacoco-asm-upgrade-repro](https://github.com/somethingvague/bazel.git) which has a patched jacoco v0.8.8 and asm 9.3
* builds bazel and java_tools using Bazel 6
* runs coverage against this test project with using the built Bazel fork and its java_tools


