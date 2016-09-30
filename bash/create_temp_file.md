    tmp=$(mktemp -d)
    function finish (){
      rm -rf ${tmp}
    }
    trap finish EXIT
