#!/usr/bin/env python

import argparse
import glob

def main():
    parser = argparse.ArgumentParser(description='Count *.nf files with optional addition')
    parser.add_argument('--add', type=float, default=0, 
                        help='Add this value to the file count (int or float)')
    
    args = parser.parse_args()
    
    # Count files
    file_count = len(glob.glob("*.nf"))
    
    # Add the optional value
    total = file_count + args.add
    
    print(f'File count: {file_count}')
    if args.add != 0:
        print(f'Added value: {args.add}')
        print(f'Total: {total}')
    else:
        print(f'Total: {total}')

if __name__ == '__main__':
    main()
