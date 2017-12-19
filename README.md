# swagger-converter
image with api-spec-converter and swagger-converter 

run image:
 in your local directory create wadl and xsd to convert then run the image with this command:

 docker run -it -v $PWD:/wadl --rm tim/api-spec-converter --wadl wadl/<file wadl> --xsd wadl/<file xsd>

