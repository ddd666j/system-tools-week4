import pytest
from normalize import normalize
@pytest.mark.parametrize('raw,expected',[(' Alice ','Alice'),('25020007021','25020007021')])
def test_valid(raw,expected): assert normalize(raw)==expected
@pytest.mark.parametrize('raw',['','   ','\t'])
def test_blank(raw):
    with pytest.raises(ValueError): normalize(raw)
