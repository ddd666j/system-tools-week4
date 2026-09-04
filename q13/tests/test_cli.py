import sys

import pytest

from greetlab import cli


def test_normal_name(monkeypatch, capsys):
    monkeypatch.setattr(sys, "argv", ["sdt-greet", "--name", "25020007021"])
    cli.main()
    assert capsys.readouterr().out.strip() == "Hello, 25020007021!"


def test_blank_name(monkeypatch):
    monkeypatch.setattr(sys, "argv", ["sdt-greet", "--name", "   "])
    with pytest.raises(SystemExit) as error:
        cli.main()
    assert error.value.code == 2
