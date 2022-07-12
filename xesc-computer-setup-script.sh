#!/bin/bash
# STM32 XESC computer setup script
# vamatis - 07/12/2022

echo " Starting the computer configuration "

echo " Downloading required packages "
apt update
apt -y install build-essential gcc-arm-none-eabi stlink-tools openocd git wget

echo " Creating directory structure "
mkdir XESC-Setup
cd XESC-Setup

echo " Pulling necessary files "
git clone https://github.com/vedderb/bldc-bootloader
git clone https://github.com/ClemensElflein/xesc_firmware.git
mkdir configs
cd configs
wget https://github.com/ClemensElflein/OpenMower/blob/main/configs/xESC/YardForce_Classic_Drive_Motor.xml
wget https://github.com/ClemensElflein/OpenMower/blob/main/configs/xESC/YardForce_Classic_Mower_Motor.xml
wget https://github.com/ClemensElflein/OpenMower/blob/main/configs/xESC/YardForce_SA650ECO_Drive_Motor.xml
wget https://github.com/ClemensElflein/OpenMower/blob/main/configs/xESC/YardForce_SA650ECO_Mower_Motor.xml
cd ../  

echo " Setting correct branches "
cd xesc_firmware
git checkout releases
cd ../

echo " Computer configuration complete! "
