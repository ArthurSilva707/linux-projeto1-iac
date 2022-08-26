#!/bin/bash

echo "Criando diretório..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários + grupos existentes..."

#GRUPO ADM:

useradd carlos -c "Carlos ADM" -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_ADM
useradd maria -c "Maria ADM" -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_ADM
useradd joao -c "João ADM" -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_ADM

#GRUPO VEN: 

useradd debora -c "Débora Vendas" -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_VEN
useradd sebastiana -c "Sebastiana Vendas" -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_VEN
useradd roberto -c "Roberto Vendas" -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_VEN

#GRUPO SEC:

useradd josefina -c "Josefina Secretariado" -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_SEC
useradd amanda -c "Amanda Secretariado" -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_SEC
useradd rogerio -c "Rogério Secretariado" -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_SEC

echo "Especificando permissões dos diretórios..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

# 4=permissão de leitura 2=permissão para ler 1=permissão para executar e 0=nada

#users possuem permissão total
#outros permissão negada
#todos têm permissão total no diretório público

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Fim..."
