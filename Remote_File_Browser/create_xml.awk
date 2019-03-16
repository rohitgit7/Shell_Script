#!/bin/awk
/^d/{print "\t<Dir>"$NF"</Dir>"} 
/^-/{print "\t<File>\n\t\t<Name>"$6"</Name>\n\t\t<Owner>"$2"</Owner>\n\t\t<Permission>"$1"</Permission>\n\t\t<Date>"$3,$4,$5"</Date>\n\t</File>"} 
