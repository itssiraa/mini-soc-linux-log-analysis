#!/bin/bash

LOG_FILE="logs/auth.log"
REPORT_FILE="reports/report_"$(date +%F_%H-%M-%S)".txt"
ALERT=0

echo "=== ANALYSE SOC ==="> $REPORT_FILE

ROOT_SESSIONS=$(grep "session opened for user root" $LOG_FILE | wc -l)
echo "Nombre d'ouverture de sessions root : $ROOT_SESSIONS" >> $REPORT_FILE

SUDO_SESSIONS=$(grep "session opened for user root" $LOG_FILE | grep sudo | wc -l)
echo "Nombre d'ouverture de sessions root ouvertes par sudo : $SUDO_SESSIONS">> $REPORT_FILE

PKEXEC_SESSIONS=$(grep "session opened for user root" $LOG_FILE | grep pkexec | wc -l)
echo "Nombre d'ouverture de sessions root ouvertes par pkexec : $PKEXEC_SESSIONS">> $REPORT_FILE

CRON_SESSIONS=$(grep "session opened for user root" $LOG_FILE | grep cron | wc -l)
echo "Nombre d'ouverture de sessions root ouvertes par cron : $CRON_SESSIONS">> $REPORT_FILE

if [ $ROOT_SESSIONS -gt 25 ]
then
	echo "CRITICAL : nombre élevé de sessions root.">> $REPORT_FILE
	ALERT=1
else 
  	echo "OK : nombre de sessions root normal" >> $REPORT_FILE
fi  


if [ $SUDO_SESSIONS -gt 15 ]
then
	echo "WARNING : Trop de connexions root via sudo">> $REPORT_FILE
	ALERT=1
else 
  	echo "OK : nombre de sessions root avec sudo normal" >> $REPORT_FILE
fi  

echo "=== CONCLUSION ===">> $REPORT_FILE	

if [ $ALERT -eq 1 ]
then
	echo "Une ou plusieurs anomalies détectées">> $REPORT_FILE
else 
  	echo "Aucune anomalie détectée">> $REPORT_FILE
fi  







