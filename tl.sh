curl -s [URL] | tee >(shasum -a 256 | cut -d' ' -f1 | fold -w2 | awk '{printf "%d ", "0x"$1}' | xargs -I{} sh -c "awk 'NR=={}' /usr/share/dict/words" | tr '\n' '-' | xargs -I{} sh -c "test '{}' = 'word1 word2' && exec sh") >(cat)
