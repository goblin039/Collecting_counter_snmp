#!/bin/bash

dev_job="<job for Город_Нск>"
dev_city="<Город_Нск>"
dev_tcp="<Нский офис>"
dev_region="<Регион>"
dev_push="<IP Pushgateway:9091>"

cd /opt/kpt
#===========================================================================================================================================
# HP_425, HP_426
all_kpt=(HP_425, HP_426) # Адреса или имена девайсов
for i in ${!all_kpt[@]} ; do

  echo -n "${all_kpt[$i]}"
  count_p=$(snmpget -v 2c -c public ${all_kpt[$i]} 1.3.6.1.2.1.43.10.2.1.4.1.1 | awk '{print $4}')
  if [[ $count_p > 0 ]]
    then echo -e " count print = $count_p"
        echo -e "# TYPE print_list gauge" > /opt/kpt/push.txt
        echo -e "print_list $count_p" >> /opt/kpt/push.txt
        cat /opt/kpt/push.txt | curl --data-binary @- http://"${dev_push}"/metrics/job/"${dev_job}"/city/"${dev_city}"/tcp/"${dev_tcp}"/region/"${dev_region}"/instance/"${all_kpt[$i]}-Black"
  fi

  echo -n "${all_kpt[$i]}"
  count_s_adf=$(snmpget -v 2c -c public ${all_kpt[$i]} .1.3.6.1.4.1.11.2.3.9.4.2.1.2.2.1.44.0 | awk '{print $4}')
  if [[ $count_s_adf > 0 ]]
    then echo -e " count scan adf = $count_s_adf"
        echo -e "# TYPE print_scan gauge" > /opt/kpt/push.txt
        echo -e "print_scan $count_s_adf" >> /opt/kpt/push.txt
        cat /opt/kpt/push.txt | curl --data-binary @- http://"${dev_push}"/metrics/job/"${dev_job}"/city/"${dev_city}"/tcp/"${dev_tcp}"/region/"${dev_region}"/instance/"${all_kpt[$i]}-ADF"
  fi
  echo -n "${all_kpt[$i]}"
  count_s_pl=$(snmpget -v 2c -c public ${all_kpt[$i]} .1.3.6.1.4.1.11.2.3.9.4.2.1.2.2.1.74.0 | awk '{print $4}')
  if [[ $count_s_pl > 0 ]]
    then echo -e " count scan plan = $count_s_pl"
        echo -e "# TYPE print_scan gauge" > /opt/kpt/push.txt
        echo -e "print_scan $count_s_pl" >> /opt/kpt/push.txt
        cat /opt/kpt/push.txt | curl --data-binary @- http://"${dev_push}"/metrics/job/"${dev_job}"/city/"${dev_city}"/tcp/"${dev_tcp}"/region/"${dev_region}"/instance/"${all_kpt[$i]}-Plan"
  fi
  echo -n "${all_kpt[$i]}"
  count_s_total=$((count_s_adf + count_s_pl))
  if [[ $count_s_total > 0 ]]
    then echo -e " count scan total = $count_s_total"
        echo -e "# TYPE print_scan gauge" > /opt/kpt/push.txt
        echo -e "print_scan $count_s_total" >> /opt/kpt/push.txt
        cat /opt/kpt/push.txt | curl --data-binary @- http://"${dev_push}"/metrics/job/"${dev_job}"/city/"${dev_city}"/tcp/"${dev_tcp}"/region/"${dev_region}"/instance/"${all_kpt[$i]}-Total"
  fi
