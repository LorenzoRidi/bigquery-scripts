# bigquery-scripts
Shell scripts to automate repetitive tasks on BigQuery
Disclaimer: these scripts are developed on a Mac OS X system, paying no attention to the compatibility with other systems.

## General usage

$ bash <selector script> [options] | bash <action script> [options]

Example:
$ bash selectors/list_tables_by_keyword.sh my_dataset MY_TABLE_PREFIX | bash actions/delete.sh my_dataset.
Deletes all tables within "my_dataset" whose table_id starts with "MY_TABLE_PREFIX"

## Views reference hierarchy
Prints the hierarchy of table/view references starting from the view you specify. It is still a WIP, so expect issues.

$ bash explode_view.sh <dataset>.<view>

Result:
- my_dataset.A_VIEW
-- my_dataset.ANOTHER_VIEW
--- my_dataset.A_TABLE
-- my_dataset.A_THIRD_VIEW
--- my_dataset.A_TABLE
--- another_dataset.ONE_MORE_TABLE

Sorted, unique matches:
another_dataset.ONE_MORE_TABLE
my_dataset.ANOTHER_VIEW
my_dataset.A_TABLE
my_dataset.A_THIRD_VIEW
my_dataset.A_VIEW
