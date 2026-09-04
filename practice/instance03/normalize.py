def normalize(name: str) -> str:
    value = name.strip()
    if not value:
        raise ValueError('blank')
    return value