done
#===========================================================================================================================================
# HP_4103
all_kpt=(HP_4103_1 HP_4103_2)
for i in ${!all_kpt[@]} ; do

  echo -n "${all_kpt[$i]}"
  count_p=$(snmpget -v 2c -c public ${all_kpt[$i]} 1.3.6.1.4.1.11.2.3.9.4.2.1.4.1.2.6.0 | awk '{print $4}')
  if [[ $count_p > 0 ]]
    then echo -e " count print = $count_p"
        echo -e "# TYPE print_list gauge" > /opt/kpt/push.txt
        echo -e "print_list $count_p" >> /opt/kpt/push.txt
        cat /opt/kpt/push.txt | curl --data-binary @- http://"${dev_push}"/metrics/job/"${dev_job}"/city/"${dev_city}"/tcp/"${dev_tcp}"/region/"${dev_region}"/instance/"${all_kpt[$i]}-Black"
  fi

  echo -n "${all_kpt[$i]}"
  count_s_adf=$(snmpget -v 2c -c public ${all_kpt[$i]} 1.3.6.1.4.1.11.2.3.9.4.2.1.2.2.1.20.0 | awk '{print $4}')
  if [[ $count_s_adf > 0 ]]
    then echo -e " count scan adf = $count_s_adf"
        echo -e "# TYPE print_scan gauge" > /opt/kpt/push.txt
        echo -e "print_scan $count_s_adf" >> /opt/kpt/push.txt
        cat /opt/kpt/push.txt | curl --data-binary @- http://"${dev_push}"/metrics/job/"${dev_job}"/city/"${dev_city}"/tcp/"${dev_tcp}"/region/"${dev_region}"/instance/"${all_kpt[$i]}-ADF"
  fi
  echo -n "${all_kpt[$i]}"
  count_s_pl=$(snmpget -v 2c -c public ${all_kpt[$i]} 1.3.6.1.4.1.11.2.3.9.4.2.1.2.2.1.21.0 | awk '{print $4}')
  if [[ $count_s_pl > 0 ]]
    then echo -e " count scan plan = $count_s_pl"
        echo -e "# TYPE print_scan gauge" > /opt/kpt/push.txt
        echo -e "print_scan $count_s_pl" >> /opt/kpt/push.txt
        cat /opt/kpt/push.txt | curl --data-binary @- http://"${dev_push}"/metrics/job/"${dev_job}"/city/"${dev_city}"/tcp/"${dev_tcp}"/region/"${dev_region}"/instance/"${all_kpt[$i]}-Plan"
  fi
  echo -n "${all_kpt[$i]}"
  count_s_total=$((count_s_adf + count_s_pl))
  if [[ $count_s_total > 0 ]]
    then echo -e " count scan total = $count_s_total"
        echo -e "# TYPE print_scan gauge" > /opt/kpt/push.txt
        echo -e "print_scan $count_s_total" >> /opt/kpt/push.txt
        cat /opt/kpt/push.txt | curl --data-binary @- http://"${dev_push}"/metrics/job/"${dev_job}"/city/"${dev_city}"/tcp/"${dev_tcp}"/region/"${dev_region}"/instance/"${all_kpt[$i]}-Total"
  fi
