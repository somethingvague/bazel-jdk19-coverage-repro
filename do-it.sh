set -e

TESTDIR=`pwd`
BAZEL_BUILD_DIR=/tmp/jacoco-upgrade-test
BAZEL_DIR=${BAZEL_BUILD_DIR}/bazel
JAVA_TOOLS_DIR=/tmp/java_tools

if [ ! -d ${BAZEL_DIR} ]
then
  mkdir -p ${BAZEL_BUILD_DIR}
  git clone --depth 1 -b jacoco-asm-upgrade-repro https://github.com/somethingvague/bazel.git ${BAZEL_DIR}
  cd ${BAZEL_DIR}
  bazel build //src:bazel-dev
  bazel build //src:java_tools_zip
fi

rm -rf /tmp/java_tools
unzip -q -o -d ${JAVA_TOOLS_DIR} ${BAZEL_DIR}/bazel-bin/src/java_tools.zip
touch ${JAVA_TOOLS_DIR}/WORKSPACE

cd ${TESTDIR}
echo 'BUILDING PROJECT'
${BAZEL_DIR}/bazel-bin/src/bazel-dev coverage //... --verbose_failures --override_repository=remote_java_tools=${JAVA_TOOLS_DIR}
