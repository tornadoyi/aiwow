from setuptools import setup, find_packages

setup(
    name="aiwow",
    description="The AI of world of warcraft",
    author="Jason Ku",
    packages=[p for p in find_packages() if p.startswith('aiwow') or p.startswith('readwow')],
    entry_points={
        'console_scripts': [
            'replay = replay.cli:main',
        ],
    },
)