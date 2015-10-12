#!/usr/local/bin/python2
import sys
from anybar import AnyBar

def write_stdout(s):
    sys.stdout.write(s)
    sys.stdout.flush()

def write_stderr(s):
    sys.stderr.write(s)
    sys.stderr.flush()

def write_log(s):
    fp = open("/tmp/sarasa.log", "a+", 0)
    fp.write("%s\n" % s)
    fp.close()

def main():
    while 1:
        write_stdout('READY\n') # transition from ACKNOWLEDGED to READY
        line = sys.stdin.readline()  # read header line from stdin
        #write_stderr(line) # print it out to stderr
        headers = dict([ x.split(':') for x in line.split() ])
        data = sys.stdin.read(int(headers['len'])) # read the event payload
        data_items = dict([ x.split(':') for x in data.split(' ') ])
        if data_items['processname'] == 'unison':
            if headers['eventname'] == 'PROCESS_STATE_STOPPED':
                AnyBar().change('red')
            elif headers['eventname'] == 'PROCESS_STATE_RUNNING':
                AnyBar().change('green')
        write_log(headers)
        write_log(data)
        #write_stderr(data) # print the event payload to stderr
        write_stdout('RESULT 2\nOK') # transition from READY to ACKNOWLEDGED

if __name__ == '__main__':
    main()
    import sys
