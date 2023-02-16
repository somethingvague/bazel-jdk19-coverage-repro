load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/jdk:remote_java_repository.bzl", "remote_java_repository")
load("@bazel_tools//tools/jdk:local_java_repository.bzl", "local_java_repository")

http_archive(
    name = "jdk-build-archive",
    build_file_content = "java_runtime(name = 'runtime', srcs = glob(['**']), visibility = ['//visibility:public'])",
    strip_prefix = "zulu19.32.13-ca-jdk19.0.2-macosx_x64",
    urls = ["https://cdn.azul.com/zulu/bin/zulu19.32.13-ca-jdk19.0.2-macosx_x64.tar.gz",]
)

remote_java_repository(
    name = "javac-archive",
    version = 19,
    strip_prefix = "zulu19.32.13-ca-jdk19.0.2-macosx_x64",
    urls = ["https://cdn.azul.com/zulu/bin/zulu19.32.13-ca-jdk19.0.2-macosx_x64.tar.gz",]
)

register_toolchains("//:my_jdk_definition")

RULES_JVM_EXTERNAL_TAG = "4.5"

http_archive(
    name = "rules_jvm_external",
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
    sha256 = "b17d7388feb9bfa7f2fa09031b32707df529f26c91ab9e5d909eb1676badd9a6",
)

git_repository(
    name = "bazel_skylib",
    remote = "https://github.com/bazelbuild/bazel-skylib.git",
    branch = "main",
)

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    artifacts = [
        "junit:junit:4.12",
        "com.google.guava:guava:28.0-jre",
    ],
    fetch_sources = True,
    repositories = [
        "http://uk.maven.org/maven2",
        "https://jcenter.bintray.com/",
    ],
)
