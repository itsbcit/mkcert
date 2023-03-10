[ -z "$CERTNAMES" ] && CERTNAMES=$HOSTNAME
[ -z "$CERTFILE"  ] && CERTFILE=$HOME/cert.pem
[ -z "$KEYFILE"   ] && KEYFILE=$HOME/key.pem

export CAROOT

if [ -z "$CAROOT" ];then
    echo -n # do nothing
else
    [ -d $(dirname $CAROOT)   ] || mkdir -vp $(dirname $CAROOT)
fi

[ -d $(dirname $CERTFILE) ] || mkdir -vp $(dirname $CERTFILE)
[ -d $(dirname $KEYFILE)  ] || mkdir -vp $(dirname $KEYFILE)
      
/mkcert -cert-file=$CERTFILE -key-file=$KEYFILE $CERTNAMES

if [ -z "$CACERTFILE" ];then
    echo -n # do nothing
else
    [ -d $(dirname $CACERTFILE)   ] || mkdir -vp $(dirname $CACERTFILE)
    cp -nv $(/mkcert -CAROOT)/rootCA.pem $CACERTFILE || true
fi
