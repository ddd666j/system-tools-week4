import pytest

from greetlab.cli import greeting


def test_real_name():
    assert greeting("25020007021") == "Hello, 25020007021!"


def test_blank_name():
    with pytest.raises(ValueError, match="must not be blank"):
        greeting("   ")
