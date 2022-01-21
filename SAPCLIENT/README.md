## Nyttig info rundt HANA connectivity og SAP Client og i forhold til DBCO

### How to create a connection in DBCO and check if it works

* Use DBCO and create new connection
* If this is a HANA connection - see SAP Note *[1983389 - DBCON entry for SAP HANA](https://launchpad.support.sap.com/#/notes/1983389)*
* If this is a HANA Cloud connection (minimum Hana Client 2.4) - see SAP Note *[2874749 - SLT - SAP HANA Cloud as SLT Target](https://launchpad.support.sap.com/#/notes/2874749)*
  ```
    HOST=<Endpoint including port>;CON_PARAM=ENCRYPT=<TRUE/FALSE>,sslCryptoProvider=commoncrypto,sslValidateCertificate=<true/false>,proxy_port=<proxy_port>,proxy_host=<proxy_host>,proxyHTTP=true
  ```


### Having the full knowledge og HDBQL connectivity with security

* See this blog: *[Secure connection from HDBSQL to SAP HANA Cloud](https://blogs.sap.com/2020/04/14/secure-connection-from-hdbsql-to-sap-hana-cloud/)*
