parse_source_config() {
  URL="$(jq -r '.source.url // ""' < "$PAYLOAD")"
  VERSION="$(jq -r '.version.timestamp // ""' < "$PAYLOAD")"
}

parse_out_params() {
  RELATIVE_DIR="$(jq -r '.params.path // ""' < "$PAYLOAD")"
}