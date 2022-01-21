## Nyttig info rundt HANA connectivity og SAP Client og i forhold til DBCO

### How to create a connection in DBCO and check if it works

* Use DBCO and create new connection
* If this is a HANA connection - see SAP Note *[1983389 - DBCON entry for SAP HANA](https://launchpad.support.sap.com/#/notes/1983389)*
  ```
  HOST=<host name>:<SQLPort>[,...,<host name>:<SQLPort>][;SCHEMA=<schema>][;CON_PARAM=<dbparam>,...,<dbparam>]

  HOST = list of <host>:<SQLPort>
  SCHEMA = Name of default schema
  CON_PARAM = List of additional parameters for the CONNECT, such as CONNECTTTIMEOUT, ENCRYPT, ...
  ```
* If this is a HANA Cloud connection (minimum Hana Client 2.4) - see SAP Note *[2874749 - SLT - SAP HANA Cloud as SLT Target](https://launchpad.support.sap.com/#/notes/2874749)*
  ```
  HOST=<Endpoint including port>;CON_PARAM=ENCRYPT=<TRUE/FALSE>,sslValidateCertificate=<true/false>
  ```
* Check the connection with transaction **SE38** (Run program), and program **ADBC_TEST_CONNECTION**
* If you get *10.709* errors - see SAP Note *[2213725 - How-To: Troubleshooting of -10709 errors](https://launchpad.support.sap.com/#/notes/2213725)*
* Run **HDBSQL** from within SAPGUI
  ```
  hdbsql -n some-nice-account-id.hana.prod-eu20.hanacloud.ondemand.com:443 -u MYUSER -p MYPASSWORD -j SELECT 1 from DUMMY;
  ```
  * Important that you also provide a SQL command, or else it will not show the connection and the eventual error
  * SM69 - and then select HDBSQL
    ![screenshot](https://github.com/bjornkasin/SAP-HANA-stubs/blob/main/SAPCLIENT/SM69%20output%20.jpg)

### Having the full knowledge og HDBQL connectivity with security

* See this blog: *[Secure connection from HDBSQL to SAP HANA Cloud](https://blogs.sap.com/2020/04/14/secure-connection-from-hdbsql-to-sap-hana-cloud/)*
* Another blog with excellent info: *[Create a User, Tables and Import Data Using SAP HANA HDBSQL](https://developers.sap.com/tutorials/hana-clients-hdbsql.html)*
* This blog gives an overview of the sapgenpse utility (Commoncryptolib) - *[Creating arbitrary PSEs using ‘sapgenpse’ command-line tool.](https://blogs.sap.com/2019/02/15/creating-arbitrary-pses-using-sapgenpse-command-line-tool./)*
* Another blog - *[SAPGENPSE Usage for PSE Files](http://sapbasisinfo.com/blog/2018/02/05/sapgenpse-usage-for-pse-files/)*

"sapgenpse" is the command line utility to manage all **PSE** (Personal Security Environment) operations easily on all operating systems.
SAP CommonCryptoLib is the SAP alternative for securing TLS/SSL communication.  On Mac and Linux, the deafult security library is openssl, however on Windws or when CommonCryptolib is installed, the is the active library.

The SAP HANA Client, when it detects the Commoncryptolib, requires then a default **.pse** file named "sapcli.pse", hence will throw an error, if the client tries to establish a scure communication, and the sapcli.pse isn't available and contains the necesary certificates.  Without Commoncryptolib, openssl will handle this with the updated certificates already installed and managed by your Linux or MacOS distribution.

