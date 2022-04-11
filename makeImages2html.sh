#!/bin/sh
# assumes images are under img/
F="/user/rico/images.html"
S="/user/rico/mystyle.css"

header (){
cat << EOF
<!DOCTYPE html>
<html>
<head>
<style>
html, body {
  height: 100%;
}

img.one {
  height: auto;
  width: auto;
}
img.two {
  height: 75%;
  width: 75%;
}

img.tre {
  height: 50%;
  width: 50%;
}

img.qua {
  height: 20%;
  width: 20%;
}

</style>
<link rel="stylesheet" href="mystyle.css">

</head>
<body>
EOF
}

mystyle () {
cat << EOF
body {
  background-color: lightblue;
}

h3 {
  color: red;
  font-family: verdana;
  margin-left: 20px;
  font-size: 100%
}


h4 {
  color: navy;
  font-family: verdana;
  margin-left: 20px;
  font-size: 80%
}

p {
  border: 2px solid powderblue;
  padding: 30px;
  margin: 50px;
}
EOF	
}

makefile () {
for i in `ls img/*`
 do
  echo "<img class=\"qua\"  src=\"$i\" alt=\"altimg\" width=\"600\" height=\"500\" > $i <br> <br>" >> $F
 done
echo "</body>" >> $F
echo "</html>" >> $F
}

if [ -e $F ]
then
   echo "removing: $F"
   rm $F
else
   echo "file not found: $F"
fi


# main
mystyle > $S
header > $F
makefile
echo "created: $F"
