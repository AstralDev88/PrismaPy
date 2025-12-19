import re
import sys

def transpile(code: str) -> str:
    return re.sub(
        r"\[\$(\w+)\((.*?)\)\]",
        r"\1(\2)",
        code
    )

def main():
    if len(sys.argv) < 2 or not sys.argv[1].endswith(".prispy"):
        print("Usage: prismapy <file.prispy>")
        sys.exit(1)

    filename = sys.argv[1]

    with open(filename, "r", encoding="utf-8") as f:
        code = f.read()

    python_code = transpile(code)
    exec(python_code, globals())

if __name__ == "__main__":
    main()