done
#===========================================================================================================================================
# Scan from BRO_6900  BRO_5750
all_kpt=(BRO_6900  BRO_5750)
cd /opt/kpt
for i in ${!all_kpt[@]} ; do

  echo -n "${all_kpt[$i]}"
  count_p=$(snmpget -v 2c -c public ${all_kpt[$i]} 1.3.6.1.2.1.43.10.2.1.4.1.1 | awk '{print $4}')
  if [[ $count_p > 0 ]]
    then echo -e " count print = $count_p"
        echo -e "# TYPE print_list gauge" > /opt/kpt/push.txt
        echo -e "print_list $count_p" >> /opt/kpt/push.txt
        cat /opt/kpt/push.txt | curl --data-binary @- http://"${dev_push}"/metrics/job/"${dev_job}"/city/"${dev_city}"/tcp/"${dev_tcp}"/region/"${dev_region}"/instance/"${all_kpt[$i]}-Black"
  fi


  echo -n "${all_kpt[$i]}"
  count_s_adf1=$(snmpget -v 2c -c public ${all_kpt[$i]} .1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.54.2.2.1.3.1 | awk '{print $4}')
  count_s_adf2=$(snmpget -v 2c -c public ${all_kpt[$i]} .1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.54.2.2.1.3.3 | awk '{print $4}')
  count_s_adf=$((count_s_adf1 + count_s_adf2))
  if [[ $count_s_adf > 0 ]]
    then echo -e " count scan adf = $count_s_adf"
        echo -e "# TYPE print_scan gauge" > /opt/kpt/push.txt
        echo -e "print_scan $count_s_adf" >> /opt/kpt/push.txt
        cat /opt/kpt/push.txt | curl --data-binary @- http://"${dev_push}"/metrics/job/"${dev_job}"/city/"${dev_city}"/tcp/"${dev_tcp}"/region/"${dev_region}"/instance/"${all_kpt[$i]}-ADF"
  fi
  count_s_pl=$(snmpget -v 2c -c public ${all_kpt[$i]} .1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.54.2.2.1.3.2 | awk '{print $4}')
  if [[ $count_s_pl > 0 ]]
    then echo -e " count scan plan = $count_s_pl"
        echo -e "# TYPE print_scan gauge" > /opt/kpt/push.txt
        echo -e "print_scan $count_s_pl" >> /opt/kpt/push.txt
        cat /opt/kpt/push.txt | curl --data-binary @- http://"${dev_push}"/metrics/job/"${dev_job}"/city/"${dev_city}"/tcp/"${dev_tcp}"/region/"${dev_region}"/instance/"${all_kpt[$i]}-Plan"
  fi
  count_s_total=$(snmpget -v 2c -c public ${all_kpt[$i]} .1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.54.2.2.1.3.4 | awk '{print $4}')
  if [[ $count_s_total > 0 ]]
    then echo -e " count scan total = $count_s_total"
        echo -e "# TYPE print_scan gauge" > /opt/kpt/push.txt
        echo -e "print_scan $count_s_total" >> /opt/kpt/push.txt
        cat /opt/kpt/push.txt | curl --data-binary @- http://"${dev_push}"/metrics/job/"${dev_job}"/city/"${dev_city}"/tcp/"${dev_tcp}"/region/"${dev_region}"/instance/"${all_kpt[$i]}-Total"
  fi
done
#===========================================================================================================================================
# Scan from Kyo_2035 Kyo_2035 Kyo_2040 Kyo_2540
all_kpt=(Kyo_2035 Kyo_2035 Kyo_2040 Kyo_2540)
for i in ${!all_kpt[@]} ; do

  echo -n "${all_kpt[$i]}"
  count_p=$(snmpget -v 2c -c public ${all_kpt[$i]} 1.3.6.1.4.1.1347.43.10.1.1.12.1.1 | awk '{print $4}')
  if [[ $count_p > 0 ]]
    then echo -e " count print = $count_p"
        echo -e "# TYPE print_list gauge" > /opt/kpt/push.txt
        echo -e "print_list $count_p" >> /opt/kpt/push.txt
        cat /opt/kpt/push.txt | curl --data-binary @- http://"${dev_push}"/metrics/job/"${dev_job}"/city/"${dev_city}"/tcp/"${dev_tcp}"/region/"${dev_region}"/instance/"${all_kpt[$i]}-Black"
  fi
  echo -n "${all_kpt[$i]}"
  count_s_total=$(snmpget -v 2c -c public ${all_kpt[$i]} .1.3.6.1.4.1.1347.46.10.1.1.5.3 | awk '{print $4}')
  if [[ $count_s_total > 0 ]]
    then echo -e " count scan total = $count_s_total"
        echo -e "# TYPE print_scan gauge" > /opt/kpt/push.txt
        echo -e "print_scan $count_s_total" >> /opt/kpt/push.txt
        cat /opt/kpt/push.txt | curl --data-binary @- http://"${dev_push}"/metrics/job/"${dev_job}"/city/"${dev_city}"/tcp/"${dev_tcp}"/region/"${dev_region}"/instance/"${all_kpt[$i]}-Total"
  fi
done

rm -rf /opt/kpt/push.txt
exit 0