#
# Helm-docs OCI container image with pre-installed Git based on Alpine Linux.
#
# Build and publish with default arguments:
#
#   $ ./scripts/build --push
#
# Build with custom arguments:
#
#   $ ./scripts/build --base 43.243.2-full
#

ARG base=43.243.2-full

FROM renovate/renovate:${base}
LABEL maintainer="Sascha Peilicke <sascha@peilicke.de"
LABEL description="Renovate OCI image with pre-installed helm-docs"

ARG helm_docs=1.14.2

# fetch static helm binary
RUN set -ex; \
  temp_dir="$(mktemp -d)"; \
  curl -fsSL "https://github.com/norwoodj/helm-docs/releases/download/v${helm_docs}/helm-docs_${helm_docs}_Linux_x86_64.tar.gz" -o ${temp_dir}/helm-docs.tar.gz; \
  bsdtar -C ${temp_dir} -xf ${temp_dir}/helm-docs.tar.gz; \
  cp ${temp_dir}/helm-docs ~/bin/helm-docs; \
  true
