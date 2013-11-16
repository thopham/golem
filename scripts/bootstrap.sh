
aptgetupdate=true
if [ -f /var/cache/apt.lastday ]; then
    if [ `date +%Y-%m-%d` = `cat /var/cache/apt.lastday` ]; then
        echo 'apt-get already updated today'
        aptgetupdate=false
    fi
fi
if $aptgetupdate; then
    echo -n "apt-get update..."
    apt-get -y update -qq
    echo "done"
    date +%Y-%m-%d > /var/cache/apt.lastday
fi

if ! grep -q HEADLESS /etc/environment 
then
    echo 'setting HEADLESS="true"'
    echo 'HEADLESS="true"' >> /etc/environment    
fi
if ! grep -q GOLEM /etc/environment 
then
    echo 'setting GOLEM="true"'
    echo 'GOLEM="true"' >> /etc/environment    
fi
