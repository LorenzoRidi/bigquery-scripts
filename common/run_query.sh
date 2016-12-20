#!/bin/bash

if [ "$#" -ne 4 ]; then
    echo "Usage: `basename "$0"` <query> <destination_prefix> <start_date (inclusive, yyyyMMdd format)> <end_date (inclusive, yyyyMMdd format)>"
    exit 1
fi

bash cycle_through_dates.sh $3 $4 | while read -r; do 

	echo "Executing query $(eval echo ${1}) and saving result in ${2}${REPLY}"; 
	#bq --nosync query --replace --destination_table "azimut_bi_dev_tables.${p}" --allow_large_results "SELECT CONTRACT_KEY, CONTRACT_STATUS_KEY, CLIENT_PRINCIPAL_KEY, CLIENT_KEY, AGENT_KEY, CLIENT_AGENT_KEY, ORG_KEY, CLIENT_ORG_KEY, IF(PRODUCT_KEY = 565981, 571193, PRODUCT_KEY) PRODUCT_KEY, IF(PRODUCT_UNDER_KEY = 565981, 571193, PRODUCT_UNDER_KEY) PRODUCT_UNDER_KEY, PORTFOLIO_VALUATION_DATE_KEY, PORTFOLIO_OBSERVATION_DATE_KEY, PORTFOLIO_COUNTERVALUE, PORTFOLIO_UNITS, PORTFOLIO_COUNTERVALUE_INCCY, PORTFOLIO_LEVEL, PTF_PERFORMANCE_1Y, PTF_PERFORMANCE_YTD, PTF_PERFORMANCE, PTF_LASTPRICE, PORTFOLIO_ETL_FLG_RECORD_TYPE, PORTFOLIO_ETL_DATE_INS, PORTFOLIO_ETL_DATE_UPD, PORTFOLIO_COUNTERVALUE_POS, AML_EXPIRE_DATE_KEY, CONTRACT_AGENT_KEY FROM [azimut_bi_dev_tables.${p}]"

done