import pytest

from .. import load_data

def test_clean_str_empty_input():
    """Asserts that `load_data.clean_str()` returns the empty string when given the empty string as
    input.
    """
    expected = ''
    actual = load_data.clean_str('')

    assert expected == actual
