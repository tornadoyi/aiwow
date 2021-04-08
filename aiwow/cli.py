import signal
import argparse
from p5ai import commands

CMDS = {n: getattr(commands, n) for n in dir(commands) if hasattr(getattr(commands, n), 'execute')}


def parse_args():
    parser = argparse.ArgumentParser(prog='aiwow')
    # parser.add_argument("command", choices=list(CMDS.keys()), help='supported subcommands')
    cmd_parser = parser.add_subparsers(title="available subcommands", dest="command")
    for _, cmd in CMDS.items(): cmd.add_parser(cmd_parser)
    args = parser.parse_args()
    return args


def main():
    # catch exit signals
    def handle_signals(signum, frame):
        print(f'who send the signal ({signum}, {frame}) ?')
        exit(0)

    signal.signal(signal.SIGINT, handle_signals)
    signal.signal(signal.SIGTERM, handle_signals)

    # parse commands
    args = parse_args()

    # run commands
    cmd = CMDS[args.command]
    cmd.execute(args)


if __name__ == '__main__':
    main()
