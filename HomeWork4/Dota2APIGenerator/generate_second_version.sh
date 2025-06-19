mkdir ../Package
mkdir ../Package/OpenAPIClient
mkdir ../Package/OpenAPIClient/OpenAPIClient


DOTA_API_PATH="../Package/OpenAPIClient"
OUTPUT_PATH="./temp"

PACKAGE_PATH="$OUTPUT_PATH/OpenAPIClient"
PACKAGE_FILE_PATH="$OUTPUT_PATH/Package.swift"

openapi-generator generate -i "DotaAPISpec.json" --reserved-words-mappings Character=chdf -g swift5 --additional-properties=responseAs=AsyncAwait -o $OUTPUT_PATH

cp -r $PACKAGE_PATH/* $DOTA_API_PATH/OpenAPIClient
cp $PACKAGE_FILE_PATH $DOTA_API_PATH

rm -r $OUTPUT_PATH