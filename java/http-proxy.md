
From command line you'll use:

    java -Dhttp.proxyHost=localhost -Dhttp.proxyPort=8080 -jar YourJar.jar
With that all the http connections you perform will go through localhost at port 8080

The second is add this at the main method of your program:

    <code>
    public static void main( String [] args ) { 
        System.setProperty("http.proxyHost", "localhost");
        System.setPropery("http.proxyPort", "8080");
        ....
    }
    </code>

To create a proxy:

SOCKS is built in to OpenSSH, so it's a trivial matter to set up a local SOCKS proxy with the -D flag. For example:

    $ ssh -D 12345 myuser@remote_ssh_server
