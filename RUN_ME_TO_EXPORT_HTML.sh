#!/usr/bin/env bash
# DATA 558 HW3 -- one-shot helper:
#   1) makes sure required packages are installed,
#   2) executes hw3_coding.ipynb in place (so every cell has output),
#   3) exports hw3_coding.html for Gradescope submission.
#
# Usage:  bash RUN_ME_TO_EXPORT_HTML.sh
set -euo pipefail
cd "$(dirname "$0")"

python3 -m pip install --quiet --upgrade \
    numpy pandas scikit-learn matplotlib jupyter nbconvert

# Run every cell and save outputs back into the notebook
jupyter nbconvert --to notebook --execute hw3_coding.ipynb \
    --output hw3_coding.ipynb --ExecutePreprocessor.timeout=300

# Export a static HTML print-out for Gradescope
jupyter nbconvert --to html hw3_coding.ipynb

echo
echo "Done. Files ready to submit:"
echo "  - hw3_problems.pdf  (Exercise 1 + Exercise 2 a/b)"
echo "  - hw3_coding.ipynb  (executed notebook, Exercise 2 c-j)"
echo "  - hw3_coding.html   (HTML print-out of the executed notebook)"
