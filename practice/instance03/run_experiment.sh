#!/usr/bin/env bash
set -euo pipefail
cat > normalize.py <<'PY'
def normalize(name: str) -> str:
    value = name.strip()
    if not value:
        raise ValueError('blank')
    return value
PY
cat > test_normalize.py <<'PY'
import pytest
from normalize import normalize
@pytest.mark.parametrize('raw,expected',[(' Alice ','Alice'),('25020007021','25020007021')])
def test_valid(raw,expected): assert normalize(raw)==expected
@pytest.mark.parametrize('raw',['','   ','\t'])
def test_blank(raw):
    with pytest.raises(ValueError): normalize(raw)
PY
/home/dmh/桌面/system-tools-week3/.venv-dev/bin/pytest -q | tee experiment.log
