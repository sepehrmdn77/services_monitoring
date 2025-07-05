#!/usr/bin/env bash
rm -f all_services.txt
rm -f exited_services.txt
rm -f running_services.txt
printf "\033[4m %-88s%-7s%-11s%-10s%-66s \033[0m\n" UNIT LOAD ACTIVE SUB DESCRIPTION > all_services.txt
printf "\033[4m %-88s%-7s%-11s%-10s%-66s \033[0m\n" UNIT LOAD ACTIVE SUB DESCRIPTION > exited_services.txt
printf "\033[4m %-88s%-7s%-11s%-10s%-66s \033[0m\n" UNIT LOAD ACTIVE SUB DESCRIPTION > running_services.txt
systemctl | grep ".service" >> all_services.txt
grep "exited" all_services.txt >> exited_services.txt
grep "running" all_services.txt >> running_services.txt
select option in "all_services.txt" "exited_services.txt" "running_services.txt";do
    cat $option
    rm -f all_services.txt
    rm -f exited_services.txt
    rm -f running_services.txt
    break
done
