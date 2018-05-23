#!/usr/bin/env python

# Record: ['dialect', 'freeze', 'level', 'offset', 'sub_records', 'sub_tag', 'sub_tag_value', 'sub_tags', 'tag', 'value', 'xref_id']
# Individual: ['_father', '_mother', 'dialect', 'father', 'freeze', 'level', 'mother', 'name', 'offset', 'sex', 'sub_records', 'sub_tag', 'sub_tag_value', 'sub_tags', 'tag', 'value', 'xref_id']

# TODO: Modify this script so that it reads in a GEDCOM file as input and outputs Postgres SQL INSERT INTO statements that create the same data, but in a relational DB.


from collections import defaultdict

from ged4py import GedcomReader


def is_dunder(name):
    return name.startswith('__')


def print_subrecords(record, depth):
    if 'sub_records' in dir(record):
        indent = '    ' * depth
        for k, subval in enumerate(record.sub_records):
            t = type(record).__name__
            key = t + '_' + record.tag
            print(f'{subval.level}{indent}{key}{indent}{subval}')
            print_subrecords(subval, depth + 1)


def main(gedfile):
    print_by_type_counter = defaultdict(int)
    with GedcomReader(gedfile, encoding='utf-8') as rdr:
        for record in rdr.records0():
            t = type(record).__name__
            key = t + '_' + record.tag
            print_by_type_counter[key] += 1
            if print_by_type_counter[key] <= 1:
                print(f'\n0 {key}: {str(record)}')
            print_subrecords(record, depth=1)


if __name__ == '__main__':
    main(gedfile='royals.ged')

