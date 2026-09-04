import argparse


def greeting(name: str) -> str:
    if not name.strip():
        raise ValueError("name must not be blank")
    return f"Hello, {name}!"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--name", required=True)
    args = parser.parse_args()
    try:
        print(greeting(args.name))
    except ValueError as error:
        parser.error(str(error))
