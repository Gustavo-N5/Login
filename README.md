# Comando para instalar o json-serve
cd json-serve
#
npm install -D json-server json-server-auth

# Startando servidor
json-server db.json -m ./node_modules/json-server-auth
