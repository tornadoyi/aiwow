from setuptools import setup, find_packages

setup(
    name="aiwow",
    description="The AI of world of warcraft",
    author="Jason Ku",
    packages=find_packages(),
    entry_points={
        'console_scripts': [
            'aiwow = aiwow.cli:main',
        ],
    },
)