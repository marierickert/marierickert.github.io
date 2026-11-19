#!/usr/bin/env bash
set -euo pipefail

tmp_dir="$(mktemp -d)"
tmp_override="${tmp_dir}/comments-test-override.yml"
tmp_site="${tmp_dir}/site"
tmp_source="${tmp_dir}/source"

cleanup() {
  rm -rf "${tmp_dir}"
}
trap cleanup EXIT

rsync -a --exclude='/.git' --exclude='/vendor' --exclude='/node_modules' \
  --exclude='/_site' --exclude='/.jekyll-cache' ./ "${tmp_source}/"
mkdir -p "${tmp_source}/_posts"
cat >"${tmp_source}/_posts/2022-01-01-integration-giscus.md" <<'POST'
---
layout: post
title: Integration Giscus
permalink: /__integration/comments-giscus/
giscus_comments: true
---
Giscus integration fixture.
POST
cat >"${tmp_source}/_posts/2015-01-01-integration-disqus.md" <<'POST'
---
layout: post
title: Integration Disqus
permalink: /__integration/comments-disqus/
disqus_comments: true
---
Disqus integration fixture.
POST
cat >"${tmp_source}/_posts/2022-01-01-integration-no-comments.md" <<'POST'
---
layout: post
title: Integration No Comments
permalink: /__integration/no-comments/
---
No comments integration fixture.
POST

cat >"${tmp_override}" <<'YAML'
giscus:
  repo: alshedivat/al-folio
  repo_id: R_kgDOExample
  category: Comments
  category_id: DIC_kwDOExample
disqus_shortname: al-folio
external_sources: []
YAML

bundle exec jekyll build --source "${tmp_source}" --config "_config.yml,${tmp_override}" -d "${tmp_site}" >/dev/null

giscus_page="${tmp_site}/__integration/comments-giscus/index.html"
disqus_page="${tmp_site}/__integration/comments-disqus/index.html"
no_comments_page="${tmp_site}/__integration/no-comments/index.html"

grep -q 'https://giscus.app/client.js' "${giscus_page}"
if grep -q 'giscus comments misconfigured' "${giscus_page}"; then
  echo "unexpected giscus misconfiguration warning in ${giscus_page}" >&2
  exit 1
fi

grep -q 'id="disqus_thread"' "${disqus_page}"
grep -q '.disqus.com/embed.js' "${disqus_page}"

if grep -qE 'https://giscus.app/client.js|id="disqus_thread"|.disqus.com/embed.js' "${no_comments_page}"; then
  echo "unexpected comments on ${no_comments_page}" >&2
  exit 1
fi

echo "comments integration checks passed"
