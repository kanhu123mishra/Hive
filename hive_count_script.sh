# $1 inputfile name
# $2 hive db name = Hive_Database_Name like orders or product etc
# $3 hql path / hive.hql
# $4 count output /op.csv 

rm $3
rm $4
hive_db=$2
hql=$3
csv=$4
for i in `cat $1`
do
echo "select '$i',count(*) from $hive_db.$i;" >>  $hql
done
hive -e --silent=true --outputformat=csv2 -f $hql >> $csv
#Hive table counts are taken and stored in $csv file 
#Please provide full path of the files to which you want to get output
