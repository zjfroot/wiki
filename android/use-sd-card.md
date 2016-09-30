
    /data/app -> /sd-ext/app
    /data/app-private -> /sd-ext/app-private
    /data/dalvik-cache -> /sd-ext/dalvik-cache
    /data/data -> /sd-ext/data

    cd /data
    mv data /sd-ext/
    mv app /sd-ext/
    mv app-private /sd-ext

    ln -s /sd-ext/data data
    ln -s /sd-ext/app app
    ln -s /sd-ext/app-private app-private
